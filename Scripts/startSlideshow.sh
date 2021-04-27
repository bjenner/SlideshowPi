#!/bin/bash
set -e

# called periodically by cron to refresh the slideshow.

/home/pi/SlideshowPi/Scripts/config.sh

$SLIDESHOWHOME/Scripts/stopSlideshow.sh

if test -f "$CURFILE"; then 
  (nohup okular --presentation $CURFILE 2>/dev/null) &
  echo "started"
else 
  echo "no file"
fi

