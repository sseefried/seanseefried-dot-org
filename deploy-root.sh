#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

[ "$SEANSEEFRIED_DOT_ORG_MACHINE" != "" ] || { echo "Set SEANSEEFRIED_DOT_ORG_MACHINE SSH path to remote directory"; exit 1; }
[ "$SEANSEEFRIED_DOT_ORG_PATH" != "" ] || { echo "Set SEANSEEFRIED_DOT_ORG_PATH SSH path to remote directory"; exit 1; }

echo
echo
echo "=== Deploy root files =========================================="
cd $DIR/root-files

for i in *.html; do
  scp $i "$SEANSEEFRIED_DOT_ORG_MACHINE:$SEANSEEFRIED_DOT_ORG_PATH"
done

cd $DIR
rsync -avz root-files/assets "$SEANSEEFRIED_DOT_ORG_MACHINE:$SEANSEEFRIED_DOT_ORG_PATH"

