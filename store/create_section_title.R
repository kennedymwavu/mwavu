box::use(
  hypertext[tags]
)

#' Create section title
#'
#' @param title String, [htmltools::tags]. The title.
#' @param subtitle String, [htmltools::tags]. Subtitle.
#' @return [htmltools::tags]
#' @export
create_section_title <- function(title = NULL, subtitle = NULL) {
  tags$div(
    class = "container section-title",
    `data-aos` = "fade-up",
    if (!is.null(title)) {
      tags$h2(title)
    },
    if (!is.null(subtitle)) {
      tags$p(subtitle)
    }
  )
}
