box::use(
  htmltools[tags, tagList],
  . / header[header],
  . / create_section_title[create_section_title],
)

#' About page
#'
#' @return [htmltools::tags]
#' @export
about <- \() {
  details_on_left <- create_details(
    items = c("Blog", "Interests", "Hobbies"),
    values = list(
      tags$a(
        href = "https://blog.mwavu.com/",
        target = "_blank",
        "blog.mwavu.com"
      ),
      "Computers & Programming",
      "Painting, Philosophy"
    )
  )
  details_on_right <- create_details(
    items = c("Degree", "City"),
    values = c(
      "BSc Actuarial Science",
      "Nairobi, Kenya"
    )
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

  skills_on_left <- create_skills(
    items = c("R", "REST APIs", "Docker"),
    values = c("100", "90", "75")
  )
  skills_on_right <- create_skills(
    items = c(
      "Cloud Computing (Digital Ocean, GCP)",
      "Version Control (Git)",
      "Rust"
    ),
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

  stats <- tags$div(
    class = "row gy-4",
    make_stats(
      items = c(
        "Years Of Experience",
        "Clients",
        "Projects",
        "Hours Of Support"
      ),
      values = c(
        as.integer(format(Sys.Date(), "%Y")) - 2020,
        17,
        31,
        1453
      )
    )
  )

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
    names = c(
      "Humphreys Wanyanga",
      "John Coene",
      "Grace Zawadi",
      "William Wanyonyi"
    ),
    image_paths = paste0(
      "assets/img/testimonials/",
      c(
        "humphreys.jpeg",
        "john.png",
        "zawadi.jpeg",
        "william.jpeg"
      )
    ),
    job_titles = c(
      "COO, ACTSERV",
      "Founder, Opifex",
      "Project Manager, ACTSERV",
      "Business Development Lead, Seven Skies"
    ),
    statements = c(
      "Kennedy’s technical expertise and commitment to delivering high-quality solutions have been invaluable to our projects. His ability to solve complex problems efficiently makes him an essential part of any team.",
      "Kennedy’s contributions to the Ambiorix framework have been outstanding. His deep understanding of the framework and innovative input have greatly enhanced its capabilities. His dedication and expertise are evident in every aspect of his work.",
      "Working with Kennedy has been a pleasure. He’s reliable, proactive, and always goes the extra mile to ensure project success. His attention to detail and clear communication are exceptional.",
      "Kennedy has a unique blend of technical skills and business acumen. His innovative approach and dedication to client needs have greatly contributed to our growth and success."
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
          subtitle = "I write R for fun & profit."
        ),
        tags$div(
          class = "container",
          `data-aos` = "fade-up",
          `data-aos-delay` = "100",
          tags$div(
            class = "row gy-4 justify-content-center",
            tags$div(
              class = "col-lg-4 d-flex",
              tags$img(
                src = "assets/img/me.jpeg",
                class = "img-fluid object-fit-cover",
                alt = "Kennedy Mwavu"
              )
            ),
            tags$div(
              class = "col-lg-8 content",
              tags$h2("Software Developer"),
              tags$p(
                class = "fst-italic py-3",
                "I started programming in 2020, during the Covid-19 era, while in my second year at the University of Nairobi. A unit on R programming sparked a passion that I've pursued ever since, leading me to shift my focus from Actuarial Science to Software Development — and I've never looked back."
              ),
              details,
              tags$p(
                class = "py-3",
                "Whether it's automating workflows, developing web applications, or contributing to open-source projects, I enjoy building tools that genuinely improve users' lives."
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
          subtitle = "Where my expertise lies"
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
          title = "Highlights",
          subtitle = "The numbers that tell the story of my professional path"
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
          subtitle = "Hear from those I've had the pleasure of working with"
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

#' Create about page details
#'
#' @param items Character vector, list. Label of the details eg. "Interests".
#' @param values Character vector, list. Contents of `items` eg. "Programming"
#' @return [htmltools::tags]
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

#' Create skills
#'
#' @param items Character vector, list. Labels eg. "REST APIs".
#' @param values Integers. Rating out of 100.
#' @return [htmltools::tags]
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

#' Make stats items
#'
#' @param items Character vector, list. Labels eg. "Years of Experience".
#' @param values Character vector, list. Values corresponding to `items`.
#' @return [htmltools::tags]
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

#' Create testimonials
#'
#' @param names Character vector. Names of people giving testimonials.
#' @param image_paths Character vector. Paths to the images of those people.
#' @param job_titles Character vector. Their job titles.
#' @param statements Character vector. The testimonials.
#' @return [htmltools::tags]
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
