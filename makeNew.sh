#!/bin/bash

# example for generating images from manpage. sample included.
#evolvotron_mutate -g | evolvotron_render -s 1024x1024 function.ppm
# We want a log of our images, and to not use very much space, so I recomend doing something like `date +%s`.png or jpg (if supported)
name=$(date +%s)
echo -n "generating image ($name.png)... "
evolvotron_mutate -g | evolvotron_render -s 1024x1024 "$name.png"
echo "done."
# use imagemagick to get lines, instead of colours. (no idea what the numbers do, but all examples had them, so leaving them in.)
echo -n "converting to drawable... "
convert "$name.png" -canny 0x1+10%+30% "$name.edges.png"
evho "done."
