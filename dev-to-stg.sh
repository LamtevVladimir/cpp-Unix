#!/bin/bash
echo "start dev->stg"
git checkout stg
git merge dev --no-edit
git tag -a v -m "stg-$(date +%Y%m%d-%H%M%S)"
git tag -l
git commit -m "version $(date +%Y%m%d-%H%M%S)"
git push origin stg
git push origin tags
git checkout dev
echo "end dev->stg"
