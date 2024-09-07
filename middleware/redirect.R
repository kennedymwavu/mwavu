#' Redirect some requests
#'
#' @description
#' I was using GH pages to serve some of my sites + pkgs before. Now, I have
#' to redirect them so that the links are not broken.
#' @details
#' GH pages only accepts GET requests, so I don't have to worry about HTTP
#' methods.
#' @export
redirect <- \(req, res) {
  endpoints <- c(
    "/blog",
    "/rmon",
    "/micromodal",
    "/ambiorix-examples",
    "/frbs",
    "/firebase.auth.rest"
  )
  path <- req$PATH_INFO
  cond <- startsWith(x = path, prefix = endpoints) |>
    any() |>
    isTRUE()

  if (cond) {
    to <- paste0("https://kennedymwavu.github.io", path)
    return(
      res$set_status(301L)$redirect(to)
    )
  }
}
