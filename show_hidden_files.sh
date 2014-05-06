#!/bin/bash

# This should work for any version of Mac OS X.

# The casing of the "Finder" program changed with
# Mac OS X 10.9 (Mavericks) (com.apple.finder).
# For OS X versions 10.8 and below, the casing must be
# "com.apple.Finder".

SW_VERSION=`sw_vers | grep 'ProductVersion:' | grep -o '[0-9]*\.[0-9]*\.[0-9]*'`

if [ "$SW_VERSION" \< "10.9" ]; then
	if [ "$1" == "on" ]; then
		defaults write com.apple.Finder AppleShowAllFiles TRUE;
		killall Finder;
	else 
		if [ "$1" == "off" ]; then
			defaults write com.apple.Finder AppleShowAllFiles FALSE;
			killall Finder;
		fi
	fi
else 
	if [ "$1" == "on" ]; then
		defaults write com.apple.finder AppleShowAllFiles TRUE; 
		killall Finder;
	else 
		if [ "$1" == "off" ]; then
			defaults write com.apple.finder AppleShowAllFiles FALSE;
			killall Finder;
		fi
	fi
fi



