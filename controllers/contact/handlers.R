box::use(
  mime, # used by `ambiorix::parse_multipart()`
  htmltools[tags, tagList],
  ambiorix[parse_multipart],
  . / send_message[send_message],
  . /
    validations[
      validate_name,
      validate_email,
      validate_message,
      validate_subject,
    ],
  .. /
    .. /
    store /
    mod[
      page_meta,
      contact_page = contact,
      contact_form,
      toastr_error,
      toastr_success,
      default_contact_form,
    ],
  .. / .. / templates / path[template_path],
)

#' Handle GET at '/contact'
#'
#' @export
contact_get <- \(req, res) {
  res$render(
    template_path("page.html"),
    list(
      title = "Kennedy Mwavu - Contact",
      content = contact_page(),
      metatags = page_meta(label = "Contact Me")
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

  msg <- sprintf(
    "Thank you, %s! Your message has been sent. I'll get back to you soon.",
    name$value
  )
  response <- container(
    toastr_success(msg = msg),
    default_contact_form()
  )

  res$send(response)
}
