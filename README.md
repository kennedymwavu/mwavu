# Personal Website

Made with ❤️ using Ambiorix

## Prerequisites

- R >= 4.5.0

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

## Docker

### Initial Setup or Library/Package Updates

If this is the first time running the project, or if library/package
dependencies have changed, build the base image first:

```bash
docker build -f Dockerfile.base -t personal-website-base .
```

### Redeploying After Code Changes

1. Generate the main `Dockerfile`:

   ```bash
   Rscript generate_dockerfile.R
   ```

   Generate this file locally so that changes are tracked via Git and only a
   `git pull` is needed on the server.

   Ensure you do not have any unnecessary files (eg. `dev.R`, `test.R` etc)
   when running this to avoid "file not found" errors on the server. But
   if you have such files (which you probably use for development), just
   edit the `generate_dockerfile.R` and add them to the vector of ignored
   prefixes. That way, they will not be `COPY`ied.

2. Build the main image:

   ```bash
   docker build -t personal-website .
   ```

3. Stop the currently running services in this context:

   ```bash
   docker compose down
   ```

4. Start services with updates:

   ```bash
   docker compose up -d --remove-orphans
   ```

   This will run the app on port 1028 of the host machine, so you will view it
   at [localhost:1028](http://localhost:1028/)
