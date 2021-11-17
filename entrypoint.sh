#!/bin/sh -l

if [ -n "$FLY_PROJECT_PATH" ]; then
  PREV_PATH=$(pwd)
  # Allow user to change directories in which to run Fly commands
  cd "$FLY_PROJECT_PATH" || exit
fi
# dirty hack to allow auto deploy of different appliation name for compatibility with github actions deploy environments
sh -c "yes | flyctl $*"

ACTUAL_EXIT="$?"

if [ -n "$PREV_PATH" ]; then
  # If we changed directories before, we should go back to where we were.
  cd "$PREV_PATH" || exit
fi

exit $ACTUAL_EXIT
