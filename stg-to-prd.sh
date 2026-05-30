#!/bin/bash
echo "start pushing"
git checkout prd
git merge stg --no-edit
TAG_NAME = "обновление от $(date)"
git tag "$TAG_NAME"
git push origin prd
git push origin "$TAG_NAME"
git checkout dev
echo "end pushing"

