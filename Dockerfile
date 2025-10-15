FROM personal-website-base
WORKDIR /app
COPY .Renviron .Renviron
COPY controllers/ controllers/
COPY helpers/ helpers/
COPY index.R index.R
COPY LICENSE LICENSE
COPY middleware/ middleware/
COPY public/ public/
COPY README.md README.md
COPY store/ store/
COPY templates/ templates/
EXPOSE 8000
CMD ["Rscript", "index.R"] 
