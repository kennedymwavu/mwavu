box::use(
  htmltools[tags, tagList],
  .. / templates / path[template_path],
  .. / store / mod[services_page = services],
)

#' Handle GET at '/services'
#'
#' @export
services <- \(req, res) {
  meta <- tagList(
    tags$meta(
      name = "description",
      content = "Kennedy Mwavu - Services"
    ),
    tags$meta(
      name = "keywords",
      content = "Mwavu, Kennedy, Services"
    )
  )

  res$render(
    template_path("page.html"),
    list(
      title = "Kennedy Mwavu - Services",
      content = services_page(),
      metatags = meta
    )
  )
}
