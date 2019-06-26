#!/bin/bash 

ROOT=$(
  cd $(dirname $0)/..
  /bin/pwd
)
OUT="$ROOT/dist/"
PUBLISH_BRANCH=$1
VERSION=$2

git fetch --all
git add -f $OUT
git checkout $PUBLISH_BRANCH
git pull origin $PUBLISH_BRANCH
if [ -d $VERSION ]; then
  rm -r $VERSION
fi
git mv -f $OUT $VERSION
git commit -q -m "Update the Twemoji project and push to $PUBLISH_BRANCH"
git push origin $PUBLISH_BRANCH
# Return to your working branch
git checkout -