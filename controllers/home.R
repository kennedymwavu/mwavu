box::use(
  htmltools[tags, tagList],
  .. / templates / path[template_path],
  .. /
    store /
    mod[
      page_meta,
      home_page = home,
    ]
)

#' Handle GET at '/'
#'
#' @export
home <- \(req, res) {
  res$render(
    template_path("page.html"),
    list(
      title = "Kennedy Mwavu - Home",
      content = home_page(),
      metatags = page_meta(label = "Home")
    )
  )
}
