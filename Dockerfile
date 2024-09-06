FROM jcoenep/ambiorix
WORKDIR /app
COPY . .
RUN R -e "renv::restore()"
EXPOSE 8000
CMD [ "Rscript", "index.R" ]
