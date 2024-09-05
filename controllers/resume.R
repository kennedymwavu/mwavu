box::use(
  htmltools[tags, tagList],
  .. / templates / path[template_path],
  .. / store / mod[resume_page = resume],
)

#' Handle GET at '/resume'
#'
#' @export
resume <- \(req, res) {
  meta <- tagList(
    tags$meta(
      name = "description",
      content = "Kennedy Mwavu - Resume"
    ),
    tags$meta(
      name = "keywords",
      content = "Mwavu, Kennedy, Resume"
    )
  )

  res$render(
    template_path("page.html"),
    list(
      title = "Kennedy Mwavu - Resume",
      content = resume_page(),
      metatags = meta
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
