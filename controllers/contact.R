#' Handle GET at '/contact'
#'
#' @export
contact_get <- \(req, res) {
  res$send("contact me via these channels:")
}

#' Handle POST at '/contact'
#'
#' @export
contact_post <- \(req, res) {
  res$send("message received. will get back to you!")
}
