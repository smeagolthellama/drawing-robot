# Drawing Robot (W.I.P.)
Source code for a Raspberry Pi-based drawing robot. This robot will draw lines from a black-and-white image generated with Evolvotron and ImageMagick, based on the coordinates of all white pixels.

## Dependencies:
 * Evolvotron
 * ImageMagick
 * Go

## Getting Started

Before doing anything make sure you have the correct packages installed on your machine:

```
sudo apt update && sudo apt upgrade
sudo apt install evolvotron imagemagick golang-go
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
To just get the pretty pictures,
```
make image
```
or 
```
./makeNew.sh
```
