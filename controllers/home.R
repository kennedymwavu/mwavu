#' Handle GET at '/'
#'
#' @export
home <- \(req, res) {
  res$send("hello, world! how are you?")
}
