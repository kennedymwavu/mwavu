box::use(
  htmltools[tags, tagList],
  .. / templates / path[template_path],
  .. / store / mod[
    contact_page = contact,
  ]
)

#' Handle GET at '/contact'
#'
#' @export
contact_get <- \(req, res) {
  meta <- tagList(
    tags$meta(
      name = "description",
      content = "Kennedy Mwavu - Contact"
    ),
    tags$meta(
      name = "keywords",
      content = "Mwavu, Kennedy, Contact"
    )
  )

  res$render(
    template_path("page.html"),
    list(
      title = "Kennedy Mwavu - Contact",
      content = contact_page(),
      metatags = meta
    )
  )
}


#' Handle POST at '/contact'
#'
#' @export
contact_post <- \(req, res) {
  res$send("message received. will get back to you!")
}
