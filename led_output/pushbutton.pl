#!/usr/bin/perl

use strict;
use warnings;

use Time::HiRes qw(sleep);
use HiPi::Device::GPIO;
use HiPi::Constant qw( :raspberry );

my $dev = HiPi::Device::GPIO->new();
my $pin11 = $dev->export_pin( RPI_PAD1_PIN_11 );
$pin11->mode( RPI_PINMODE_INPT );
my $pin12 = $dev->export_pin( RPI_PAD1_PIN_12 );
$pin12->mode( RPI_PINMODE_OUTP );

while(1) {
	$pin12->value($pin11->value);
}
