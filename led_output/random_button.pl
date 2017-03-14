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
	if(! $pin11->value) {
		my $flash = int(rand() * 5) + 1;
		print $flash, "\n";
		do {
			$pin12->value(1);
		} while(! $pin11->value);
		while($flash) {
			$pin12->value(0);
			sleep .5;
			$pin12->value(1);
			sleep .5;
			$flash--;
		}
	}
	else {
		$pin12->value(1);
	}
}
