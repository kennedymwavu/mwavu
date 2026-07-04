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
    institution = NULL,
    items = c(
      paste(
        "I am a software developer focused on the intersection of",
        "R, data systems, and web infrastructure."
      ),
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
        "Built *GenVal*, an actuarial valuation platform",
        "used for insurance reserving, reporting, and analytical workflows."
      ),
      paste(
        "Optimized actuarial computations, reducing runoff triangle processing",
        "from approximately two hours to ten seconds using R and data.table."
      ),
      paste(
        "Developed IFRS 17 reporting modules, reserving models, REST APIs, and",
        "automated data processing pipelines supporting actuarial and insurance"
      ),
      paste(
        "Mentored junior developers, reviewed code, and contributed to the",
        "architecture of production R applications."
      )
    )
  )

  seven_skies <- create_resume_item(
    title = "Software Developer",
    period = "June 2020 - July 2021",
    institution = "Seven Skies Information & Research Ltd",
    items = c(
      paste(
        "Built a famine early warning dashboard for",
        "Kenya, visualizing forage conditions, climate indicators, and food",
        "security metrics across county, sub-county, and ward levels."
      ),
      paste(
        "Developed interactive geospatial visualizations using Leaflet, Mapbox,",
        "and shapefiles to support monitoring of forage conditions, trigger",
        "levels, and population-at-risk estimates."
      ),
      paste(
        "Integrated multiple environmental and food security datasets,",
        "implementing automated validation and ETL workflows for Excel, CSV, and",
        "SQLite data sources."
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
