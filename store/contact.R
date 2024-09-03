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
          tags$p("Got a project in mind? Reach out!")
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
              class = "col-lg-7",
              default_contact_form()
            )
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
      icon_class = "bi bi-telephone",
      title = "Call Us",
      description = "+254 721231292"
    ),
    info_item(
      data_aos_delay = "400",
      icon_class = "bi bi-envelope",
      title = "Email Us",
      description = "mwavukennedy@gmail.com"
    ),
    tags$iframe(
      src = "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d127641.17044259232!2d36.76499681772576!3d-1.3030359804811678!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x182f1172d84d49a7%3A0xf7cf0254b297924c!2sNairobi!5e0!3m2!1sen!2ske!4v1725313165835!5m2!1sen!2ske",
      frameborder = "0",
      style = "border:0; width: 100%; height: 270px",
      allowfullscreen = "",
      loading = "lazy",
      referrerpolicy = "no-referrer-when-downgrade"
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
      required = required
    )
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
    `hx-target` = "this",
    `hx-swap` = "outerHTML",
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
        tags$div(
          class = "loading",
          "Loading"
        ),
        tags$div(class = "error-message"),
        tags$div(
          class = "sent-message",
          "Your message has been sent. Thank you!"
        ),
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

#' Success alert once message is sent
#'
#' @return [htmltools::tags]
#' @export
success_alert <- \() {
  tags$div(
    class = paste(
      "alert alert-success alert-dismissible",
      "d-flex align-items-center"
    ),
    role = "alert",
    tags$i(class = "bi bi-check2-circle pe-2"),
    tags$div(
      "Thank you! Your message has been sent. I'll get back to you soon."
    ),
    tags$button(
      type = "button",
      class = "btn-close",
      `data-bs-dismiss` = "alert",
      `aria-label` = "Close"
    )
  )
}

#' Error alert when message is not sent
#'
#' @return [htmltools::tags]
#' @export
error_alert <- \() {
  tags$div(
    class = paste(
      "alert alert-danger alert-dismissible",
      "d-flex align-items-center"
    ),
    role = "alert",
    tags$i(class = "bi bi-exclamation-triangle pe-2"),
    tags$div(
      "An error occurred while sending your message. Please retry."
    ),
    tags$button(
      type = "button",
      class = "btn-close",
      `data-bs-dismiss` = "alert",
      `aria-label` = "Close"
    )
  )
}
