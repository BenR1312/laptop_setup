#!/bin/bash
# Include any branches for which you wish to disable this script
if [ -z "$BRANCHES_TO_SKIP" ]; then
  BRANCHES_TO_SKIP=(master develop staging test)
fi

BRANCH_NAME=$(git symbolic-ref --short HEAD)
BRANCH_EXCLUDED=$(printf "%s\n" "${BRANCHES_TO_SKIP[@]}" | grep -c "^$BRANCH_NAME$")

# Trim it down to get the parts we're interested in
# Trim all characters that arent numbers from the branch name.
STORY_NUMBER=$(echo $BRANCH_NAME | sed 's/[^0-9]*//g')

# If it isn't excluded, preprend the trimmed branch identifier to the given message
if [ -n "$BRANCH_NAME" ] &&  ! [[ $BRANCH_EXCLUDED -eq 1 ]]; then
  if [ -z "$STORY_NUMBER" ]; then
    echo "No story number on branch!";
  else
    sed -i.bak -e "1s/^/[#$STORY_NUMBER] /" $1;
  fi
else
  echo "Excluded branch, skipped adding story id message";
fi
