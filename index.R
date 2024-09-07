box::use(
  ambiorix[Ambiorix],
  . / controllers / mod[
    home,
    about,
    resume,
    services,
    portfolio,
    contact_get,
    contact_post,
    download_resume,
  ],
  . / middleware / mod[
    redirect,
    error_handler,
  ],
)

Ambiorix$
  new(host = "0.0.0.0", port = 8000)$
  set_error(error_handler)$
  use(redirect)$
  static("public", "assets")$
  get("/", home)$
  get("/about", about)$
  get("/resume", resume)$
  get("/services", services)$
  get("/portfolio", portfolio)$
  get("/contact", contact_get)$
  post("/contact", contact_post)$
  get("/download-resume", download_resume)$
  start()
