#!/bin/bash
echo "start pushing stg to prd"
git checkout prd
git merge stg --no-edit
TAG_NAME="release-$(date +%Y%m%d-%H%M%S)"
git tag "$TAG_NAME"
git push origin prd
git push origin "$TAG_NAME"
git checkout dev
echo "end pushing"

