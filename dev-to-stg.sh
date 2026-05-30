#!/bin/bash
echo "start dev->stg"
git checkout stg
git merge dev --no-edit
TAG_NAME = "обновленов в $(date)"
git tag -a "$TAG_NAME"
git push origin stg -- tags
git push origin "$TAG_NAME"
git checkout dev
echo "end dev->stg"
