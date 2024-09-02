box::use(
  htmltools[tags, tagList],
  . / header[header],
)

#' Home page
#'
#' @export
home <- \() {
  tagList(
    header(active = "Home"),
    tags$main(
      class = "main",
      hero()
    )
  )
}

#' Hero section
#'
#' @export
hero <- \() {
  tags$section(
    id = "hero",
    class = "hero section",
    tags$img(
      src = "assets/img/hero-bg.jpg",
      alt = "",
      `data-aos` = "fade-in"
    ),
    tags$div(
      class = "container text-center",
      `data-aos` = "zoom-out",
      `data-aos-delay` = "100",
      tags$div(
        class = "row justify-content-center",
        tags$div(
          class = "col-lg-8",
          tags$h2("Kennedy Mwavu"),
          tags$p("From code to canvas, I paint your R vision"),
          tags$a(
            href = "/about",
            class = "btn-get-started",
            "About Me"
          )
        )
      )
    )
  )
}
