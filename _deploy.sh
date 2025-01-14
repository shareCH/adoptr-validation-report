#!/usr/bin/env bash

set -e

git config --global user.email "kevin.kunzmann@mrc-bsu.cam.ac.uk"
git config --global user.name "Travis CI build"

git clone -b gh-pages \
  https://${GITHUB_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git \
    book-output
cd book-output
git rm -rf *
cp -r ../_book/* ./
git add --all *
git commit -m "automatic deployment of latest master to gh-pages"
git push -q origin gh-pages
