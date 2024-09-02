#' Handle GET at '/about'
#'
#' @export
about <- \(req, res) {
  res$send("about me")
}
