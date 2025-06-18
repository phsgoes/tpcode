#!/bin/bash

# Delete gh-pages branch
git push --delete origin gh-pages

# Build the project
npm run generate

# Create CNAME file
# echo "tpcode.pro" > .output/public/CNAME

# Force add the dist folder in case it's in .gitignore
git add .output/public -f
git commit -m "Build site for deployment" || echo "No changes to commit"

# Push .output/public/ as a subtree to gh-pages branch
git subtree push --prefix .output/public origin gh-pages

# Remove dist / .outputfolder
rm -rf .output/ dist/
