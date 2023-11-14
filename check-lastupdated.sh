#!/usr/bin/env bash

# turn on echo
# set -x

# matching_files="machine-learning.md|machine-learning-cp.md"
matching_files="$*"
if [[ "${matching_files}" == "" ]]; then
  matching_files="*.md"
fi

today=$(date +"%Y-%m-%d")
files=$(git diff --name-only | egrep ${matching_files})

function validate_lastupdated() {
  cat $1 | grep lastupdated | awk '{print $2; exit}' | tr -d '"'
}

echo "Checking files $files for date $today"

for f in ${files}; do
  last_updated=$(validate_lastupdated $f)
  echo "Found last updated ${last_updated} in $f"
  if [[ "${last_updated}" != "${today}" ]]; then
    echo "***ERROR*** found wrong date in ${f}: expecting ${today} but found ${last_updated}"
    exit 1
  fi
done

exit 0
