#!/usr/bin/env bash

if [[ $RUNNER_OS == 'Windows' ]]; then
  echo "FLUTTER_ROOT=$RUNNER_TOOL_CACHE\flutter" >> "$GITHUB_ENV"
else
  echo "FLUTTER_ROOT=$RUNNER_TOOL_CACHE/flutter" >> "$GITHUB_ENV"
fi
