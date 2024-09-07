box::use(
  htmltools[tags, tagList],
  .. / templates / path[template_path],
  .. / store / mod[
    page_meta,
    services_page = services,
  ],
)

#' Handle GET at '/services'
#'
#' @export
services <- \(req, res) {
  res$render(
    template_path("page.html"),
    list(
      title = "Kennedy Mwavu - Services",
      content = services_page(),
      metatags = page_meta(label = "Services")
    )
  )
}
