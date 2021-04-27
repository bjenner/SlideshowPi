#!/bin/bash
set -e

# check if a new file is different than current

/home/pi/SlideshowPi/Scripts/config.sh

if ! test -f "$CURFILE"; then 
  echo "no current file found"
  exit 1
fi

if ! test -f "$CURFILE.md5"; then 
  echo "md5 file missing..."
  md5sum $CURFILE > $CURFILE.md5 
fi

diff -q $NEWFILE.md5 $CURFILE.md5 2>/dev/null 1>/dev/null
if [ "$?" == "1" ]; then
  echo "md5 files differ"
  exit 1
fi

exit 0

