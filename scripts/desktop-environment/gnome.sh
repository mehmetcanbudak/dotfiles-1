#!/usr/bin/env bash

#github-action genshdoc
#
# @file Gnome custom script
# @brief Contains the functions used to configure and theme Gnome desktop environment
# @stdout Output routed to install.log
# @stderror Output routed to install.log

gnome_backup_existing() {
	dconf dump / >"$BACKUP_LOCATION"/"$(cat /etc/hostname)".dconf
}

gnome_copy_configuration() {
	# copy home folder dotfiles
	cp -r "$DOTS_DIR"/linux/gnome/home/. ~
}

gnome_install() {
	gnome_backup_existing

	gnome_copy_configuration

	cat_theme_all
}
