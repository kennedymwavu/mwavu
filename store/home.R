box::use(
  hypertext[
    tags,
    tag_list,
  ],
  . / header[header],
)

#' Home page
#'
#' @export
home <- function() {
  tag_list(
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
hero <- function() {
  tags$section(
    id = "hero",
    class = "hero section",
    tags$div(
      class = "container text-center",
      `data-aos` = "zoom-out",
      `data-aos-delay` = "100",
      tags$div(
        class = "row justify-content-center",
        tags$div(
          class = "col-lg-8",
          tags$img(
            src = "assets/img/mwavu.png",
            class = "hero-avatar",
            alt = "Kennedy Mwavu"
          ),
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
