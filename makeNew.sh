#!/bin/bash

# We want a log of our images, and to not use very much space, so I recomend doing something like `date +%s`.png or jpg (if supported)
name=$(date +%s)
echo -n "generating image ($name.png)... "
evolvotron_mutate -g | evolvotron_render -s 1024x1024 "$name.png"
echo "done."

# use imagemagick to get lines, instead of colours. (no idea what the numbers do, but all examples had them, so leaving them in.)
echo -n "converting to drawable... "
convert "$name.png" -canny 0x1+10%+30% "$name.edges.png"
echo "done."

# don't use the Go script to generate the coordinates of all white pixels, because it takes a long time. This ought to be part of the drawing routine, not the image generation routine (i.e.: the user has a large selecion of images, without megabyte/gigabyte files cluttering up their disk)
#echo -n "obtaining coordinates... "
#go run CoordGen.go "$name.edges.png"
