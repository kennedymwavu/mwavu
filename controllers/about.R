box::use(
  htmltools[tags, tagList],
  .. / store / mod[
    page_meta,
    about_page = about,
  ],
  .. / templates / path[template_path],
)

#' Handle GET at '/about'
#'
#' @export
about <- \(req, res) {
  res$render(
    template_path("page.html"),
    list(
      title = "Kennedy Mwavu - About",
      content = about_page(),
      metatags = page_meta(label = "About")
    )
  )
}
