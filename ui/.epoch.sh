# UI part of tz.epoch.sh
# This is not even a script, stupid and can't exist alone. It is purely
# ment for beeing included.


function print_epoch_help() {
	clear
			cat <<EOF
Usage: $EPOCH_SH_INFO [options]

Prints any valid standard time format in epoch format, i.e. in seconds and
nanoseconds. If no argument is given, script will return time since epoch in
epoch format (i.e. $(date +%s.%N))

This script is usable mostly for various time arithmetics


Options:
  -h        This help

Example:
  $EPOCH_SH_INFO
  #Print time since epoch

  $EPOCH_SH_INFO \$(echo " \$(date +%s.%N) - 10.0" | bc)
  #Print time 10 secons ago in epoch format.

EOF
}
	while getopts hc:t:d:s:l: OPTION; do
		case $OPTION in
		h)
			print_epoch_help $0
			exit 0
			;;
		?)
			echo "Syntax error:" 1>&2
			print_epoch_help $0 1>&2
			exit 2
			;;

		esac
	done
	shift $(($OPTIND - 1))

