source $(dirname ${BASH_SOURCE})/../term/print.sh
source $(dirname ${BASH_SOURCE})/../sys/su.sh

uninstall_pkgs() {
	if command -v apt-get &> /dev/null; then
		run_privileged apt-get remove -y $*
	elif command -v dnf &> /dev/null; then
		run_privileged dnf remove -y $*
	elif command -v port &> /dev/null; then
		run_privileged port -v uninstall $*
	else
		panic "could not find a known package manager"
	fi
}
