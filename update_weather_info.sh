#!/bin/bash

PDFURL=https://www.yr.no/place/Germany/North_Rhine-Westphalia/Bochum/forecast.pdf
OUTPDF=forecast.pdf
OUTPNG=forecast.png
OUTCROPPED=forecast-cropped.png
DIMENSION=1100x700+130+400
DPI=300

wget -O $OUTPDF $PDFURL

# convert to image
convert -density $DPI $OUTPDF $OUTPNG

# crop image
convert -crop $DIMENSION +repage $OUTPNG $OUTCROPPED
