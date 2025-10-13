box::use(
  htmltools[tags, tagList],
  .. / templates / path[template_path],
  .. /
    store /
    mod[
      page_meta,
      resume_page = resume,
    ],
)

#' Handle GET at '/resume'
#'
#' @export
resume <- \(req, res) {
  res$render(
    template_path("page.html"),
    list(
      title = "Kennedy Mwavu - Resume",
      content = resume_page(),
      metatags = page_meta(label = "Resume")
    )
  )
}

#' Handle GET at '/download-resume'
#'
#' @export
download_resume <- \(req, res) {
  path <- file.path(
    box::file(),
    "resume.pdf"
  )

  binary <- readBin(
    con = path,
    what = "raw",
    n = file.info(path)$size
  )

  res$header("Content-Type", "application/pdf")
  res$header(
    "Content-Disposition",
    "attachment; filename=KennedyMwavu-SoftwareDeveloper-Resume.pdf"
  )
  res$send(binary)
}
