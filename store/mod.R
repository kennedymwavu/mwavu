#' @export
box::use(
  . / home[home],
  . /
    contact[
      contact,
      text_input,
      contact_form,
      text_area_input,
      default_contact_form,
    ],
  . /
    toastr[
      toastr_error,
      toastr_success,
    ],
  . / about[about],
  . / resume[resume],
  . /
    services[
      services,
      service_detail,
      service_detail_title,
      service_meta_label,
    ],
  . / page_meta[page_meta],
)
