box::use(
  httr2[
    request,
    req_perform,
    req_body_json,
    resp_body_json,
    req_body_multipart,
  ],
  .. /
    .. /
    helpers /
    mod[
      get_env_var,
    ]
)

#' Send message via telegram
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
  msg <- paste0(
    paste("Subject:", subject),
    "\n",
    paste("Name:", client_name),
    "\n",
    paste("Email:", client_email),
    "\n\n",
    message
  )

  path <- sprintf(
    "https://api.telegram.org/bot%s/sendMessage",
    get_env_var(name = "TG_BOT_TOKEN")
  )

  req <- request(path) |>
    req_body_multipart(
      chat_id = get_env_var(name = "TG_CHAT_ID"),
      text = msg,
      parse_mode = "HTML"
    )

  tryCatch(
    expr = {
      out <- req |>
        req_perform() |>
        resp_body_json()

      out
    },
    error = \(e) {
      print(conditionMessage(e))
      list(ok = FALSE)
    }
  )
}
