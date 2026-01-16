box::use(
  htmltools[tags],
  .. /
    .. /
    store /
    mod[
      text_input,
      text_area_input,
    ],
  .. / .. / helpers / operators[`%||%`],
)

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
  words <- strsplit(x = message, split = " ")[[1]]
  ok <- length(words) >= 10L

  input_class <- "is-valid"
  validations <- NULL

  if (!ok) {
    input_class <- "is-invalid"
    validations <- tags$div(
      class = "invalid-feedback",
      "Please enter a valid message"
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
