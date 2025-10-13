FROM rocker/r-ver:4.5.0
RUN apt-get update && apt-get install -y \
  git-core \
  libcurl4-openssl-dev \
  libz-dev
WORKDIR /app
COPY . .
RUN rm -rdf renv/library
RUN R -e "renv::restore()"
EXPOSE 5000
CMD ["Rscript", "index.R"]
