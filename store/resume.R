box::use(
  hypertext[
    tags,
    tag_list,
  ],
  . / header[header],
  . / create_section_title[create_section_title],
)

#' Resume page
#'
#' @return [hypertext::tags]
#' @export
resume <- function() {
  summary <- create_resume_item(
    title = "Kennedy Mwavu",
    institution = paste(
      "I am a software developer focused on the intersection of",
      "R, data systems, and web infrastructure."
    ),
    items = c(
      "Programming Languages: R, SQL, JavaScript",
      "Tooling: Git, Docker"
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

  sigflux <- create_resume_item(
    title = "Founder",
    period = "March 2025 - Present",
    institution = "Sigflux Ltd",
    items = c(
      "Software for data teams."
    )
  )

  actserv <- create_resume_item(
    title = "Software Developer",
    period = "July 2021 - March 2025",
    institution = "Actuarial Services (EA) Ltd",
    items = c(
      paste(
        "Significantly boosted analytical productivity and accuracy of",
        "insurance client projects by building a data web application",
        "that cut runoff triangle processing time from 2 hours to 10 seconds."
      ),
      paste(
        "Enhanced compliance, reporting accuracy, and operational efficiency",
        "by liasing with the insurance team to develop comprehensive software",
        "modules for IFRS 17 insurance contracts."
      ),
      paste(
        "Ensured secure and efficient data exchange with third-party services",
        "by designing RESTful data APIs consumed by internal and external",
        "applications."
      ),
      paste(
        "Provided mentorship and ensured adherence to best software",
        "development practices by leading a team of junior developers in the",
        "design, development, and deployment of key software modules."
      ),
      paste(
        "Minimized errors and cut down processing time by over 80% by",
        "developing automated data processing pipelines that reduced",
        "manual intervention."
      )
    )
  )

  seven_skies <- create_resume_item(
    title = "Software Developer",
    period = "Jan 2023 - June 2023",
    institution = "Seven Skies Information & Research Ltd",
    items = c(
      paste(
        "Safeguarded sensitive client data and ensured compliance with",
        "industry standards by implementing robust security measures,",
        "including encryption, authentication, and authorization protocols."
      ),
      paste(
        "Improved system modularity, scalability, and maintainability by",
        "transitioning legacy monolithic applications to a microservices",
        "architecture."
      ),
      paste(
        "Enabled rapid and reliable application updates and deployments",
        "by setting up continuous integration and continuous deployment",
        "pipelines using GitHub Actions and Docker."
      ),
      paste(
        "Improved performance and user experience by optimizing data flow",
        "in existing R Shiny applications."
      ),
      paste(
        "Ensured seamless operation and scalability of applications by",
        "deploying them via the Google Cloud Platform (GCP)."
      )
    )
  )

  download_link <- tags$a(
    class = "btn-download-resume",
    href = "/download-resume",
    target = "_blank",
    "Download My Resume"
  )

  tag_list(
    header(active = "Resume"),
    tags$main(
      class = "main",
      tags$section(
        id = "resume",
        class = "resume section",
        create_section_title(
          title = "My resume",
          subtitle = paste(
            "I have left a mark across several organizations",
            "and many codebases. The achievements over the",
            "years cannot all fit on a single piece",
            "of paper, but here's a snapshot of my qualifications,",
            "work history, and education."
          )
        ),
        tags$div(
          class = "container",
          tags$div(
            class = "row",
            tags$div(
              class = "col-lg-12",
              `data-aos` = "fade-up",
              `data-aos-delay` = "100",
              tags$h3(
                class = "resume-title",
                "Summary"
              ),
              summary,
              tags$h3(
                class = "resume-title",
                "Professional Experience"
              ),
              sigflux,
              actserv,
              seven_skies,
              tags$h3(
                class = "resume-title",
                "Education"
              ),
              university,
              high_school,
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
#' @return [hypertext::tags]
create_resume_item <- function(
  title = NULL,
  period = NULL,
  institution = NULL,
  items = NULL,
  class = NULL
) {
  class <- c("resume-item", class)

  title <- if (!is.null(title)) {
    tags$h4(
      title
    )
  }

  period <- if (!is.null(period)) {
    tags$p(
      tags$em(
        period
      )
    )
  }

  institution <- if (!is.null(institution)) {
    tags$h5(
      institution
    )
  }

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
    institution,
    period,
    items
  )
}
