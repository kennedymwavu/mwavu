#' Handle GET at '/services'
#'
#' @export
services <- \(req, res) {
  res$send("my services")
}
