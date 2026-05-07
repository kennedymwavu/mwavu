box::use(
  hypertext[
    render,
  ],
  .. / templates / path[template_path],
  .. /
    store[
      page_meta,
      services_page = services,
    ],
)

#' Handle GET at '/services'
#'
#' @export
services_get <- \(req, res) {
  res$render(
    template_path("page.html"),
    list(
      title = "Kennedy Mwavu - Services",
      content = services_page() |> render(),
      metatags = page_meta(label = "Services") |> render()
    )
  )
}
