all_files <- list.files(path = ".", all.files = TRUE, recursive = TRUE)

prefixes_to_ignore <- c(
  ".git",
  "renv",
  ".Rprofile",
  "dev.R",
  "generate_dockerfile.R",
  "docker-compose.yml",
  "Dockerfile",
  "Dockerfile.base"
)
for (prefix in prefixes_to_ignore) {
  all_files <- all_files[!startsWith(x = all_files, prefix = prefix)]
}

all_files <- strsplit(x = all_files, split = "/", fixed = TRUE) |>
  sapply(FUN = `[[`, 1L) |>
  unique()

is_dir <- dir.exists(all_files)
all_files[is_dir] <- paste0(all_files[is_dir], "/")

copy_statements <- sprintf("COPY %s %s", all_files, all_files) |>
  paste(collapse = "\n")

dockerfile <- paste(
  "FROM personal-website-base",
  "WORKDIR /app",
  copy_statements,
  "EXPOSE 8000",
  'CMD ["Rscript", "index.R"]',
  sep = "\n"
)

cat(
  dockerfile,
  "\n",
  file = "Dockerfile",
  append = FALSE
)
