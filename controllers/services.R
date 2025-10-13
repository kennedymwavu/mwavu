box::use(
  .. / templates / path[template_path],
  .. /
    store /
    mod[
      page_meta,
      services_page = services,
      service_detail_page = service_detail,
      service_detail_title,
      service_meta_label,
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

#' Build handler for service detail routes
#'
#' @param slug String. Service identifier.
#' @return function
#' @export
service_detail <- \(slug) {
  \(req, res) {
    title <- service_detail_title(slug)

    res$render(
      template_path("page.html"),
      list(
        title = sprintf("Kennedy Mwavu - %s", title),
        content = service_detail_page(slug),
        metatags = page_meta(label = service_meta_label(slug))
      )
    )
  }
}
