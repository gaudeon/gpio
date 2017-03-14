#!/usr/bin/python
import time
import RPi.GPIO as GPIO
GPIO.setmode(GPIO.BOARD)
GPIO.setup(11, GPIO.IN)

while True:
	mybutton = GPIO.input(11)
	if mybutton == False:
		print "Pressed"
		time.sleep(.2)
