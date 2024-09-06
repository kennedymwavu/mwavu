box::use(
  httr2[
    request,
    req_perform,
    req_url_path,
    last_response,
    req_body_form,
    req_auth_basic,
    resp_body_json,
  ],
  htmltools[tags, tagList],
  ambiorix[parse_multipart],
  .. / store / mod[
    contact_page = contact,
    text_input,
    contact_form,
    toastr_error,
    toastr_success,
    text_area_input,
    default_contact_form,
  ],
  .. / helpers / operators[`%||%`],
  .. / templates / path[template_path],
)

#' Handle GET at '/contact'
#'
#' @export
contact_get <- \(req, res) {
  meta <- tagList(
    tags$meta(
      name = "description",
      content = "Kennedy Mwavu | Software Developer | Contact Me"
    ),
    tags$meta(
      name = "keywords",
      content = "Mwavu, Kennedy, Software Developer, R Programming"
    )
  )

  res$render(
    template_path("page.html"),
    list(
      title = "Kennedy Mwavu - Contact",
      content = contact_page(),
      metatags = meta
    )
  )
}


#' Handle POST at '/contact'
#'
#' @export
contact_post <- \(req, res) {
  body <- parse_multipart(req)
  name <- validate_name(body$name)
  email <- validate_email(body$email)
  subject <- validate_subject(body$subject)
  message <- validate_message(body$message)

  validated_form <- contact_form(
    name = name$validations,
    email = email$validations,
    subject = subject$validations,
    message = message$validations
  )
  container <- \(...) {
    tags$div(
      id = "form_container",
      class = "col-lg-7",
      ...
    )
  }

  all_ok <- name$ok && email$ok && subject$ok && message$ok
  if (!all_ok) {
    return(
      res$send(
        container(validated_form)
      )
    )
  }

  sent <- send_message(
    name = name$value,
    email = email$value,
    subject = subject$value,
    message = message$value
  )

  if (!sent$ok) {
    response <- container(
      toastr_error(
        msg = "An error occurred while sending your message. Please retry."
      ),
      validated_form
    )
    return(
      res$send(response)
    )
  }

  response <- container(
    toastr_success(
      msg = "Thank you! Your message has been sent. I'll get back to you soon."
    ),
    default_contact_form()
  )

  res$send(response)
}

#' Validate name
#'
#' @param name String. Name.
#' @return Named list:
#' - `ok`: Logical. Did all name validations pass?
#' - `value`: The name.
#' - `validations`: [htmltools::tags] The validated tags.
#' @export
validate_name <- \(name) {
  name <- name %||% ""
  ok <- nzchar(name)

  input_class <- "is-valid"
  validations <- NULL

  if (!ok) {
    input_class <- "is-invalid"
    validations <- tags$div(
      class = "invalid-feedback",
      "Please enter your name"
    )
  }

  list(
    ok = ok,
    value = name,
    validations = text_input(
      validations,
      label = "Your Name",
      id = "name",
      value = name,
      class = input_class
    )
  )
}

#' Validate email
#'
#' @param email String. email.
#' @return Named list:
#' - `ok`: Logical. Is email okay?
#' - `validations`: [htmltools::tags] The validated tags.
#' - `value`: The email.
#' @export
validate_email <- \(email) {
  email <- email %||% ""
  ok <- grepl(
    pattern = "\\<[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}\\>",
    x = email,
    ignore.case = TRUE
  )

  input_class <- "is-valid"
  validations <- NULL

  if (!ok) {
    input_class <- "is-invalid"

    validations <- tags$div(
      class = "invalid-feedback",
      "Please provide a valid email!"
    )
  }

  list(
    ok = ok,
    value = email,
    validations = text_input(
      validations,
      label = "Your Email",
      id = "email",
      type = "email",
      value = email,
      class = input_class
    )
  )
}

#' Validate subject
#'
#' @param subject String. Subject.
#' @return Named list:
#' - `ok`: Logical. Did all validations pass?
#' - `value`: The subject.
#' - `validations`: [htmltools::tags] The validated tags.
#' @export
validate_subject <- \(subject) {
  subject <- subject %||% ""
  ok <- nzchar(subject)

  input_class <- "is-valid"
  validations <- NULL

  if (!ok) {
    input_class <- "is-invalid"
    validations <- tags$div(
      class = "invalid-feedback",
      "Please enter the subject"
    )
  }

  list(
    ok = ok,
    value = subject,
    validations = text_input(
      validations,
      label = "Subject",
      id = "subject",
      value = subject,
      class = input_class
    )
  )
}

#' Validate message
#'
#' @param message String. Message.
#' @return Named list:
#' - `ok`: Logical. Did all validations pass?
#' - `value`: The message.
#' - `validations`: [htmltools::tags] The validated tags.
#' @export
validate_message <- \(message) {
  message <- message %||% ""
  ok <- nzchar(message)

  input_class <- "is-valid"
  validations <- NULL

  if (!ok) {
    input_class <- "is-invalid"
    validations <- tags$div(
      class = "invalid-feedback",
      "Please enter a message"
    )
  }

  list(
    ok = ok,
    value = message,
    validations = text_area_input(
      validations,
      label = "Message",
      id = "message",
      value = message,
      class = input_class
    )
  )
}

#' Send message via email
#'
#' @details This forwards the entered message to my inbox
#' @param name String. Name of sender.
#' @param email String. Email of sender.
#' @param subject String. Email subject.
#' @param message String. Message.
#' @return `NULL`
#' @export
send_message <- \(
  name,
  email,
  subject,
  message
) {
  message <- sprintf("From: %s\nEmail: %s\n\n%s", name, email, message)

  req <- request(base_url = "https://api.mailgun.net") |>
    req_url_path("/v3/mg.mwavu.com/messages") |>
    req_body_form(
      from = paste(name, "<mailgun@mg.mwavu.com>"),
      to = "mwavukennedy@gmail.com",
      subject = subject,
      text = message
    ) |>
    req_auth_basic(username = "api", password = Sys.getenv("MAILGUN_API_KEY"))


  tryCatch(
    expr = {
      out <- req |>
        req_perform() |>
        resp_body_json()
      out$ok <- TRUE
      out
    },
    error = \(e) {
      print(conditionMessage(e))
      list(ok = FALSE)
    }
  )
}
