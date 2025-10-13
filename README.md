# Personal Website

Made with ❤️ using Ambiorix

## Prerequisites

- R >= 4.1.0

## Installation

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

## Run app

```r
Rscript index.R
```

Then visit [localhost:8000](http://localhost:8000/) to view the app.

## Contact page messages

I have used Namecheap's [Private Email](https://privateemail.com/)
to forward the messages entered in the contact form
to my email.

You can use whichever mail server you prefer, but if
you need the form to work as-is, you will have to:

1. Get a [private email subscription](https://www.namecheap.com/hosting/email/) from namecheap.
2. Create a mailbox eg. <you@your-domain.com>
3. Add these variables to your `.Renviron`:

```r
# do not change these:
PORT = 465
HOST =  mail.privateemail.com

# fill these:
EMAIL = you@your-domain.com
USERNAME = you@your-domain.com
PASSWORD = your-strong-mailbox-password
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
