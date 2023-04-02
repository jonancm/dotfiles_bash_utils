NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LGRAY='\033[0;37m'
DGRAY='\033[1;30m'
LTRED='\033[1;31m'
LGREEN='\033[1;32m'
YELLOW='\033[1;33m'
LBLUE='\033[1;34m'
LPURPLE='\033[1;35m'
LCYAN='\033[1;36m'
WHITE='\033[1;37m'

print_regular() {
	echo -ne "$*"
}

print_info() {
	echo -ne "${BLUE}$*${NOCOLOR}"
}

print_tip() {
	echo -ne "${ORANGE}$*${NOCOLOR}"
}

print_title() {
	echo -ne "${LBLUE}$*${NOCOLOR}"
}

print_success() {
	echo -ne "${GREEN}$*${NOCOLOR}"
}

print_caution() {
	echo -ne "${YELLOW}$*${NOCOLOR}"
}

print_warning() {
	print_caution "WARNING: $*"
}

print_failure() {
	echo -ne "${RED}$*${NOCOLOR}"
}

print_error() {
	print_failure "ERROR: $*" >&2
}

# Print error and exit
panic() {
	print_failure "FATAL: $*\n"
	exit 1
}
