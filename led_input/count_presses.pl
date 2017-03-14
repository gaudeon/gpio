#!/usr/bin/perl

use strict;
use warnings;

use Time::HiRes qw(sleep);
use HiPi::Device::GPIO;
use HiPi::Constant qw( :raspberry );

my $dev = HiPi::Device::GPIO->new();
my $pin = $dev->export_pin( RPI_PAD1_PIN_11 );
$pin->mode( RPI_PINMODE_INPT );

my $count = 0;
while(1) {
	unless($pin->value) {
		$count++;
		print "count $count\n";
		sleep .2;	
	}
}
