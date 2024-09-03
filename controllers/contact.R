box::use(
  htmltools[tags, tagList],
  ambiorix[parse_multipart],
  .. / store / mod[
    contact_page = contact,
    text_input,
    error_alert,
    contact_form,
    success_alert,
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
      content = "Kennedy Mwavu - Contact"
    ),
    tags$meta(
      name = "keywords",
      content = "Mwavu, Kennedy, Contact"
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

  all_ok <- name$ok && email$ok && subject$ok && message$ok
  if (!all_ok) {
    response <- contact_form(
      name = name$validations,
      email = email$validations,
      subject = subject$validations,
      message = message$validations
    )
    return(
      res$send(response)
    )
  }

  response <- tags$div(
    success_alert(),
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
    validations = text_input(
      validations,
      label = "Message",
      id = "message",
      value = message,
      class = input_class
    )
  )
}
