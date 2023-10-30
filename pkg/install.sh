source $(dirname ${BASH_SOURCE})/../term/print.sh
source $(dirname ${BASH_SOURCE})/../sys/su.sh

# Install package <pkg> if the executable <exe> cannot be found in the PATH
# install_pkg_if_not_found <pkg> <exe>
install_pkg_if_not_found() {
	PKG_NAME="${1}"
	BIN_NAME="${2}"
	if [ -z "${BIN_NAME}" ]; then
		BIN_NAME="${PKG_NAME}"
	fi
	print_regular "Checking ${PKG_NAME} ... "
	if ! command -v "${BIN_NAME}" &> /dev/null; then
		print_failure "${BIN_NAME} not found\n"
		print_info "Trying to install ${PKG_NAME} ...\n"
		install_pkgs "${PKG_NAME}"
		if [ $? -ne 0 ]; then
			panic "failed to install package: ${PKG_NAME}"
		fi
	else
		BIN_PATH=`command -v "${BIN_NAME}"`
		print_success "${BIN_PATH}\n"
	fi
}

# Install packages
# install_pkgs <pkg> [<pkg> ...]
install_pkgs () {
	if command -v apt-get &> /dev/null; then
		run_privileged apt-get install -y $*
	elif command -v dnf &> /dev/null; then
		run_privileged dnf install -y $*
	elif command -v pkg &> /dev/null; then
		run_privileged pkg install $*
	elif command -v port &> /dev/null; then
		run_privileged port -v install $*
	else
		panic "could not find a known package manager"
	fi
}
