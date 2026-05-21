box::use(
  hypertext[
    tags,
    tag_list,
  ],
  . / header[header],
  . / create_section_title[create_section_title],
)

packages_catalog <- list(
  list(
    name = "ambiorix",
    role = "Maintainer",
    description = paste(
      "Web framework inspired by Express.js — build web apps and APIs in R.",
      "Gives developers full control over the request-response cycle with routing,",
      "middleware, and static file serving out of the box."
    ),
    url = "https://ambiorix.dev",
    url_label = "ambiorix.dev",
    icon_class = "bi bi-globe2"
  ),
  list(
    name = "hypertext",
    role = "Creator",
    description = paste(
      "A deterministic, framework-agnostic DSL for building HTML nodes and",
      "rendering them to a string. Provides tags, tag_list, and render() \u2014",
      "the foundation this very site is built on."
    ),
    url = "https://cran.r-project.org/web/packages/hypertext/index.html",
    url_label = "CRAN: hypertext",
    icon_class = "bi bi-file-code"
  ),
  list(
    name = "firebase.auth.rest",
    role = "Creator",
    description = paste(
      "R wrapper for the Firebase Authentication REST API, designed for use on the",
      "backend of R applications and APIs. Full control over login and registration",
      "flows while still leveraging Firebase Auth."
    ),
    url = "https://kennedymwavu.github.io/firebase.auth.rest/",
    url_label = "kennedymwavu.github.io/firebase.auth.rest",
    icon_class = "bi bi-shield-lock"
  ),
  list(
    name = "rmon",
    role = "Creator",
    description = paste(
      "R's equivalent of nodemon. Monitors source files for changes and automatically",
      "restarts scripts, Shiny apps, Ambiorix servers, or executes arbitrary R expressions",
      "— so you can focus on coding instead of restarting manually."
    ),
    url = "https://kennedymwavu.github.io/rmon/",
    url_label = "kennedymwavu.github.io/rmon",
    icon_class = "bi bi-arrow-repeat"
  ),
  list(
    name = "micromodal",
    role = "Creator",
    description = paste(
      "Simple and elegant modal dialogs for R Shiny via Micromodal.js.",
      "Drop it in with a single use_micromodal() call and trigger modals",
      "from any UI element."
    ),
    url = "https://kennedymwavu.github.io/micromodal/",
    url_label = "kennedymwavu.github.io/micromodal",
    icon_class = "bi bi-window-stack"
  )
)

books_catalog <- list(
  list(
    name = "Ambiorix, R, and the Web",
    role = "Co-author",
    description = paste(
      "Discover the joy of building web applications and APIs using your",
      "favorite programming language (R, by the way)."
    ),
    url = "https://book.ambiorix.dev/",
    url_label = "Read Online",
    icon_class = "bi bi-book"
  )
)

talks_catalog <- list(
  list(
    name = "Building Web Apps and APIs in R with Ambiorix, posit::conf(2025)",
    role = "Co-presenter",
    description = paste(
      "Ambiorix reimagines web development in R, offering a flexible, autonomy-driven alternative.",
      "It gives developers full control over the request-response cycle, while providing essential",
      "web features like routing and middleware out of the box \u2014 ideal for developing large web",
      "applications and APIs. This talk covers what sets Ambiorix apart, its key advantages for",
      "developers, and how it streamlines building web products & services in R."
    ),
    url = "https://youtu.be/2xZwPJHx4z8?si=TzCHTX57QwJlb5h8",
    url_label = "Watch on YouTube",
    icon_class = "bi bi-play-circle"
  )
)

#' Portfolio Item Card
#'
#' @param pkg List of named lists /// Required.
#'            Each of the named lists must have these fields:
#'            - name
#'            - role
#'            - description
#'            - url
#'            - url_label
#'            - icon_class
#'
#' @param class Character vector /// Optional.
#'              CSS classes to apply to the container div.
#'
#' @param data_aos_delay Scalar numeric /// Optional.
#'                       Animate On Scroll (AOS) delay.
#'
#' @return [hypertext::tags()]
PortfolioItemCard <- function(
  pkg,
  class = "col-lg-4 col-md-6",
  data_aos_delay = 100
) {
  tags$div(
    class = class,
    `data-aos` = "fade-up",
    `data-aos-delay` = data_aos_delay,
    tags$div(
      class = "portfolio-pkg-card",
      tags$div(
        class = "portfolio-pkg-card__header",
        tags$i(class = pkg$icon_class),
        tags$span(
          class = "portfolio-pkg-card__role",
          pkg$role
        )
      ),
      tags$h3(
        class = "portfolio-pkg-card__name",
        pkg$name
      ),
      tags$p(
        class = "portfolio-pkg-card__desc",
        pkg$description
      ),
      tags$a(
        class = "portfolio-pkg-card__link",
        href = pkg$url,
        target = "_blank",
        rel = "noopener noreferrer",
        tags$i(class = "bi bi-arrow-up-right"),
        pkg$url_label
      )
    )
  )
}

#' Portfolio page
#'
#' @return [hypertext::tag_list]
#' @export
portfolio <- function() {
  pkg_cards <- Map(
    f = PortfolioItemCard,
    pkg = packages_catalog,
    data_aos_delay = seq_along(packages_catalog) * 100
  )

  book_cards <- Map(
    f = PortfolioItemCard,
    pkg = books_catalog,
    class = "col-12",
    data_aos_delay = seq_along(books_catalog) * 100
  )

  talk_items <- Map(
    f = PortfolioItemCard,
    pkg = talks_catalog,
    class = "col-12",
    data_aos_delay = seq_along(talks_catalog) * 100
  )

  tag_list(
    header(active = "Portfolio"),
    tags$main(
      class = "main",
      tags$section(
        class = "portfolio-packages section",
        create_section_title(
          title = "R Packages",
          subtitle = "Open-source R packages I've built and maintain."
        ),
        tags$div(
          class = "container",
          tags$div(
            class = "row gy-4",
            pkg_cards
          )
        )
      ),
      tags$section(
        class = "portfolio-books section",
        create_section_title(
          title = "Books",
          subtitle = "Notes and hard-earned lessons turned into books."
        ),
        tags$div(
          class = "container",
          tags$div(
            class = "row gy-4",
            book_cards
          )
        )
      ),
      tags$section(
        class = "portfolio-talks section",
        create_section_title(
          title = "Talks",
          subtitle = "Conference talks and presentations."
        ),
        tags$div(
          class = "container",
          tags$div(
            class = "row gy-4",
            talk_items
          )
        )
      )
    )
  )
}
