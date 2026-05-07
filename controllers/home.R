box::use(
  hypertext[
    tags,
    render,
  ],
  .. /
    templates /
    path[
      template_path,
    ],
  .. /
    store[
      page_meta,
      home_page = home,
    ]
)

#' Handle GET at '/'
#'
#' @export
home <- function(req, res) {
  res$render(
    template_path("page.html"),
    list(
      title = "Kennedy Mwavu - Home",
      content = home_page() |> render(),
      metatags = page_meta(label = "Home") |> render()
    )
  )
}
