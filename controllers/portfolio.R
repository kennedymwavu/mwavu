box::use(
  hypertext[
    render,
  ],
  .. / templates / path[template_path],
  .. /
    store[
      page_meta,
      portfolio_page = portfolio,
    ],
)

#' Handle GET at '/portfolio'
#'
#' @export
portfolio_get <- function(req, res) {
  res$render(
    template_path("page.html"),
    list(
      title = "Kennedy Mwavu - Portfolio",
      content = portfolio_page() |> render(),
      metatags = page_meta(label = "Portfolio") |> render()
    )
  )
}
