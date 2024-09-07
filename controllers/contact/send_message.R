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
  .. / .. / helpers / mod[
    get_email,
    get_mg_api_key,
    get_mg_sending_domain,
  ]
)

#' Send message via email
#'
#' @details This forwards the entered message to my inbox
#' @param name String. Name of sender.
#' @param email String. Email of sender.
#' @param subject String. Email subject.
#' @param message String. Message.
#' @return Named list, the most important being:
#' - `ok`: Logical. Was message forwarded to my inbox successfully?
#' @export
send_message <- \(
  name,
  email,
  subject,
  message
) {
  message <- sprintf(
    "From: %s\nEmail: %s\nMessage:\n%s",
    name,
    email,
    message
  )
  path <- sprintf("/v3/%s/messages", get_mg_sending_domain())
  from <- sprintf("%s <mailgun@%s>", name, get_mg_sending_domain())

  req <- request(base_url = "https://api.mailgun.net") |>
    req_url_path(path) |>
    req_body_form(
      from = from,
      to = get_email(),
      subject = subject,
      text = message
    ) |>
    req_auth_basic(username = "api", password = get_mg_api_key())

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
