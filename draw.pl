#!/bin/perl

use strict;
# Doesn't work. Can't install.
use WiringPi::API;
# instead.
#
#use RPi::WiringPi; #for gpio pins 
#use RPi::Const;    #ditto
#
use Image::SVG::Path;

my $wpi=WiringPi::API->new();
$wpi->setup();

my $pin=29;

print "led on pin $pin flashing...\n";

$wpi->pin_mode($pin,1); #setup pin 29 (aka 40 aka bcm 21) for output

for(1 .. 100){
	$wpi->write_pin($pin,1);
	sleep 1;
	$wpi->write_pin($pin,0);
	sleep 1;
	print "$_\n";	
}
