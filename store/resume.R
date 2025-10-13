box::use(
  htmltools[tags, tagList],
  . / header[header],
  . / create_section_title[create_section_title],
)

#' Resume page
#'
#' @return [htmltools::tags]
#' @export
resume <- \() {
  summary <- create_resume_item(
    title = "Kennedy Mwavu",
    institution = c(
      "I'm always aiming to make a tangible impact through my work. I seek out challenges that blend analytical thinking with creative problem-solving."
    ),
    items = c(
      "Programming Languages: R, JavaScript",
      "Version Control: Git, GitHub",
      "APIs: RESTful API design & development",
      "Containers: Docker",
      "Cloud Platforms: Google Cloud Platform, Digital Ocean"
    ),
    class = "pb-0"
  )

  university <- create_resume_item(
    title = "Bachelor's Degree",
    period = "Sept 2018 - Sept 2022",
    institution = "University of Nairobi",
    items = c(
      "BSc Actuarial Science"
    )
  )

  high_school <- create_resume_item(
    title = "Highschool Diploma",
    period = "Jan 2014 - Dec 2017",
    institution = "Alliance High School",
    items = c(
      "Kenya Certificate of Secondary Education (KCSE)"
    )
  )

  actserv <- create_resume_item(
    title = "Software Developer",
    period = "July 2021 - March 2025",
    institution = "Actuarial Services (EA) Ltd",
    items = c(
      "Revolutionized the efficiency of runoff triangle processing, cutting processing time from 2 hours to 10 seconds. This breakthrough significantly boosted analytical productivity and accuracy for client projects.",
      "Collaborated with the insurance team to develop comprehensive software modules for IFRS 17 insurance contracts, enhancing compliance, reporting accuracy, and operational efficiency.",
      "Designed RESTful APIs consumed by internal and external applications, ensuring secure and efficient data exchange when integrating with third-party services.",
      "Led a team of junior developers in the design, development and deployment of key software modules, providing mentorship and ensuring adherence to best coding practices.",
      "Developed automated data processing pipelines that reduced manual intervention, thereby minimizing errors and cutting down data processing time by over 80%."
    )
  )

  seven_skies <- create_resume_item(
    title = "Software Developer, Consultant",
    period = "Jan 2023 - June 2023",
    institution = "Seven Skies",
    items = c(
      "Implemented robust security measures, including encryption, authentication, and authorization protocols, safeguarding sensitive client data and ensuring compliance with industry standards.",
      "Transitioned legacy monolithic applications to a microservices architecture, improving system modularity, scalability and maintainability.",
      "Set up continuous integration and continuous deployment pipelines using GitHub Actions and Docker, enabling rapid and reliable application updates and deployments.",
      "Debugged and optimized R Shiny applications, improving performance and user experience.",
      "Deployed applications via Google Cloud Platform (GCP), ensuring seamless operation and scalability."
    )
  )

  download_link <- tags$a(
    class = "btn-download-resume",
    href = "/download-resume",
    target = "_blank",
    "Download My Resume"
  )

  tagList(
    header(active = "Resume"),
    tags$main(
      class = "main",
      tags$section(
        id = "resume",
        class = "resume section",
        create_section_title(
          title = "Resume",
          subtitle = "A snapshot of my professional growth & accomplishments"
        ),
        tags$div(
          class = "container",
          tags$div(
            class = "row",
            tags$div(
              class = "col-lg-6",
              `data-aos` = "fade-up",
              `data-aos-delay` = "100",
              tags$h3(
                class = "resume-title",
                "Summary"
              ),
              summary,
              tags$h3(
                class = "resume-title",
                "Education"
              ),
              university,
              high_school
            ),
            tags$div(
              class = "col-lg-6",
              `data-aos` = "fade-up",
              `data-aos-delay` = "200",
              tags$h3(
                class = "resume-title",
                "Professional Experience"
              ),
              actserv,
              seven_skies,
              tags$div(
                class = "text-center",
                download_link
              )
            )
          )
        )
      )
    )
  )
}

#' Create resume item
#'
#' @param title String. Title.
#' @param period String. Period eg. "Sept 2018 - Sept 2022".
#' @param institution String. Institution attended.
#' @param items Character vector. Items to include.
#' @param class Character vector. Classes to apply to the container div.
#' @return [htmltools::tags]
create_resume_item <- \(
  title = NULL,
  period = NULL,
  institution = NULL,
  items = NULL,
  class = NULL
) {
  class <- c("resume-item", class)
  title <- if (!is.null(title)) tags$h4(title)
  period <- if (!is.null(period)) tags$h5(period)
  institution <- if (!is.null(institution)) tags$p(tags$em(institution))
  items <- if (!is.null(items)) {
    tags$ul(
      lapply(items, \(item) {
        tags$li(item)
      })
    )
  }

  tags$div(
    class = class,
    title,
    period,
    institution,
    items
  )
}
