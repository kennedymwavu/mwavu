box::use(
  ambiorix[Ambiorix],
  . /
    controllers /
    mod[
      home,
      about,
      resume,
      services,
      service_detail,
      contact_get,
      contact_post,
      download_resume,
    ],
  . /
    middleware /
    mod[
      redirect,
      error_handler,
    ],
)

Ambiorix$new(host = "0.0.0.0", port = 8000)$set_error(error_handler)$use(
  redirect
)$static("public", "assets")$get("/", home)$get("/about", about)$get(
  "/resume",
  resume
)$get("/services", services)$get(
  "/services/custom-software-development",
  service_detail("custom-software-development")
)$get(
  "/services/web-application-development",
  service_detail("web-application-development")
)$get(
  "/services/api-integration-and-development",
  service_detail("api-integration-and-development")
)$get(
  "/services/software-maintenance-and-support",
  service_detail("software-maintenance-and-support")
)$get(
  "/services/consulting-and-advisory",
  service_detail("consulting-and-advisory")
)$get(
  "/services/technical-training-and-workshops",
  service_detail("technical-training-and-workshops")
)$get("/contact", contact_get)$post("/contact", contact_post)$get(
  "/download-resume",
  download_resume
)$start()
