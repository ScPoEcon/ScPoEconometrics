#!/bin/sh

# build book(s)
Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"
Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::pdf_book')"
Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::epub_book')"

# build slides greater than chapter 4
for ((i=4; i<=12; i++)); do
    if [ -d "_slides/chapter$i" ]; then
        Rscript -e "rmarkdown::render('_slides/chapter$i/chapter$i.Rmd')"
    fi
done
