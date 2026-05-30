#!/bin/bash
DEV_BRANCH = "dev"
STG_BRANCH = "stg"
TIMESTAMP = $(date)
TAG_NAME = "stg_$TIMESTAMP"

echo "=== Gthtyjc bpvtytybq bp $DEV_BRANCH в $STG_BRANCH ==="

git checkout $DEV_BRANCH
git pull origin $DEV_BRANCH

git checkout $STG_BRANCH
git pull origin $STG_BRANCH

git merge $DEV_BRANCH --no-ff -m "Merge $DEV_BRANCH -> $STG_BRANCH $TIMESTAMP"

echo "=== Готово ==="
