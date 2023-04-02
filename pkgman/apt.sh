source $(dirname ${BASH_SOURCE})/../console/print.sh
source $(dirname ${BASH_SOURCE})/../system/su.sh

bootstrap_apt() {
	read -p "Update apt database? [y/n] " yn
	case $yn in
		[yY])
			print_info "Updating apt database ...\n"
			run_privileged apt-get update
			;;
		*)
			print_caution "Will not update apt database\n"
	esac
}
