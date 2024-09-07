#' @export
box::use(
  . / home[home],
  . / about[about],
  . / resume[
    resume,
    download_resume,
  ],
  . / services[services],
  . / contact / handlers[contact_get, contact_post],
)
