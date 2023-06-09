#!/bin/bash

if ping -q -c 1 -W 1 ping.eu > /dev/null ; then

	cd $HOME/.config
	git clone https://github.com/davidnsousa/dlemonbox
	cd $HOME/.config/dlemonbox
	cp -r filesystem/home/user/. $HOME
	cd ~
	rm -r $HOME/.config/dlemonbox
	bash $XDG_CONFIG_HOME/scripts/refresh.sh
	notify-send "The desktop is up to date!"

	# take note of update date to compare with commit dates and notify updates
	echo $(date +%s) > ~/.last_update_date
fi
