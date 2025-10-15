box::use(
  emayili[
    server,
    envelope,
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
#' @param email String. Email of sender.
#' @param subject String. Email subject.
#' @param message String. Message.
#' @return Named list, the most important being:
#' - `ok`: Logical. Was message forwarded to my inbox successfully?
#' @export
send_message <- \(
  email,
  subject,
  message
) {
  email <- envelope(
    to = get_env_var("EMAIL"),
    from = get_env_var("EMAIL"),
    reply = email,
    subject = subject,
    text = message
  )

  smtp <- server(
    host = get_env_var("HOST"),
    port = as.integer(get_env_var("PORT")),
    use_ssl = TRUE,
    username = get_env_var("USERNAME"),
    password = get_env_var("PASSWORD")
  )

  tryCatch(
    expr = {
      out <- smtp(email, verbose = FALSE)

      status <- as.character(out$status_code) |> startsWith(prefix = "2")
      if (!status) {
        print("Something went wrong while sending a message.")
        print(out)
      }

      list(ok = status)
    },
    error = \(e) {
      print(conditionMessage(e))
      list(ok = FALSE)
    }
  )
}
