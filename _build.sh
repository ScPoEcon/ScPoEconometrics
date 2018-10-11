#!/bin/sh

# build book(s)
Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"
Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::pdf_book')"
Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::epub_book')"

# build slides greater than chapter 4
Rscript -e "library(devtools); install_github('hadley/emo')"
for i in 4 5 6 7 8 9; do
    if [ -d "_slides/chapter$i" ]; then
        Rscript -e "rmarkdown::render('_slides/chapter$i/chapter$i.Rmd')"
    fi
done
