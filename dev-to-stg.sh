#!/bin/bash
echo "start dev->stg"
git checkout stg
git merge dev --no-edit
git tag version = $ ( date +’%Y%m%d%H%M%S’)
git tag -a " v$version " -m " Release version $version "
git push origin std
git checkout dev
echo "end dev->stg"
