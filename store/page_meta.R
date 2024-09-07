box::use(
  htmltools[tags],
)

#' Page specific meta tag
#'
#' Added to each page as the "description" meta tag.
#' @param label String. Label eg. "Contact Me"
#' @return [htmltools::tags]
#' @export
page_meta <- \(label = NULL) {
  tags$meta(
    name = "description",
    content = paste("Kennedy Mwavu | Software Developer |", label)
  )
}
