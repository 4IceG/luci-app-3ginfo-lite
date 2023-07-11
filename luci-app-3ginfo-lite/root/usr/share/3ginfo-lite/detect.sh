#!/bin/sh

#
# (c) 2023 Cezary Jackiewicz <cezary@eko.one.pl>
#
# (c) 2023 modified by Rafał Wabik - IceG - From eko.one.pl forum
#

# from config modemdefine
DEVICE=$(uci -q get modemdefine.@general[0].main_modem)
if [ -n "$DEVICE" ]; then
	echo $DEVICE
	exit 0
fi

DEVICE=$(uci -q get modemdefine.@modemdefine[0].comm_port)
if [ -n "$DEVICE" ]; then
	echo $DEVICE
	exit 0
fi

getdevicepath() {
	devname="$(basename $1)"
	case "$devname" in
	'ttyACM'*)
		devpath="$(readlink -f /sys/class/tty/$devname/device)"
		echo ${devpath%/*}
		;;
	'tty'*)
		devpath="$(readlink -f /sys/class/tty/$devname/device)"
		echo ${devpath%/*/*}
		;;
	*)
		devpath="$(readlink -f /sys/class/usbmisc/$devname/device)"
		echo ${devpath%/*}
		;;
	esac
}

# from config
DEVICE=$(uci -q get 3ginfo.@3ginfo[0].device)
if [ -n "$DEVICE" ]; then
	echo $DEVICE
	exit 0
fi

# from temporary config
MODEMFILE=/tmp/modem
touch $MODEMFILE
DEVICE=$(cat $MODEMFILE)
if [ -n "$DEVICE" ]; then
	echo $DEVICE
	exit 0
fi

# find any device
DEVICES=$(find /dev -name "ttyUSB*" -o -name "ttyACM*" | sort -r)
# limit to devices from the modem
WAN=$(uci -q get network.wan.device)
if [ -e "$WAN" ]; then
	USBPATH=$(getdevicepath "$WAN")
	DEVICESFOUND=""
	for DEVICE in $DEVICES; do
		T=$(getdevicepath $DEVICE)
		[ "x$T" = "x$USBPATH" ] && DEVICESFOUND="$DEVICESFOUND $DEVICE"
	done
	DEVICES="$DEVICESFOUND"
fi
for DEVICE in $DEVICES; do
	gcom -d $DEVICE -s /usr/share/3ginfo-lite/check.gcom >/dev/null 2>&1
	if [ $? = 0 ]; then
		echo "$DEVICE" | tee $MODEMFILE
		exit 0
	fi
done

echo ""
exit 0
