box::use(
  htmltools[tags, tagList],
  . / header[header],
  . / create_section_title[create_section_title],
)

services_catalog <- list(
  `custom-software-development` = list(
    slug = "custom-software-development",
    color = "cyan",
    svg_path_d = "M300,521.0016835830174C376.1290562159157,517.8887921683347,466.0731472004068,529.7835943286574,510.70327084640275,468.03025145048787C554.3714126377745,407.6079735673963,508.03601936045806,328.9844924480964,491.2728898941984,256.3432110539036C474.5976632858925,184.082847569629,479.9380746630129,96.60480741107993,416.23090153303,58.64404602377083C348.86323505073057,18.502131276798302,261.93793281208167,40.57373210992963,193.5410806939664,78.93577620505333C130.42746243093433,114.334589627462,98.30271207620316,179.96522072025542,76.75703585869454,249.04625023123273C51.97151888228291,328.5150500222984,13.704378332031375,421.85034740162234,66.52175969318436,486.19268352777647C119.04800174914682,550.1803526380478,217.28368757567262,524.383925680826,300,521.0016835830174",
    icon_class = "bi bi-code-slash",
    title = "Custom Software Development",
    summary = "Design and develop software applications tailored to unique business needs, from initial concept to final deployment.",
    detail = list(
      tagline = "Ship the exact solution your team needs, built to evolve with your business.",
      intro = c(
        "I partner with founders and product teams to translate ambiguous requirements into a clear product strategy and technical plan.",
        "Through iterative delivery, automated testing, and instrumentation, we move from proof-of-concept to production with confidence."
      ),
      focus = list(
        title = "Where I focus",
        items = c(
          "Discovery and domain modelling workshops to uncover edge cases early",
          "Technical architecture prototypes that balance performance, security, and budget",
          "Delivery pipelines with CI/CD, code reviews, and automated quality gates"
        )
      ),
      outcomes = list(
        title = "What you get",
        items = c(
          "A roadmap and backlog your team can own after handover",
          "Production-ready software aligned with the way your business operates",
          "Documentation and support plans tailored to your team's capacity"
        )
      )
    )
  ),
  `web-application-development` = list(
    slug = "web-application-development",
    color = "orange",
    svg_path_d = "M300,582.0697525312426C382.5290701553225,586.8405444964366,449.9789794690241,525.3245884688669,502.5850820975895,461.55621195738473C556.606425686781,396.0723002908107,615.8543463187945,314.28637112970534,586.6730223649479,234.56875336149918C558.9533121215079,158.8439757836574,454.9685369536778,164.00468322053177,381.49747125262974,130.76875717737553C312.15926192815925,99.40240125094834,248.97055460311594,18.661163978235184,179.8680185752513,50.54337015887873C110.5421016452524,82.52863877960104,119.82277516462835,180.83849132639028,109.12597500060166,256.43424936330496C100.08760227029461,320.3096726198365,92.17705696193138,384.0621239912766,124.79988738764834,439.7174275375508C164.83382741302287,508.01625554203684,220.96474134820875,577.5009287672846,300,582.0697525312426",
    icon_class = "bi bi-laptop",
    title = "Web Application Development",
    summary = "Build dynamic and user-friendly web applications.",
    detail = list(
      tagline = "Responsive, performant web apps that feel right on any device.",
      intro = c(
        "From marketing sites to data-heavy dashboards, I design front-ends that emphasise clarity, accessibility, and speed.",
        "I integrate modern tooling—component libraries, state management, automated testing—while keeping the stack maintainable for your team."
      ),
      focus = list(
        title = "Where I focus",
        items = c(
          "UX flows crafted around user research and analytics",
          "Progressive enhancement so critical paths stay fast and resilient",
          "CI pipelines with visual regression and end-to-end tests"
        )
      ),
      outcomes = list(
        title = "What you get",
        items = c(
          "Interfaces optimised for accessibility, localisation, and responsive breakpoints",
          "Infrastructure-as-code for predictable deployments",
          "Monitoring hooks and product analytics wired from day one"
        )
      )
    )
  ),
  `api-integration-and-development` = list(
    slug = "api-integration-and-development",
    color = "teal",
    svg_path_d = "M300,541.5067337569781C382.14930387511276,545.0595476570109,479.8736841581634,548.3450877840088,526.4010558755058,480.5488172755941C571.5218469581645,414.80211281144784,517.5187510058486,332.0715597781072,496.52539010469104,255.14436215662573C477.37192572678356,184.95920475031193,473.57363656557914,105.61284051026155,413.0603344069578,65.22779650032875C343.27470386102294,18.654635553484475,251.2091493199835,5.337323636656869,175.0934190732945,40.62881213300186C97.87086631185822,76.43348514350839,51.98124368387456,156.15599469081315,36.44837278890362,239.84606092416172C21.716077023791087,319.22268207091537,43.775223500013084,401.1760424656574,96.891909868211,461.97329694683043C147.22146801428983,519.5804099606455,223.5754009179313,538.201503339737,300,541.5067337569781",
    icon_class = "bi bi-easel",
    title = "API Integration & Development",
    summary = "Develop & integrate APIs to enable smooth data exchange with third-party software.",
    detail = list(
      tagline = "Connect systems reliably with well-documented, testable APIs.",
      intro = c(
        "I design RESTful and event-driven APIs using specs-first workflows so teams agree on contracts before coding begins.",
        "For integrations, I handle authentication, rate limiting, and error recovery so downstream teams can focus on business logic."
      ),
      focus = list(
        title = "Where I focus",
        items = c(
          "OpenAPI-first design with mocking environments for consumers",
          "Resilient integration patterns across webhooks, queues, retries, and circuit breakers",
          "Security reviews covering auth flows, secrets, and data governance"
        )
      ),
      outcomes = list(
        title = "What you get",
        items = c(
          "Comprehensive documentation, SDK stubs, and onboarding guides",
          "Dashboards and alerts that surface integration health in real time",
          "Knowledge transfer to internal teams for continued stewardship"
        )
      )
    )
  ),
  `software-maintenance-and-support` = list(
    slug = "software-maintenance-and-support",
    color = "red",
    svg_path_d = "M300,503.46388370962813C374.79870501325706,506.71871716319447,464.8034551963731,527.1746412648533,510.4981551193396,467.86667711651364C555.9287308511215,408.9015244558933,512.6030010748507,327.5744911775523,490.211057578863,256.5855673507754C471.097692560561,195.9906835881958,447.69079081568157,138.11976852964426,395.19560036434837,102.3242989838813C329.3053358748298,57.3949838291264,248.02791733380457,8.279543830951368,175.87071277845988,42.242879143198664C103.41431057327972,76.34704239035025,93.79494320519305,170.9812938413882,81.28167332365135,250.07896920659033C70.17666984294237,320.27484674793965,64.84698225790005,396.69656628748305,111.28512138212992,450.4950937839243C156.20124167950087,502.5303643271138,231.32542653798444,500.4755392045468,300,503.46388370962813",
    icon_class = "bi bi-bounding-box-circles",
    title = "Software Maintenance & Support",
    summary = "Provide ongoing support and maintenance to ensure software runs smoothly and stays updated.",
    detail = list(
      tagline = "Keep critical systems healthy with proactive maintenance and clear SLAs.",
      intro = c(
        "Legacy systems need steady care. I audit codebases, tame technical debt, and prioritise fixes based on real usage.",
        "With observability, release management, and knowledge sharing, we extend the life of your software without slowing delivery."
      ),
      focus = list(
        title = "Where I focus",
        items = c(
          "Dependency and security patch management with regression safeguards",
          "Performance profiling and capacity planning before issues hit production",
          "Operational runbooks and incident response drills with your team"
        )
      ),
      outcomes = list(
        title = "What you get",
        items = c(
          "Stabilised systems with predictable release cadences",
          "Transparent metrics on uptime, defect rates, and support effort",
          "A backlog that balances new features with continuous improvement"
        )
      )
    )
  ),
  `consulting-and-advisory` = list(
    slug = "consulting-and-advisory",
    color = "indigo",
    svg_path_d = "M300,532.3542879108572C369.38199826031484,532.3153073249985,429.10787420159085,491.63046689027357,474.5244479745417,439.17860296908856C522.8885846962883,383.3225815378663,569.1668002868075,314.3205725914397,550.7432151929288,242.7694973846089C532.6665558377875,172.5657663291529,456.2379748765914,142.6223662098291,390.3689995646985,112.34683881706744C326.66090330228417,83.06452184765237,258.84405631176094,53.51806209861945,193.32584062364296,78.48882559362697C121.61183558270385,105.82097193414197,62.805066853699245,167.19869350419734,48.57481801355237,242.6138429142374C34.843463184063346,315.3850353017275,76.69343916112496,383.4422959591041,125.22947124332185,439.3748458443577C170.7312796277747,491.8107796887764,230.57421082200815,532.3932930995766,300,532.3542879108572",
    icon_class = "bi bi-calendar4-week icon",
    title = "Consulting & Advisory",
    summary = "Offer strategic guidance on software development strategies, technology choices, and best practices.",
    detail = list(
      tagline = "Make confident technical decisions with clear, unbiased guidance.",
      intro = c(
        "I join leadership teams to evaluate architecture, processes, and talent, highlighting the trade-offs you face.",
        "Workshops and executive-ready deliverables turn recommendations into actionable next steps."
      ),
      focus = list(
        title = "Where I focus",
        items = c(
          "Technical due diligence for product launches, acquisitions, or vendor selection",
          "Architecture reviews and migration roadmaps grounded in real constraints",
          "Team capability assessments and hiring plans aligned to your goals"
        )
      ),
      outcomes = list(
        title = "What you get",
        items = c(
          "Prioritised recommendations with impact, effort, and risk analysis",
          "Clarity on tooling, processes, and KPIs to measure progress",
          "A cadence for revisiting decisions as your organisation scales"
        )
      )
    )
  ),
  `technical-training-and-workshops` = list(
    slug = "technical-training-and-workshops",
    color = "pink",
    svg_path_d = "M300,566.797414625762C385.7384707136149,576.1784315230908,478.7894351017131,552.8928747891023,531.9192734346935,484.94944893311C584.6109503024035,417.5663521118492,582.489472248146,322.67544863468447,553.9536738515405,242.03673114598146C529.1557734026468,171.96086150256528,465.24506316201064,127.66468636344209,395.9583748389544,100.7403814666027C334.2173773831606,76.7482773500951,269.4350130405921,84.62216499799875,207.1952322260088,107.2889140133804C132.92018162631612,134.33871894543012,41.79353780512637,160.00259165414826,22.644507872594943,236.69541883565114C3.319112789854554,314.0945973066697,72.72355303640163,379.243833228382,124.04198916343866,440.3218312028393C172.9286146004772,498.5055451809895,224.45579914871206,558.5317968840102,300,566.797414625762",
    icon_class = "bi bi-person-video3",
    title = "Technical Training & Workshops",
    summary = "Conduct training sessions and workshops to enhance technical skills and knowledge on various software technologies.",
    detail = list(
      tagline = "Elevate your team with hands-on training tailored to your stack.",
      intro = c(
        "I design workshops around real scenarios from your product so engineers can apply concepts immediately.",
        "Sessions balance lecture, live coding, and peer collaboration, with materials your team can reuse."
      ),
      focus = list(
        title = "Where I focus",
        items = c(
          "Curricula covering R, web development, DevOps, and modern API practices",
          "Engineering coaching that reinforces testing, review, and documentation habits",
          "Follow-up office hours and pairing to keep momentum high"
        )
      ),
      outcomes = list(
        title = "What you get",
        items = c(
          "Reusable playbooks, templates, and exercises hosted on your tooling",
          "Measurable skill uplift captured through retros and assessments",
          "A learning roadmap that supports ongoing professional development"
        )
      )
    )
  )
)

service_list <- unname(services_catalog)

get_service <- \(slug) {
  service <- services_catalog[[slug]]
  if (is.null(service)) {
    stop(sprintf("Unknown service slug: %s", slug), call. = FALSE)
  }
  service
}

null_coalesce <- \(x, y) {
  if (is.null(x) || length(x) == 0) {
    return(y)
  }
  x
}

build_detail_list <- \(section) {
  if (is.null(section) || length(section$items) == 0) {
    return(NULL)
  }

  tags$div(
    class = "service-detail__list",
    if (!is.null(section$title)) tags$h4(section$title),
    tags$ul(
      lapply(
        section$items,
        \(item) tags$li(item)
      )
    )
  )
}

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
          subtitle = "Find out how my services can add value to your business or project."
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
    tags$a(
      href = paste0("/services/", service$slug),
      class = sprintf(
        "service-item item-%s position-relative d-block text-decoration-none text-reset",
        service$color
      ),
      `aria-label` = sprintf("Learn more about %s", service$title),
      create_service_icon(service),
      tags$h3(service$title),
      tags$p(service$summary)
    )
  )
}


#' Service detail view
#'
#' @param slug String. Service identifier.
#' @return [htmltools::tagList]
#' @export
service_detail <- \(slug) {
  service <- get_service(slug)
  detail <- service$detail
  intro_paragraphs <- lapply(detail$intro, tags$p)
  focus_section <- build_detail_list(detail$focus)
  outcomes_section <- build_detail_list(detail$outcomes)
  subtitle <- null_coalesce(detail$tagline, service$summary)

  tagList(
    header(active = "Services"),
    tags$main(
      class = "main",
      tags$section(
        id = paste0("service-", service$slug),
        class = "service-detail section",
        create_section_title(
          title = service$title,
          subtitle = subtitle
        ),
        tags$div(
          class = "container",
          `data-aos` = "fade-up",
          tags$a(
            href = "/services",
            class = "btn btn-outline-primary service-detail__back mb-4",
            tags$i(class = "bi bi-arrow-left"),
            tags$span("Back to services")
          ),
          tags$div(
            class = sprintf("service-detail__card item-%s", service$color),
            tags$div(
              class = "service-detail__icon",
              create_service_icon(service)
            ),
            tags$p(
              class = "service-detail__summary lead",
              service$summary
            ),
            intro_paragraphs,
            focus_section,
            outcomes_section
          )
        )
      )
    )
  )
}


#' Retrieve service title for metadata
#'
#' @param slug String. Service identifier.
#' @return String
#' @export
service_detail_title <- \(slug) {
  get_service(slug)$title
}


#' Retrieve service meta label
#'
#' @param slug String. Service identifier.
#' @return String
#' @export
service_meta_label <- \(slug) {
  sprintf("Services - %s", service_detail_title(slug))
}
