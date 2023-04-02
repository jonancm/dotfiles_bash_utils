source $(dirname ${BASH_SOURCE})/../term/print.sh

# Run command as privileged (root) user
# run_privileged <cmd> [<arg> ...]
run_privileged() {
	if [ `id -u` -eq 0 ]; then
		$*
	else
		if command -v doas &> /dev/null; then
			doas $*
		elif command -v please &> /dev/null; then
			please $*
		elif command -v sudo &> /dev/null; then
			sudo $*
		else
			panic "failed to run as root: could not find any of: doas, please, sudo"
		fi
	fi
}

sudo_if_needed() {
	SUDO_NEEDED="${1}"
	COMMAND="${@:2}"
	if [ $SUDO_NEEDED -eq 1 ]; then
		run_privileged ${COMMAND}
	else
		${COMMAND}
	fi
}
