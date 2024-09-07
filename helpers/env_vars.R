#' Get mailgun API key
#'
#' Checks for the env var `MAILGUN_API_KEY` in the `.Renviron` file.
#' @return String.
#' @export
get_mg_api_key <- \() {
  key <- Sys.getenv("MAILGUN_API_KEY")
  if (identical(key, "")) {
    msg <- paste(
      "Mailgun API key not found!",
      "Set the `MAILGUN_API_KEY` variable in your `.Renviron`"
    )
    stop(msg, call. = FALSE)
  }
  key
}

#' Get mailgun sending domain
#'
#' Checks for the env var `MAILGUN_SENDING_DOMAIN` in the `.Renviron` file.
#' @return String.
#' @export
get_mg_sending_domain <- \() {
  domain <- Sys.getenv("MAILGUN_SENDING_DOMAIN")
  if (identical(domain, "")) {
    msg <- paste(
      "Mailgun sending domain not found!",
      "Set the `MAILGUN_SENDING_DOMAIN` variable in your `.Renviron`"
    )
    stop(msg, call. = FALSE)
  }
  domain
}

#' Get email to forward messages to
#'
#' Checks for the env var `EMAIL` in the `.Renviron` file.
#' @return String.
#' @export
get_email <- \() {
  email <- Sys.getenv("EMAIL")
  if (identical(email, "")) {
    msg <- paste(
      "Email to forward messages to not found!",
      "Set the `EMAIL` variable in your `.Renviron`"
    )
    stop(msg, call. = FALSE)
  }
  email
}
