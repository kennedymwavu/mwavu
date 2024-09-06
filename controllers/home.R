box::use(
  htmltools[tags, tagList],
  .. / templates / path[template_path],
  .. / store / mod[
    home_page = home,
  ]
)

#' Handle GET at '/'
#'
#' @export
home <- \(req, res) {
  meta <- tagList(
    tags$meta(
      name = "description",
      content = "Kennedy Mwavu | Software Developer | Home"
    ),
    tags$meta(
      name = "keywords",
      content = "Mwavu, Kennedy, Software Developer, R Programming"
    )
  )

  res$render(
    template_path("page.html"),
    list(
      title = "Kennedy Mwavu - Home",
      content = home_page(),
      metatags = meta
    )
  )
}
