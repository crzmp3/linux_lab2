#!/bin/bash

while true; do
	http -b http://meteo.by > url.txt
	grep -n -A 7 '<p class="t ">' url.txt > url_new.txt
	sed -n 7p url_new.txt | awk '{print $2}'
	sleep $(awk -F "=" '/timeout/ {print $2}' config.ini)
done

