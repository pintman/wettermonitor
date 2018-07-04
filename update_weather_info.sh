#!/bin/bash

PDFURL=https://www.yr.no/place/Germany/North_Rhine-Westphalia/Bochum/forecast.pdf
OUTPDF=forecast.pdf
OUTPNG=forecast.png
OUTSVG=forecast.svg
OUTCROPPED=forecast-cropped.png
DIMENSION=1100x700+130+400

OUTTOMORROW=forecast-tomorrow.png
DIMENSION_TOMORROW=250x790+142+1182

DPI=300

# Download pdf with forecast
wget -O $OUTPDF $PDFURL

# convert to image
#convert -density $DPI $OUTPDF $OUTPNG

# crop image
#convert -crop $DIMENSION +repage $OUTPNG $OUTCROPPED
#convert -crop $DIMENSION_TOMORROW +repage $OUTPNG $OUTTOMORROW

# TODO use SVG instead of bitmap
#
# convert to svg
inkscape --without-gui --file=$OUTPDF --export-plain-svg=$OUTSVG

# change viewbox size
# -i edit files in place
#sed -i -e '10s/height=.*/height="800.0"/' \
#  -e '11s/width=.*/width="600.0"/'\
#  -e '9s/viewBox=.*/viewBox="30 90 600 800"   preserveAspectRatio="slice"/'\
#  $OUTSVG

# landscape
sed -i -e '10s/height=.*/height="600.0"/' \
  -e '11s/width=.*/width="800.0"/'\
  -e '9s/viewBox=.*/viewBox="30 90 700 600"   preserveAspectRatio="slice"/'\
  $OUTSVG


#python2 weather-script.py
rsvg-convert --background-color=white -o $OUTPNG $OUTSVG
# rotate landscape image
convert $OUTPNG -rotate "90" $OUTPNG
pngcrush -c 0 -ow $OUTPNG
#cp -f weather-script-output.png /path/to/web/server/directory/weather-script-output.png


#
# after that only the viewbBox has to be altered.
# https://wiki.selfhtml.org/wiki/SVG/Tutorials/Einstieg/SVG_in_responsiven_Webseiten#viewBox
