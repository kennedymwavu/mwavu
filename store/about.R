box::use(
  htmltools[tags, tagList],
  . / header[header],
)

#' About page
#'
#' @return [htmltools::tags]
#' @export
about <- \() {
  create_section_title <- \(title = NULL, subtitle = NULL) {
    tags$div(
      class = "container section-title",
      `data-aos` = "fade-up",
      tags$h2(title),
      tags$p(subtitle)
    )
  }

  create_details <- \(items, values) {
    list_items <- Map(
      f = \(item, value) {
        tags$li(
          tags$i(class = "bi bi-chevron-right"),
          tags$strong(item, ":"),
          tags$span(value)
        )
      },
      items,
      values
    )

    tags$ul(list_items)
  }
  details_on_left <- create_details(
    items = c("Birthday", "Website", "Phone", "City"),
    values = c("1 May 1995", "www.mwavu.com", "+254 721 231 292", "Nairobi, Kenya")
  )
  details_on_right <- create_details(
    items = c("Age", "Degree", "Email", "Freelance"),
    values = c("30", "Master", "mwavukennedy@gmail.com", "Available")
  )
  details <- tags$div(
    class = "row",
    tags$div(
      class = "col-lg-6",
      details_on_left
    ),
    tags$div(
      class = "col-lg-6",
      details_on_right
    )
  )

  create_skills <- \(items, values) {
    Map(
      f = \(item, value) {
        tags$div(
          class = "progress",
          tags$span(
            class = "skill",
            tags$span(item),
            tags$i(class = "val", paste0(value, "%"))
          ),
          tags$div(
            class = "progress-bar-wrap",
            tags$div(
              class = "progress-bar",
              role = "progressbar",
              `aria-valuenow` = value,
              `aria-valuemin` = "0",
              `aria-valuemax` = "100"
            )
          )
        )
      },
      items,
      values
    )
  }
  skills_on_left <- create_skills(
    items = c("HTML", "CSS", "JavaScript"),
    values = c("100", "90", "75")
  )
  skills_on_right <- create_skills(
    items = c("PHP", "WordPress/CMS", "Photoshop"),
    values = c("80", "90", 55)
  )
  skills <- tags$div(
    class = "row skills-content skills-animation",
    tags$div(
      class = "col-lg-6",
      skills_on_left
    ),
    tags$div(
      class = "col-lg-6",
      skills_on_right
    )
  )

  make_stats <- \(items, values) {
    Map(
      f = \(item, value) {
        tags$div(
          class = "col-lg-3 col-md-6",
          tags$div(
            class = "stats-item text-center w-100 h-100",
            tags$span(
              `data-purecounter-start` = "0",
              `data-purecounter-end` = value,
              `data-purecounter-duration` = 1,
              class = "purecounter",
            ),
            tags$p(item)
          )
        )
      },
      items,
      values
    )
  }
  stats <- tags$div(
    class = "row gy-4",
    make_stats(
      items = c("Clients", "Projects", "Hours Of Support", "Workers"),
      values = c(232, 521, 1453, 32)
    )
  )

  create_testimonials <- \(names, image_paths, job_titles, statements) {
    Map(
      f = \(name, image_path, job_title, statement) {
        tags$div(
          class = "swiper-slide",
          tags$div(
            class = "testimonial-item",
            tags$img(
              src = image_path,
              class = "testimonial-img",
              alt = ""
            ),
            tags$h3(name),
            tags$h4(job_title),
            tags$div(
              class = "stars",
              lapply(1:5, \(i) {
                tags$i(class = "bi bi-star-fill")
              })
            ),
            tags$p(
              tags$i(class = "bi bi-quote quote-icon-left"),
              tags$span(statement),
              tags$i(class = "bi bi-quote quote-icon-right")
            )
          )
        )
      },
      names,
      image_paths,
      job_titles,
      statements
    )
  }

  swiper_config_script <- tags$script(
    type = "application/json",
    class = "swiper-config",
    r'{
      {
        "loop": true,
        "speed": 600,
        "autoplay": {
          "delay": 5000
        },
        "slidesPerView": "auto",
        "pagination": {
          "el": ".swiper-pagination",
          "type": "bullets",
          "clickable": true
        }
      }
    }'
  )
  testimonial_items <- create_testimonials(
    names = c("Saul Goodman", "Sara Wilsson", "Jena Karlis", "Matt Brandon", "John Larson"),
    image_paths = paste0("assets/img/testimonials/testimonials-", 1:5, ".jpg"),
    job_titles = c("CEO &amp; Founder", "Designer", "Store Owner", "Freelancer", "Entrepreneur"),
    statements = strrep(
      x = "Enim nisi quem export duis labore cillum quae magna enim sint quorum nulla quem veniam duis minim tempor labore quem eram duis noster aute amet eram fore quis sint minim.",
      times = 5
    )
  )
  testimonials <- tags$div(
    class = "swiper init-swiper",
    swiper_config_script,
    tags$div(
      class = "swiper-wrapper",
      testimonial_items
    ),
    tags$div(class = "swiper-pagination")
  )

  tagList(
    header(active = "About"),
    tags$main(
      class = "main",
      tags$section(
        id = "about",
        class = "about section",
        create_section_title(
          title = "About",
          subtitle = "Necessitatibus eius consequatur ex aliquid fuga eum quidem sint consectetur velit"
        ),
        tags$div(
          class = "container",
          `data-aos` = "fade-up",
          `data-aos-delay` = "100",
          tags$div(
            class = "row gy-4 justify-content-center",
            tags$div(
              class = "col-lg-4",
              tags$img(
                src = "assets/img/profile-img.jpg",
                class = "img-fluid",
                alt = "Kennedy Mwavu"
              )
            ),
            tags$div(
              class = "col-lg-8 content",
              tags$h2("Software Developer"),
              tags$p(
                class = "fst-italic py-3",
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
              magna aliqua."
              ),
              details,
              tags$p(
                class = "py-3",
                "Officiis eligendi itaque labore et dolorum mollitia officiis optio vero. Quisquam sunt adipisci omnis et ut. Nulla accusantium dolor incidunt officia tempore. Et eius omnis.
              Cupiditate ut dicta maxime officiis quidem quia. Sed et consectetur qui quia repellendus itaque neque."
              )
            )
          )
        )
      ),
      tags$section(
        id = "skills",
        class = "skills section",
        create_section_title(
          title = "Skills",
          subtitle = "Necessitatibus eius consequatur ex aliquid fuga eum qudem sint consectetur elit"
        ),
        tags$div(
          class = "container",
          `data-aos` = "fade-up",
          `data-aos-delay` = "100",
          skills
        )
      ),
      tags$section(
        id = "stats",
        class = "stats section",
        create_section_title(
          title = "Facts",
          subtitle = "Necessitatibus eius consequatur ex aliquid fuga eum qudem sint consectetur elit"
        ),
        tags$div(
          class = "container",
          `data-aos` = "fade-up",
          `data-aos-delay` = "100",
          stats
        )
      ),
      tags$section(
        id = "testimonials",
        class = "testimonials section",
        create_section_title(
          title = "Testimonials",
          subtitle = "Necessitatibus eius consequatur ex aliquid fuga eum qudem sint consectetur elit"
        ),
        tags$div(
          class = "container",
          `data-aos` = "fade-up",
          `data-aos-delay` = "100",
          testimonials
        )
      )
    )
  )
}
