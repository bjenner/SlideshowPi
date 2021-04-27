#!/bin/bash
set -e

# called periodically by cron to refresh the slideshow.

/home/pi/SlideshowPi/Scripts/config.sh

cd $SLIDESHOWHOME/Scripts

./checkNewDownload.sh 
if [ "0" == "$?" ] ; then
   echo "no file has been downloaded"
   exit 
fi

./checkUpdated.sh 
if [ "0" == "$?" ] ; then
   echo "new file is no different" 
   ./cleanupNewDownload.sh
   exit
fi

echo "new different file found" 
./stopSlideshow.sh
./updateSlideshow.sh
./cleanupNewDownload.sh
./startSlideshow.sh

