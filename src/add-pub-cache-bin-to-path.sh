#!/usr/bin/env bash

PUB_CACHE=$("$GITHUB_ACTION_PATH"/src/get-pub-cache-path.sh)

if [[ $RUNNER_OS == 'Windows' ]]; then
  PUB_CACHE_BIN="$PUB_CACHE\bin"
else
  PUB_CACHE_BIN=$PUB_CACHE/bin
fi

echo "::debug::Adding $PUB_CACHE_BIN to \$GITHUB_PATH"
echo "$PUB_CACHE_BIN" >> "$GITHUB_PATH"
