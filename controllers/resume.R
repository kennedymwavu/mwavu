#' Handle GET at '/resume'
#'
#' @export
resume <- \(req, res) {
  res$send("view my resume")
}
