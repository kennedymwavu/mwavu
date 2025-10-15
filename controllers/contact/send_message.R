box::use(
  httr2[
    request,
    req_headers,
    req_perform,
    req_url_path,
    last_response,
    req_body_json,
    req_auth_basic,
    resp_body_json,
  ],
  .. /
    .. /
    helpers /
    mod[
      get_env_var,
    ]
)

#' Send message via email
#'
#' @details This forwards the entered message to my inbox
#' @param client_name String. Name of sender.
#' @param client_email String. Email of sender.
#' @param subject String. Email subject.
#' @param message String. Message.
#' @return Named list, the most important being:
#' - `ok`: Logical. Was message forwarded to my inbox successfully?
#' @export
send_message <- function(
  client_name,
  client_email,
  subject,
  message
) {
  subject <- sprintf("%s (from %s)", subject, client_name)

  req <- request(base_url = "https://api.postmarkapp.com/email") |>
    req_headers(
      Accept = "application/json",
      `Content-Type` = "application/json",
      `X-Postmark-Server-Token` = get_env_var(name = "POSTMARK_SERVER_TOKEN"),
    ) |>
    req_body_json(
      data = list(
        From = get_env_var(name = "EMAIL"),
        To = get_env_var(name = "EMAIL"),
        ReplyTo = client_email,
        Subject = subject,
        TextBody = message,
        MessageStream = "outbound"
      )
    )

  tryCatch(
    expr = {
      out <- req |>
        req_perform() |>
        resp_body_json()

      out$ok <- identical(out$ErrorCode, 0L)
      out
    },
    error = \(e) {
      print(conditionMessage(e))
      list(ok = FALSE)
    }
  )
}
