source $(dirname ${BASH_SOURCE})/../term/print.sh
source $(dirname ${BASH_SOURCE})/../sys/su.sh

bootstrap_macports() {
	read -p "Update port database? [y/n] " yn
	case $yn in
		[yY])
			print_info "Updating port database ...\n"
			run_privileged port -v selfupdate
			;;
		*)
			print_caution "Will not update port database\n"
	esac
}
