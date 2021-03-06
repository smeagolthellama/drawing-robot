#!/bin/perl

use strict;
## Doesn't work. Can't install.
##use WiringPi::API;
## instead.
# Works!
use RPi::WiringPi; #for gpio pins 
use RPi::Const ':all';    #ditto
#
use Image::SVG::Path;
=pod
blink using WiringPi::API:
my $wpi=WiringPi::API->new();
$wpi->setup();
my $pin=29;
$wpi->pin_mode($pin,1); #setup pin 29 (aka 40 aka bcm 21) for output
for(1 .. 10){
	$wpi->write_pin($pin,1);
	sleep 1;
	$wpi->write_pin($pin,0);
	sleep 1;
}
=cut
=pod
blink using RPi::WiringPi:

my $pi=RPi::WiringPi->new();

my $pin=$pi->pin(21);
$pin->mode(1);

for(1..10){
	$pin->write(1);
	sleep 1;
	$pin->write(0);
	sleep 1;
}

you will notice that it is significantly shorter.
Also, this module provides servo controlls, as well as a heap of other things. see https://metacpan.org/pod/RPi::WiringPi for full list.
=cut

my $pi=RPi::WiringPi->new();

#print "what pin is the pen's solonoid on (0 for default)?";

my $inpin=0;#=<>;
while ($inpin !~/^[0-9]+$/ or $inpin<0 or $inpin>40){
	print "please input an interger between 0 and 40.";
	$inpin=<>;
}

if($inpin==0){
	$inpin=21;
}
my $pen=$pi->pin($inpin);
$pen->mode(OUTPUT);

sub pendown{
	$pen->write(ON);	
	print "pen down\n";
}

sub penup{
	$pen->write(OFF);
	print "pen up\n";
}

pendown;

sleep 1;

penup;
