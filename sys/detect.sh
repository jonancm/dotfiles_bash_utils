source $(dirname ${BASH_SOURCE})/../term/print.sh

detect_os_family() {
	uname | tr '[:upper:]' '[:lower:]'
}

detect_os_distro() {
	case `detect_os_family` in
		darwin)
			;;
		freebsd|linux)
			grep '^ID=' /etc/os-release | awk '{split($0,a,"="); print(a[2])}'
			;;
		*)
			panic "unknown OS family"
			;;
	esac
}

detect_os_version() {
	case `detect_os_family` in
		darwin)
			;;
		freebsd|linux)
			grep '^VERSION_ID=' /etc/os-release | awk '{gsub(/"/,""); split($0,a,"="); print a[2]}'
			;;
		*)
			panic "unknown OS family"
			;;
	esac
}
