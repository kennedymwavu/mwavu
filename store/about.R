box::use(
  hypertext[
    tags,
    tag_list,
  ],
  . / header[header],
  . / create_section_title[create_section_title],
)

#' About page
#'
#' @return [hypertext::tags]
#' @export
about <- function() {
  details_on_left <- create_details(
    x = list(
      Interests = "Computers & Programming",
      Hobbies = "Farming, Generative Art",
      Degree = "Actuarial Science (UoN)"
    )
  )
  details_on_right <- create_details(
    x = list(
      Blog = tags$a(
        href = "https://blog.mwavu.com/",
        target = "_blank",
        "blog.mwavu.com"
      ),
      YouTube = tags$a(
        href = "https://www.youtube.com/@kennedymwavu",
        target = "_blank",
        "youtube.com/@kennedymwavu"
      ),
      City = "Nairobi, Kenya"
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

  skill_names <- c(
    "R",
    "REST APIs",
    "Docker",
    "Git",
    "JavaScript"
  )
  skill_logos <- paste0(
    "assets/img/skills/",
    c(
      "r.svg",
      "openapi.svg",
      "docker.svg",
      "git.svg",
      "javascript.svg"
    )
  )

  skills <- tags$div(
    class = "row g-4 skills-grid",
    create_skills(skill_names, skill_logos)
  )

  testimonial_items <- create_testimonials(
    names = c(
      "John Coene",
      "Humphreys Wanyanga",
      "Grace Zawadi",
      "William Wanyonyi"
    ),
    image_paths = paste0(
      "assets/img/testimonials/",
      c(
        "john.png",
        "humphreys.jpeg",
        "zawadi.jpeg",
        "william.jpeg"
      )
    ),
    job_titles = c(
      "Founder, Opifex",
      "COO, ACTSERV",
      "Project Manager, ACTSERV",
      "Business Development Lead, Seven Skies Information & Research Ltd"
    ),
    statements = c(
      "Kennedy's contributions to the Ambiorix framework have been outstanding. His deep understanding of the framework and innovative input have greatly enhanced its capabilities. His dedication and expertise are evident in every aspect of his work.",
      "Kennedy's technical expertise and commitment to delivering high-quality solutions have been invaluable to our projects. His ability to solve complex problems efficiently makes him an essential part of any team.",
      "Working with Kennedy has been a pleasure. He's reliable, proactive, and always goes the extra mile to ensure project success. His attention to detail and clear communication are exceptional.",
      "Kennedy has a unique blend of technical skills and business acumen. His innovative approach and dedication to client needs have greatly contributed to our growth and success."
    )
  )
  testimonials <- tags$div(
    class = "row g-4",
    testimonial_items
  )

  tag_list(
    header(active = "About"),
    tags$main(
      class = "main",
      tags$section(
        id = "about",
        class = "about section",
        create_section_title(
          title = "About me",
          subtitle = NULL
        ),
        tags$div(
          class = "container",
          `data-aos` = "fade-up",
          `data-aos-delay` = "100",
          tags$div(
            class = "content",
            tags$p(
              class = "py-3",
              "My first encounter with programming was in my second year at",
              " the University of Nairobi. I picked up R for a statistics",
              " class, and it just grew on me. I found it elegant and",
              " beautiful. Then I became obsessed with writing programs. With",
              " that kind of passion, it didn't take me long to realize that",
              " I would do much better in Software Development than Actuarial",
              " Science (my major). So I made the switch, thanks to the",
              " internet and the power of self-learning.",
            ),
            tags$p(
              class = "py-3",
              "I've spent a good chunk of my career timeline building",
              " software with R. In the very early days it was only",
              " simple R scripts. Later, those turned into R packages",
              " and interactive dashboards, most of which were internal.",
              " I'm now in my era of fully-fledged data applications,",
              " APIs, and the boring glue that keeps products running.",
              " All in R.",
            ),
            tags$p(
              class = "py-3",
              "But in all this, one thing has remained constant: fun.",
              " The thrill of writing programs is addicting. This is a high",
              " I never want to get off of. So please, do not take me to",
              " rehab."
            ),
            details
          )
        )
      ),
      tags$section(
        id = "skills",
        class = "skills section",
        create_section_title(
          title = "Expertise",
          subtitle = "I can wield these in great skill... and more."
        ),
        tags$div(
          class = "container",
          `data-aos` = "fade-up",
          `data-aos-delay` = "100",
          skills
        )
      ),
      tags$section(
        id = "testimonials",
        class = "testimonials section",
        create_section_title(
          title = "Testimonials",
          subtitle = "Nice things people said (not coerced)"
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
#' @param x Named List /// Required.
#'          Data to create details for. Must be in the format `key = value`.
#'
#' @return [hypertext::tags]
create_details <- function(x) {
  list_items <- Map(
    f = \(key, value) {
      tags$li(
        tags$i(class = "bi bi-chevron-right"),
        tags$strong(key, ":"),
        tags$span(value)
      )
    },
    key = names(x),
    value = x
  )

  tags$ul(list_items)
}

#' Create skills
#'
#' @param items Character vector, list. Labels eg. "REST APIs".
#' @param logos Character vector. Paths to logo images.
#' @return [hypertext::tags]
create_skills <- function(items, logos) {
  Map(
    f = \(item, logo) {
      tags$div(
        class = "col-12 col-md-4 col-lg-3",
        tags$div(
          class = "skill-card d-flex align-items-center gap-3",
          tags$div(
            class = "skill-card__logo d-flex align-items-center justify-content-center",
            tags$img(
              src = logo,
              alt = item,
              class = "img-fluid"
            )
          ),
          tags$span(
            class = "skill-card__label text-uppercase fw-semibold",
            item
          )
        )
      )
    },
    items,
    logos
  )
}

#' Create testimonials
#'
#' @param names Character vector. Names of people giving testimonials.
#' @param image_paths Character vector. Paths to the images of those people.
#' @param job_titles Character vector. Their job titles.
#' @param statements Character vector. The testimonials.
#' @return [hypertext::tags]
create_testimonials <- function(names, image_paths, job_titles, statements) {
  Map(
    f = \(name, image_path, job_title, statement) {
      tags$div(
        class = "col-lg-6",
        tags$div(
          class = "testimonial-item",
          tags$div(
            class = "testimonial-header",
            tags$img(
              src = image_path,
              class = "testimonial-img",
              alt = name
            ),
            tags$div(
              tags$h3(name),
              tags$h4(job_title),
              tags$div(
                class = "stars",
                lapply(1:5, \(i) {
                  tags$i(class = "bi bi-star-fill")
                })
              )
            )
          ),
          tags$p(statement)
        )
      )
    },
    names,
    image_paths,
    job_titles,
    statements
  )
}
