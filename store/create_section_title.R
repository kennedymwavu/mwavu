box::use(
  htmltools[tags]
)

#' Create section title
#'
#' @param title String, [htmltools::tags]. The title.
#' @param subtitle String, [htmltools::tags]. Subtitle.
#' @return [htmltools::tags]
#' @export
create_section_title <- \(title = NULL, subtitle = NULL) {
  tags$div(
    class = "container section-title",
    `data-aos` = "fade-up",
    tags$h2(title),
    tags$p(subtitle)
  )
}
