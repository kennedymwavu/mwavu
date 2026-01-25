box::use(
  htmltools[tags, tagList],
  . / header[header],
  . / create_section_title[create_section_title],
)

services_catalog <- list(
  `software-development` = list(
    color = "cyan",
    svg_path_d = "M300,521.0016835830174C376.1290562159157,517.8887921683347,466.0731472004068,529.7835943286574,510.70327084640275,468.03025145048787C554.3714126377745,407.6079735673963,508.03601936045806,328.9844924480964,491.2728898941984,256.3432110539036C474.5976632858925,184.082847569629,479.9380746630129,96.60480741107993,416.23090153303,58.64404602377083C348.86323505073057,18.502131276798302,261.93793281208167,40.57373210992963,193.5410806939664,78.93577620505333C130.42746243093433,114.334589627462,98.30271207620316,179.96522072025542,76.75703585869454,249.04625023123273C51.97151888228291,328.5150500222984,13.704378332031375,421.85034740162234,66.52175969318436,486.19268352777647C119.04800174914682,550.1803526380478,217.28368757567262,524.383925680826,300,521.0016835830174",
    icon_class = "bi bi-code-slash",
    title = "Software Development",
    summary = tagList(
      tags$p(
        "I design and build software that exists to do a job, not to look impressive in screenshots.",
        "This includes web applications, internal tools, APIs, and systems that have to work under real-world",
        "constraints like bad data, changing requirements, and people pressing the wrong buttons."
      ),
      tags$p(
        "I handle the full lifecycle: shaping the problem, writing the code, shipping it, and keeping it alive in production."
      ),
      tags$p(
        "The goal is simple: software that is understandable, maintainable, and boring to operate."
      )
    )
  ),
  `consulting-and-advisory` = list(
    color = "indigo",
    svg_path_d = "M300,532.3542879108572C369.38199826031484,532.3153073249985,429.10787420159085,491.63046689027357,474.5244479745417,439.17860296908856C522.8885846962883,383.3225815378663,569.1668002868075,314.3205725914397,550.7432151929288,242.7694973846089C532.6665558377875,172.5657663291529,456.2379748765914,142.6223662098291,390.3689995646985,112.34683881706744C326.66090330228417,83.06452184765237,258.84405631176094,53.51806209861945,193.32584062364296,78.48882559362697C121.61183558270385,105.82097193414197,62.805066853699245,167.19869350419734,48.57481801355237,242.6138429142374C34.843463184063346,315.3850353017275,76.69343916112496,383.4422959591041,125.22947124332185,439.3748458443577C170.7312796277747,491.8107796887764,230.57421082200815,532.3932930995766,300,532.3542879108572",
    icon_class = "bi bi-calendar4-week icon",
    title = "Consulting & Advisory",
    summary = tagList(
      tags$p(
        "I help teams think clearly about software before they commit to bad decisions.",
        "That can mean reviewing architecture, simplifying over-engineered systems, or pushing",
        "back on ideas that sound good on paper but don’t survive contact with reality."
      ),
      tags$p(
        "This is not motivational consulting or framework worship.",
        "It’s practical, opinionated guidance focused on trade-offs, long-term costs, and building things you can still reason about a year from now."
      )
    )
  ),
  `technical-training-and-workshops` = list(
    color = "pink",
    svg_path_d = "M300,566.797414625762C385.7384707136149,576.1784315230908,478.7894351017131,552.8928747891023,531.9192734346935,484.94944893311C584.6109503024035,417.5663521118492,582.489472248146,322.67544863468447,553.9536738515405,242.03673114598146C529.1557734026468,171.96086150256528,465.24506316201064,127.66468636344209,395.9583748389544,100.7403814666027C334.2173773831606,76.7482773500951,269.4350130405921,84.62216499799875,207.1952322260088,107.2889140133804C132.92018162631612,134.33871894543012,41.79353780512637,160.00259165414826,22.644507872594943,236.69541883565114C3.319112789854554,314.0945973066697,72.72355303640163,379.243833228382,124.04198916343866,440.3218312028393C172.9286146004772,498.5055451809895,224.45579914871206,558.5317968840102,300,566.797414625762",
    icon_class = "bi bi-person-video3",
    title = "Technical Training & Workshops",
    summary = tagList(
      tags$p(
        "I run hands-on training sessions for developers who want to actually understand what they’re working with.",
        "These are practical workshops focused on how things fit together, why certain patterns exist, and when not to use them."
      ),
      tags$p(
        "No slide decks full of buzzwords, no artificial examples.",
        "We work with real problems, real code, and the kind of questions that come up once the tutorial ends and the job starts."
      )
    )
  )
)

service_list <- unname(services_catalog)

create_service_icon <- \(service) {
  tags$div(
    class = "icon",
    tags$svg(
      width = "100",
      height = "100",
      viewBox = "0 0 600 600",
      xmlns = "http://www.w3.org/2000/svg",
      tags$path(
        stroke = "none",
        `stroke-width` = "0",
        fill = "#f5f5f5",
        d = service$svg_path_d
      )
    ),
    tags$i(class = service$icon_class)
  )
}

#' Services page
#'
#' @return [htmltools::tagList]
#' @export
services <- \() {
  service_items <- Map(
    f = create_service_item,
    service = service_list,
    data_aos_delay = seq_along(service_list) * 100
  )

  tagList(
    header(active = "Services"),
    tags$main(
      class = "main",
      tags$section(
        id = "services",
        class = "services section",
        create_section_title(
          title = "Services",
          subtitle = tagList(
            tags$p(
              "Most software problems aren’t hard because of technology.",
              "They’re hard because of unclear thinking, rushed decisions, and systems that grew without a plan."
            ),

            tags$p(
              "My work is about reducing that mess:",
              "building software that’s easier to reason about, easier to change, and less stressful to run."
            )
          )
        ),
        tags$div(
          class = "container",
          tags$div(
            class = "row gy-4",
            service_items
          )
        )
      )
    )
  )
}


#' Create service item
#'
#' @param service List. A single service definition.
#' @param data_aos_delay Numeric. Delay for fade animation.
#' @return [htmltools::tags]
create_service_item <- \(service, data_aos_delay = 100) {
  tags$div(
    class = "col-lg-4 col-md-6",
    `data-aos` = "fade-up",
    `data-aos-delay` = data_aos_delay,
    tags$div(
      class = sprintf(
        "service-item item-%s position-relative d-block text-decoration-none text-reset",
        service$color
      ),
      `aria-label` = sprintf("Learn more about %s", service$title),
      create_service_icon(service),
      tags$h3(service$title),
      service$summary
    )
  )
}
