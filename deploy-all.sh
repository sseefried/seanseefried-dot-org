#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

[ "$SEANSEEFRIED_DOT_ORG_MACHINE" != "" ] || { echo "Set SEANSEEFRIED_DOT_ORG_MACHINE SSH path to remote directory"; exit 1; }
[ "$SEANSEEFRIED_DOT_ORG_PATH" != "" ] || { echo "Set SEANSEEFRIED_DOT_ORG_PATH SSH path to remote directory"; exit 1; }

tilthydeath-nixos/nixos-switch.sh

echo
echo
echo "=== Deploy index.html =========================================="
scp index.html "$SEANSEEFRIED_DOT_ORG_MACHINE:$SEANSEEFRIED_DOT_ORG_PATH"

for i in $(find -L . -name 'deploy.sh'); do
  if [ -x $i ]; then
    echo
    echo
    echo "=== Running $i ============================================"
    ./$i
  fi
done