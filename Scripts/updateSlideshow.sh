#!/bin/bash
set -e

# called periodically by cron to refresh the slideshow.

/home/pi/SlideshowPi/Scripts/config.sh

if test -f "$NEWFILE" ; then
  mv $NEWFILE $CURDIR
  mv $NEWFILE.md5 $CURDIR
  echo "files updated"
else
  echo "files missing!" 
fi

