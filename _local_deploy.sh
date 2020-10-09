#!/bin/bash

# this script builds the book on your computer
# and deploys it to your gh-pages branch.

set -e

gitbranch=$(git symbolic-ref --short -q HEAD)
if [ "${gitbranch}" == "master" ]
then
  echo building
  Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"
# Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::pdf_book')"
  Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::epub_book')"
  echo done building
  echo copy to gh-pages branch
  # git clone -b gh-pages git@github.com:ScPoEcon/ScPoEconometrics.git ScPoEconometrics-book
  cd ../ScPoEconometrics-book
  cp -r ../ScPoEconometrics/_book/* ./
  git checkout gh-pages && git pull origin gh-pages

  echo deploying
  git add --all *
  git status
  git commit -m"Update the book" || true
  git push origin gh-pages

  echo done deploying.

else
  echo not on master branch - not deploying
fi
