#!/bin/bash

# ======================
# TERMINAL OUTPUT COLORS
# text formats
RESET=`tput sgr0`
BOLD=`tput bold`
DIM=`tput dim`
REVERSE=`tput rev`
NORMAL="\033[21m"
# text colors
BLACK=`tput setaf 0`
RED=`tput setaf 1`
GREEN=`tput setaf 2`
YELLOW=`tput setaf 3`
BLUE=`tput setaf 4`
MAGENTA=`tput setaf 5`
CYAN=`tput setaf 6`
LIGHTGRAY=`tput setaf 7`
DARKGRAY=`tput setaf 0; tput bold`
WHITE=`tput setaf 7; tput bold`
# TERMINAL OUTPUT COLORS
# ======================

# ======================
# MARKS
INFOMARK="$DARKGRAY$BOLD❖$RESET"
CHECKMARK="$GREEN$BOLD✔$RESET"
ALERTMARK="$YELLOW$BOLD❗$RESET"
CROSSMARK="$RED$BOLD✖$RESET"
# MARKS
# ======================

# ======================
# PREFIXES
YEP="$BOLD${GREEN}YEP$RESET"
NOPE="$BOLD${RED}NOPE$RESET"
EHH="$BOLD${RED}EHH$RESET"
ERR="$BOLD${RED}ERROR$RESET"
MEH="$BOLD${MAGENTA}MEH$RESET"
# PREFIXES
# ======================
