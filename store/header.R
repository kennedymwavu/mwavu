box::use(
  htmltools[tags, tagList],
)

#' Page header
#'
#' @param active String. The active page. See [nav()].
#' @export
header <- \(active = NULL) {
  tags$header(
    id = "header",
    class = "header d-flex align-items-center light-background sticky-top",
    tags$div(
      class = "container-fluid position-relative d-flex align-items-center justify-content-between",
      tags$a(
        href = "/",
        class = "logo d-flex align-items-center me-auto me-xl-0",
        # use an image logo?
        # tags$img(
        #   src = "assets/img/logo.png",
        #   alt = ""
        # )
        tags$h1(
          class = "sitename",
          "Mwavu"
        )
      ),
      nav(active = active),
      social_links(class = "header-social-links")
    )
  )
}

#' Page nav bar
#'
#' @param active String. The active page. Must be one of:
#' - Home
#' - About
#' - Resume
#' - Services
#' - Portfolio
#' - Contact
#' @export
nav <- \(active = NULL) {
  page_hrefs <- c(
    "/", "/about", "/resume", "/services", "/contact"
  )
  page_labels <- c(
    "Home", "About", "Resume", "Services", "Contact"
  )
  page_list_items <- Map(
    f = \(href, label) {
      tags$li(
        tags$a(
          href = href,
          class = if (identical(label, active)) "active",
          label
        )
      )
    },
    page_hrefs,
    page_labels
  )

  tags$nav(
    id = "navmenu",
    class = "navmenu",
    tags$ul(page_list_items),
    tags$i(class = "mobile-nav-toggle d-xl-none bi bi-list")
  )
}

#' Social links
#'
#' @param class Character vector. Classes to apply to the container div of the
#' links.
#' @export
social_links <- \(class = NULL) {
  hrefs <- c(
    "https://x.com/kennedymwavu",
    "https://github.com/kennedymwavu",
    "https://www.linkedin.com/in/kennedymwavu/"
  )
  names <- c("twitter", "github", "linkedin")
  icons <- paste0(
    "bi bi-",
    c("twitter-x", "github", "linkedin")
  )

  links <- Map(
    f = \(href, name, icon) {
      tags$a(
        href = href,
        class = name,
        tags$i(class = icon)
      )
    },
    hrefs,
    names,
    icons
  )

  tags$div(
    class = class,
    links
  )
}
