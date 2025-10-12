#' Get env var
#'
#' Checks for the env var in the `.Renviron` file.
#' @param name String. Name of the env var to check.
#' @return String. Value of the variable.
#' @export
get_env_var <- function(name) {
  key <- Sys.getenv(x = name)
  if (identical(key, "")) {
    msg <- sprintf(
      "Env var `%s` not found! Please set it in your `.Renviron` file.",
      name
    )
    stop(msg, call. = FALSE)
  }

  key
}
