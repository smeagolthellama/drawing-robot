# Drawing Robot (W.I.P.)
Source code for a Raspberry Pi-based drawing robot. This robot will draw lines from a black-and-white image generated with Evolvotron and ImageMagick, based on the coordinates of all white pixels.

## Dependencies:
 * Evolvotron
 * ImageMagick
 * potrace
 * make
 * perl
  * RPi::WiringPi
  * Image::SVG::Path

## Getting Started

Before doing anything make sure you have the correct packages installed on your machine (also, make sure that you are using a raspberry pi (we are using raspbian, but other debian-based OSs should work. If you are using something else, apt won't work for you.)):

```
sudo apt update && sudo apt upgrade
sudo apt install evolvotron imagemagick potrace build-essential
cpan RPi::WiringPi
cpan Image::SVG::Path
```


Clone the repository:

```
git clone git@github.com:smeagolthellama/drawing-robot
cd drawing-robot
```

To generate a new image and a file with coordinates, as well as drawing the pictures (not implemented yet), run:

```
make 
```
To just get the pretty pictures, come up with a name, and run
```
make image.edges.svg
```
where `image` is the name you came up with.

To draw a picture again, 
```
make image.draw
```
