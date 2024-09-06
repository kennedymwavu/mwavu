box::use(
  htmltools[tags, tagList],
  .. / store / mod[about_page = about],
  .. / templates / path[template_path],
)

#' Handle GET at '/about'
#'
#' @export
about <- \(req, res) {
  meta <- tagList(
    tags$meta(
      name = "description",
      content = "Kennedy Mwavu | Software Developer | About"
    ),
    tags$meta(
      name = "keywords",
      content = "Mwavu, Kennedy, Software Developer, R Programming"
    )
  )

  res$render(
    template_path("page.html"),
    list(
      title = "Kennedy Mwavu - About",
      content = about_page(),
      metatags = meta
    )
  )
}
