#!/bin/sh

if [ ! -f /conf/aria2.conf ]; then
	cp /conf-copy/aria2.conf /conf/aria2.conf
	if [ $SECRET ]; then
		echo "rpc-secret=${SECRET}" >> /conf/aria2.conf
	fi
fi

touch /conf/aria2.session

darkhttpd /aria2-webui --port 80 &
aria2c --conf-path=/conf/aria2.conf --log=/logs.txt --file-allocation=trunc
