box::use(
  htmltools[tags],
  .. / helpers / mod[`%||%`]
)

#' Toastr
#'
#' @param type String. Type of the toast. Valid options are:
#' - info
#' - warning
#' - success
#' - error
#' @param title String. Title of the toast. Defaults to `NULL`.
#' @param msg String. Message to show in the toast. Defaults to `NULL`.
#' @return An object of class `shiny.tag`.
#' @export
toastr <- \(
  type = c("info", "warning", "success", "error"),
  title = NULL,
  msg = NULL
) {
  type <- match.arg(arg = type)
  title <- title %||% ""
  msg <- msg %||% ""

  tags$script(
    sprintf(
      'toastr["%s"]("%s", "%s");',
      type,
      msg,
      title
    )
  )
}

#' Info toastr
#'
#' @inheritParams toastr
#' @inherit toastr return
#' @export
toastr_info <- \(title = "", msg = NULL) {
  toastr(type = "info", title = title, msg = msg)
}

#' Warning toastr
#'
#' @inheritParams toastr
#' @inherit toastr return
#' @export
toastr_warning <- \(title = "Warning!", msg = NULL) {
  toastr(type = "warning", title = title, msg = msg)
}

#' Success toastr
#'
#' @inheritParams toastr
#' @inherit toastr return
#' @export
toastr_success <- \(title = "", msg = NULL) {
  toastr(type = "success", title = title, msg = msg)
}

#' Error toastr
#'
#' @inheritParams toastr
#' @inherit toastr return
#' @export
toastr_error <- \(title = "Error!", msg = NULL) {
  toastr(type = "error", title = title, msg = msg)
}
