box::use(
  ambiorix[Ambiorix],
  . /
    controllers[
      home,
      about,
      resume,
      services_get,
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

app <- Ambiorix$new()

app$set_error(error_handler)

app$use(redirect)
app$static("public", "assets")

app$get("/", home)
app$get("/about", about)
app$get("/resume", resume)
app$get("/contact", contact_get)
app$get("/services", services_get)
app$post("/contact", contact_post)
app$get("/download-resume", download_resume)

app$start(port = 8000)
