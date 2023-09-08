#!/usr/bin/env bash

SED=$(which sed)
## echo $SED
export SED
GSED=$(which gsed)
## echo $GSED
export GSED
SED=${GSED:-SED}
export SED
## echo SED=$SED
result=${PWD##*/} | $SED 's/[.]+/-/g'
export result
org=${result/-/.}
export org
## echo $result
## echo $org

if [ -z "$1" ]; then
    ## echo "-z $1"
    ORG=gnostr-org
else
    ## echo "! -z $1"
    ORG=$1
fi


ORG=${1/./-}
# echo org=$org

## exit

gh repo list $ORG --limit 1000 | while read -r repo _; do
  echo "cloning $repo"
  gh repo clone "$repo" "$repo" -- -q 2>/dev/null || (
    cd "$repo"
    # Handle case where local checkout is on a non-main/master branch
    # - ignore checkout errors because some repos may have zero commits,
    # so no main or master
    git checkout -q main 2>/dev/null || true
    git checkout -q master 2>/dev/null || true
    git pull -q
  )
done
