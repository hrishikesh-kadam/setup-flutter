#!/usr/bin/env bash

if [[ -n $PUB_CACHE ]]; then
  if [[ $RUNNER_OS == 'Windows' ]]; then
    PUB_CACHE_BIN="$PUB_CACHE\bin"
  else
    PUB_CACHE_BIN=$PUB_CACHE/bin
  fi
else
  if [[ $RUNNER_OS == 'Windows' ]]; then
    PUB_CACHE_BIN="$LOCALAPPDATA\Pub\Cache\bin"
  else
    PUB_CACHE_BIN=$HOME/.pub-cache/bin
  fi
fi

echo "::debug::Adding $PUB_CACHE_BIN to \$GITHUB_PATH"
echo "$PUB_CACHE_BIN" >> $GITHUB_PATH
