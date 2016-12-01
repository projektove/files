#!/bin/bash

set -eo pipefail

echo -n "Checking docker-compose installed... "
TARGET=/usr/local/bin/docker-compose
if [[ ! -f $TARGET ]]; then
  echo "nope"
  echo "Installing latest docker-compose..."
  curl -k -L "https://github.com/docker/compose/releases/download/latest/docker-compose-$(uname -s)-$(uname -m)" -o $TARGET

  chmod +x $TARGET
  echo "Done."
fi

echo -n "Checking docker-compose.yml... "
TARGET=/root/docker-compose.yml
if [[ ! -f $TARGET ]]; then
  echo "nope"
  echo "Installing docker-compose.yml..."
  curl -k -L "https://raw.githubusercontent.com/projektove/files/master/docker-compose/docker-compose.yml" -o $TARGET
  echo "Done."
fi

echo "All done!"
