#' @export
box::use(
  . / home[home],
  . / about[about],
  . /
    resume[
      resume,
      download_resume,
    ],
  . /
    services[
      services,
      service_detail,
    ],
  . / contact / handlers[contact_get, contact_post],
)
