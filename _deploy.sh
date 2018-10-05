#!/bin/sh

set -e

[ -z "${GH_TOKEN}" ] && exit 0
[ "${TRAVIS_BRANCH}" != "master" ] && exit 0
[ "${TRAVIS_PULL_REQUEST}" == "false" ] && exit 0


git config --global user.email "florian.oswald@gmail.com"
git config --global user.name "Florian Oswald"

git clone -b gh-pages https://${GH_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git book-output
cd book-output
cp -r ../_book/* ./

for ((i=4; i<=12; i++)); do
    if [ -d "../_slides/chapter$i" ]; then
        cp -r ../_slides/chapter$i ./slides/chapter$i
    fi
done
git add --all *
git status
git commit -m"Update the book" || true
git push origin gh-pages
