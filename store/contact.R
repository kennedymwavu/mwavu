box::use(
  htmltools[tags, tagList],
  . / header[header],
)

#' Contact page
#'
#' @export
contact <- \() {
  tagList(
    header(active = "Contact"),
    tags$main(
      class = "main",
      tags$section(
        id = "contact",
        class = "contact section",
        tags$div(
          class = "container section-title",
          `data-aos` = "fade-up",
          tags$h2("Contact"),
          tags$p("Your idea deserves a stage. I’ll help set it.")
        ),
        tags$div(
          class = "container",
          `data-aos` = "fade-up",
          `data-aos-delay` = "100",
          tags$div(
            class = "row gy-4",
            tags$div(
              class = "col-lg-5",
              contact_details()
            ),
            tags$div(
              id = "form_container",
              class = "col-lg-7",
              default_contact_form()
            )
          ),
          tags$span(
            id = "loader",
            class = "loader htmx-indicator"
          )
        )
      )
    )
  )
}

#' Contact details
#'
#' @export
contact_details <- \() {
  tags$div(
    class = "info-wrap",
    info_item(
      data_aos_delay = "200",
      icon_class = "bi bi-geo-alt",
      title = "Address",
      description = "Nairobi, Kenya"
    ),
    info_item(
      data_aos_delay = "300",
      icon_class = "bi bi-linkedin",
      title = "LinkedIn",
      description = tags$a(
        href = "https://www.linkedin.com/in/kennedymwavu/",
        "linkedin.com/in/kennedymwavu"
      )
    ),
    info_item(
      data_aos_delay = "400",
      icon_class = "bi bi-github",
      title = "GitHub",
      description = tags$a(
        href = "https://github.com/kennedymwavu",
        "github.com/kennedymwavu"
      )
    ),
    info_item(
      data_aos_delay = "400",
      icon_class = "bi bi-twitter-x",
      title = "X/Twitter",
      description = tags$a(
        href = "https://x.com/kennedymwavu",
        "x.com/kennedymwavu"
      )
    ),
    info_item(
      data_aos_delay = "400",
      icon_class = "bi bi-bluesky",
      title = "Bluesky",
      description = tags$a(
        href = "https://bsky.app/profile/mwavu.com",
        "bsky.app/profile/mwavu.com"
      )
    )
  )
}

#' Info item
#'
#' @param data_aos_delay String. `data-aos-delay` attribute of the info div.
#' @param icon_class Character vector. Classes to apply to the `<i>` tag.
#' @param title String. Title of the info item.
#' @param description String. Description of the info item.
#' @export
info_item <- \(
  data_aos_delay = "100",
  icon_class = NULL,
  title = NULL,
  description = NULL
) {
  icon_class <- paste(icon_class, "flex-shrink-0")

  tags$div(
    class = "info-item d-flex",
    `data-aos` = "fade-up",
    `data-aos-delay` = data_aos_delay,
    tags$i(
      class = icon_class,
    ),
    tags$div(
      tags$h3(title),
      tags$p(description)
    )
  )
}

#' Text area input
#'
#' @param label String. [htmltools::tags]. Input label.
#' @param id String. A unique input id.
#' @param value String. Value of the input.
#' @param required Logical. Should the 'required' attribute be added?
#' @param class Character vector. Classes to apply to the input.
#' @param ... [htmltools::tags] to include after the input.
#' @return [htmltools::tags]
#' @export
text_area_input <- \(
  ...,
  label = NULL,
  id = NULL,
  value = "",
  required = TRUE,
  class = NULL
) {
  required <- if (required) NA
  class <- c("form-control", class)

  tags$div(
    tags$label(
      `for` = id,
      class = "pb-2",
      label
    ),
    tags$textarea(
      class = class,
      id = id,
      name = id,
      rows = "10",
      required = required,
      value
    ),
    ...
  )
}

#' Text input
#'
#' @param label String. [htmltools::tags]. Input label.
#' @param id String. A unique input id
#' @param type String. Type of the input.
#' Must be one of "text" (default) or "email".
#' @param value String. Value of the input.
#' @param required Logical. Should the 'required' attribute be added?
#' @param class Character vector. Classes to apply to the input.
#' @param ... [htmltools::tags] to include after the input.
#' @return [htmltools::tags]
#' @export
text_input <- \(
  ...,
  label = NULL,
  id = NULL,
  type = c("text", "email"),
  value = "",
  required = TRUE,
  class = NULL
) {
  required <- if (required) NA
  type <- match.arg(arg = type)
  class <- c("form-control", class)

  tags$div(
    tags$label(
      `for` = id,
      class = "pb-2",
      label
    ),
    tags$input(
      type = type,
      id = id,
      name = id,
      value = value,
      class = class,
      required = required
    ),
    ...
  )
}

#' Contact form
#'
#' @param name [htmltools::tags]
#' @param email [htmltools::tags]
#' @param subject [htmltools::tags]
#' @param message [htmltools::tags]
#' @return [htmltools::tags]
#' @export
contact_form <- \(
  name = NULL,
  email = NULL,
  subject = NULL,
  message = NULL
) {
  name <- tags$div(
    class = "col-md-6",
    name
  )

  email <- tags$div(
    class = "col-md-6",
    email
  )

  subject <- tags$div(
    class = "col-md-12",
    subject
  )

  message <- tags$div(
    class = "col-md-12",
    message
  )

  tags$form(
    `hx-post` = "/contact",
    `hx-target` = "#form_container",
    `hx-swap` = "outerHTML",
    `hx-indicator` = "#loader",
    `data-aos` = "fade-up",
    `data-aos-delay` = "200",
    class = "php-email-form",
    tags$div(
      class = "row gy-4",
      name,
      email,
      subject,
      message,
      tags$div(
        class = "col-md-12 text-center",
        tags$button(
          type = "submit",
          "Send Message"
        )
      )
    )
  )
}

#' Default contact form
#'
#' @return [htmltools::tags]
#' @export
default_contact_form <- \() {
  contact_form(
    name = text_input(
      label = "Your Name",
      id = "name"
    ),
    email = text_input(
      label = "Your Email",
      id = "email",
      type = "email"
    ),
    subject = text_input(
      label = "Subject",
      id = "subject"
    ),
    message = text_area_input(
      label = "Message",
      id = "message"
    )
  )
}
