#!/bin/bash


VARS=`egrep -v '^#' wordpress.env | grep '^WP_HOSTNAME'`
if [ -z "$VARS" ]; then
	echo "WP_HOSTNAME is unset in wordpress.env - please FIX!"
	exit
else 
	export $VARS
fi


# search in nginx-conf/nginx.conf for WP_HOSTNAME and replace it
sed -i 's/WP_HOSTNAME/$WP_HOSTNAME/g' nginx-conf/nginx.conf
