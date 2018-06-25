#!/bin/bash

PDFURL=https://www.yr.no/place/Germany/North_Rhine-Westphalia/Bochum/forecast.pdf
OUTPDF=forecast.pdf
OUTPNG=forecast.png
OUTCROPPED=forecast-cropped.png
DIMENSION=1100x700+130+400

OUTTOMORROW=forecast-tomorrow.png
DIMENSION_TOMORROW=250x790+142+1182

DPI=300

# Download pdf with forecast
wget -O $OUTPDF $PDFURL

# convert to image
convert -density $DPI $OUTPDF $OUTPNG

# crop image
convert -crop $DIMENSION +repage $OUTPNG $OUTCROPPED
convert -crop $DIMENSION_TOMORROW +repage $OUTPNG $OUTTOMORROW

# TODO use SVG instead of bitmap
#
# convert to svg
#inkscape --without-gui --file=$OUTPDF --export-plain-svg=forecast.svg
#
# after that only the viewbBox has to be altered.
# https://wiki.selfhtml.org/wiki/SVG/Tutorials/Einstieg/SVG_in_responsiven_Webseiten#viewBox
