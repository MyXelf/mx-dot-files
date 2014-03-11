#!/bin/bash

# --------------------------------------------------------------------------------------------------
#  Base Definitions
# --------------------------------------------------------------------------------------------------

# Common Exit Codes
export E_SUCCESS=0
export E_FAILURE=1

#
# Function: _hcolors_definition()
#
# Handy Colors definitions. Declared in a function because of the mechanism
# used to demo the definitions in hcolors(). Also to unclutter this file.
#
# See 'hcolors.plugins.bash'
#
_hcolors_definition () {
  # Foreground :: Normal
  export BLACK='\033[0;30m'
  export RED='\033[0;31m'
  export GREEN='\033[0;32m'
  export YELLOW='\033[0;33m'
  export BLUE='\033[0;34m'
  export MAGENTA='\033[0;35m'
  export CYAN='\033[0;36m'
  export GRAY='\033[0;37m'

  # Foreground :: Intense
  export I_GRAY='\033[1;30m'
  export I_RED='\033[1;31m'
  export I_GREEN='\033[1;32m'
  export I_YELLOW='\033[1;33m'
  export I_BLUE='\033[1;34m'
  export I_MAGENTA='\033[1;35m'
  export I_CYAN='\033[1;36m'
  export WHITE='\033[1;37m'

  # Foreground :: Underline
  export U_BLACK='\033[4;30m'
  export U_RED='\033[4;31m'
  export U_GREEN='\033[4;32m'
  export U_YELLOW='\033[4;33m'
  export U_BLUE='\033[4;34m'
  export U_MAGENTA='\033[4;35m'
  export U_CYAN='\033[4;36m'
  export U_GRAY='\033[4;37m'

  # Background :: Normal
  export ON_BLACK='\033[40m'
  export ON_RED='\033[41m'
  export ON_GREEN='\033[42m'
  export ON_YELLOW='\033[43m'
  export ON_BLUE='\033[44m'
  export ON_MAGENTA='\033[45m'
  export ON_CYAN='\033[46m'
  export ON_WHITE='\033[47m'

  # Background :: Intense
  export ON_I_BLACK='\033[100m'
  export ON_I_RED='\033[101m'
  export ON_I_GREEN='\033[102m'
  export ON_I_YELLOW='\033[103m'
  export ON_I_BLUE='\033[104m'
  export ON_I_MAGENTA='\033[105m'
  export ON_I_CYAN='\033[106m'
  export ON_I_WHITE='\033[107m'

  # Reset
  export R_COLOR='\033[0m'
} &&
_hcolors_definition

# --------------------------------------------------------------------------------------------------
#  Base Functions
# --------------------------------------------------------------------------------------------------

#
# Function: is_command()
#
# Determine if the passed argument is a defined 'command'. A 'command' can be
# any 'alias', 'keyword', 'function', 'builtin' or 'file'. More specific
# functions could be already implemented in this file.
#
is_command () {
  type "$1" > /dev/null 2>&1
}

#
# Function: is_function()
#
# Determine if the passed argument is a defined 'function'
#
is_function () {
  declare -F "$1" > /dev/null 2>&1
}

#
# Function: is_user_root()
#
# Determine if the current user is 'root'
#
is_user_root () {
  [ $EUID -eq 0 ]
}

# --------------------------------------------------------------------------------------------------
#  Base Helpers
# --------------------------------------------------------------------------------------------------

#
# Function: _load_component_item()
#
# Loads an specific 'item' inside a 'component' from the BASH section
#
_load_component_item () {
  [ -s $1 ] && source $1
}

#
# Function: _load_component()
#
# Loads all "enabled items" from the 'component' directory passed as argument.
# "enabled item" are every file inside the 'component' directory not starting
# with the characters [!_~.] and following the pattern: <prefix>.<component>.bash
#
_load_component () {
  local component=$1
  for item in $MXDF_BASH/$component/[^!_~]*.$component.bash; do
    _load_component_item $item
  done
}

# --------------------------------------------------------------------------------------------------
#  Echo Helpers
# --------------------------------------------------------------------------------------------------

#
# Function: e_hc()
#
# Echo with Handy Colors support
#
# Also support the '-n' option to the echo built-in.
#
e_hc () {
  echo -e "$@"
}

#
# Function: e_hr()
#
# Echo a Header
#
# If more than one parameter is specified a '::' will be printed after the
# first one.
#
e_hr () {
  local p1
  [[ -n "$2" && "$2" != "\n" ]] && p1="$1 :: " || p1=$1
  shift
  echo -e "\n${WHITE}${p1}${@}${R_COLOR}"
}

# Automation Character
export AC="${I_GREEN}>${R_COLOR}"

#
# Function: e_ac()
#
# Echo a message prepending an Automation Character
#
# Support the '-n' option to the echo built-in.
#
e_ac () {
  echo -en "$AC "
  echo -e "$@"
}

# Function: e_cm()
#
# Echo a Comment Message
#
e_cm () {
  echo -e "${I_GRAY}# ${@}${R_COLOR}"
}

# Function: e_dm()
#
# Echo a Dashed Message
#
e_dm () {
  echo -e "  ${I_GRAY}- $@ -${R_COLOR}"
}

#
# Function: e_em()
#
# Echo an Error Message
#
e_em () {
  echo -e "${RED}ERROR:${R_COLOR} $@"
}

#
# Function: e_wm()
#
# Echo a Warning Message
#
e_wm () {
  echo -e "${I_YELLOW}WARNING:${R_COLOR} $@"
}

# --------------------------------------------------------------------------------------------------
#  OOSM :: Out-Of-Service Mode
# --------------------------------------------------------------------------------------------------

#
# The Out-Of-Service Mode will avoid the typed commands to be stored on the
# History. The main purpose is to keep your History clear of trivial commands
# (e.g. long testing sessions). Of course can also be used for illegal
# activities you don't want to be tracked down ;-)
#

# Disable autostarting in OOS mode by default
unset OOSM_AUTOSTART

#
# Function: oos() = 'Out-Of-Service'
#
# Enable the OOSM
#
oos () {
  if [ -n "$HISTFILE" ]; then
    export OOSM_HFILE=$HISTFILE
    unset HISTFILE
  fi
}

#
# Function: bos() = 'Back-On-Service'
#
# Disable the OOSM
#
bos () {
  if [ -n "$OOSM_HFILE" ]; then
    export HISTFILE=$OOSM_HFILE
    unset OOSM_HFILE
    history -c
    history -r
  fi
}

#
# Function: oosm_active()
#
# Determine if the Out-Of-Service Mode is active
#
oosm_active () {
  [ -z "$HISTFILE" ]
}

