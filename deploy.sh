#!/usr/bin/env sh

# abort on errors
set -e

# build
npm run build

# navigate into the build output directory
cd .vuepress/app


# delete everything exept .git
find . -maxdepth 1 -mindepth 1 -not -name .git -exec rm -rf {} \;

cp ../dist/* . -r

# if you are deploying to a custom domain
echo 'kask.at' > CNAME

git add -A
git commit -m 'Automatic deployment.'

# if you are deploying to https://<USERNAME>.github.io
git push

cd -
