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
              contact_form()
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

contact_form <- \() {
  name <- tags$div(
    class = "col-md-6",
    tags$label(
      `for` = "name-field",
      class = "pb-2",
      "Your Name"
    ),
    tags$input(
      type = "text",
      name = "name",
      id = "name-field",
      class = "form-control",
      required = ""
    )
  )

  email <- tags$div(
    class = "col-md-6",
    tags$label(
      `for` = "email-field",
      class = "pb-2",
      "Your Email"
    ),
    tags$input(
      type = "email",
      class = "form-control",
      name = "email",
      id = "email-field",
      required = ""
    )
  )

  subject <- tags$div(
    class = "col-md-12",
    tags$label(
      `for` = "subject-field",
      class = "pb-2",
      "Subject"
    ),
    tags$input(
      type = "text",
      class = "form-control",
      name = "subject",
      id = "subject-field",
      required = ""
    )
  )

  message <- tags$div(
    class = "col-md-12",
    tags$label(
      `for` = "message-field",
      class = "pb-2",
      "Message"
    ),
    tags$textarea(
      class = "form-control",
      name = "message",
      rows = "10",
      id = "message-field",
      required = ""
    )
  )

  tags$form(
    method = "post",
    class = "php-email-form",
    `data-aos` = "fade-up",
    `data-aos-delay` = "200",
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
