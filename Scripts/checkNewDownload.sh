#!/bin/bash
set -e

# check if a new file has been loaded

/home/pi/SlideshowPi/Scripts/config.sh

if ! test -f "$NEWFILE"; then 
  echo "no file found"
  exit 0
fi

if ! test -f "$NEWFILE.md5"; then 
  echo "no md5 file found" 
  md5sum $NEWFILE > $NEWFILE.md5 
fi

md5sum $NEWFILE > $NEWFILE.md5t 
diff -q $NEWFILE.md5 $NEWFILE.md5t 2>/dev/null 1>/dev/null
if [ "$?" == "1" ]; then
  echo "md5 files differ"
  rm $NEWFILE.md5
  mv $NEWFILE.md5t $NEWFILE.md5
  exit 0
fi

exit 1	

