all_files <- list.files(path = ".", all.files = TRUE, recursive = TRUE)

prefixes <- c(
  ".git",
  "renv",
  ".Rprofile",
  "dev.R",
  "generate_dockerfile.R",
  "public/scss"
)
for (prefix in prefixes) {
  all_files <- all_files[!startsWith(x = all_files, prefix = prefix)]
}

copy_statements <- sprintf("COPY %s %s", all_files, all_files) |>
  paste(collapse = "\n")

dockerfile <- paste(
  "FROM personal-website-base",
  "WORKDIR /app",
  copy_statements,
  "EXPOSE 5000",
  'CMD ["Rscript", "index.R"]',
  sep = "\n"
)

cat(
  dockerfile,
  "\n",
  file = "Dockerfile",
  append = FALSE
)
