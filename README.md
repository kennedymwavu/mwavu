# Personal Website

Made with ❤️ using Ambiorix

# Prerequisites

- R >= 4.1.0

# Installation

1. Clone the repo and `cd` into it:

   ```bash
   git@github.com:kennedymwavu/mwavu.git
   ```

   ```bash
   cd mwavu
   ```

1. Create an `env` file (`.Renviron`) at the root dir of the project and add this variable:

   ```r
   RENV_CONFIG_SANDBOX_ENABLED = FALSE
   ```

1. Restore package dependencies:

   ```bash
   R -e "renv::restore()"
   ```

   The `-e` flag tells R to execute that expression and exit.

# Run app

```r
Rscript index.R
```

Then visit [localhost:8000](http://localhost:8000/) to view the app.

# Contact page messages

I have used [mailgun](https://www.mailgun.com/) to forward messages entered in
the contact page form to my email.

If you need the form to work you will have to:

1. Create a [mailgun account](https://www.mailgun.com/), add a sending domain,
   and create an API key.
1. Add these variables to your `.Renviron`:

   ```r
   MAILGUN_API_KEY = your-mailgun-api-key
   MAILGUN_SENDING_DOMAIN = your-mailgun-sending-domain
   EMAIL = your-personal-email
   ```

# Docker

- Build the docker image:
  ```bash
  docker build -t personal-website .
  ```
- Run the services via docker compose:
  ```bash
  docker compose up -d
  ```
  This will run the app on port 1028 of the host machine, so you will view it
  at [localhost:1028](http://localhost:1028/)
- To stop the services do:
  ```bash
  docker compose down
  ```
