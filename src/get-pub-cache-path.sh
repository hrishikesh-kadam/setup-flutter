#!/usr/bin/env bash

# TODO: Add check for $FLUTTER_ROOT/.pub-cache and source code references

if [[ -n $PUB_CACHE ]]; then
  echo "$PUB_CACHE"
else
  if [[ $RUNNER_OS == 'Windows' ]]; then
    echo "$LOCALAPPDATA\Pub\Cache"
  else
    echo "$HOME/.pub-cache"
  fi
fi
