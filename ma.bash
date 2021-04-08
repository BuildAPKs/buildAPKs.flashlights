#!/bin/env bash # Copyright 2019 (c) all rights reserved 
# by BuildAPKs https://buildapks.github.io
#####################################################################
set -Eeuo pipefail
shopt -s nullglob globstar

_SMATRPERROR_() { # run on script error
	local RV="$?"
	echo "$RV" ma.bash
	printf "\\e[?25h\\n\\e[1;48;5;138mBuildAPKs %s ERROR:  Generated script error %s near or at line number %s by \`%s\`!\\e[0m\\n" "${PWD##*/}" "${1:-UNDEF}" "${2:-LINENO}" "${3:-BASH_COMMAND}"
	exit 147
}

_SMATRPEXIT_() { # run on exit
	printf "\\e[?25h\\e[0m"
	set +Eeuo pipefail 
	exit
}

_SMATRPSIGNAL_() { # run on signal
	local RV="$?"
	printf "\\e[?25h\\e[1;7;38;5;0mBuildAPKs %s WARNING:  Signal %s received!\\e[0m\\n" "ma.bash" "$RV"
 	exit 148 
}

_SMATRPQUIT_() { # run on quit
	local RV="$?"
	printf "\\e[?25h\\e[1;7;38;5;0mBuildAPKs %s WARNING:  Quit signal %s received!\\e[0m\\n" "ma.bash" "$RV"
 	exit 149 
}

trap '_SMATRPERROR_ $? $LINENO $BASH_COMMAND' ERR 
trap _SMATRPEXIT_ EXIT
trap _SMATRPSIGNAL_ HUP INT TERM 
trap _SMATRPQUIT_ QUIT 

cd "$JDR"
_AT_ ahmed9dz/flashlight 04287aa86097049612c8d5168b99f85329914d4d
_AT_ federicoculloca/JASF 3e27525d2e8fca36bb10d519d255e150d122b28b
_AT_ matthewmichihara/flashlight-android 2e05b6cf73b07d87be63776e8f0cb596cc1ca1e9
_AT_ mobilepearls/com.mobilepearls.flashlight 6ca25cc3442d08ff22dd4717d29791e23bb69b17
_AT_ sanbeg/flashlight 04287aa86097049612c8d5168b99f85329914d4d
_AT_ swgillan/DroidLight a106f2bfe7968021b4cc2313ef6858fdb686437b
#ma.bash OEF
