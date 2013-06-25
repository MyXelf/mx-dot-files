#!/bin/bash

# --------------------------------------------------------------------------------------------------
#  Base Definitions
# --------------------------------------------------------------------------------------------------

# Common Exit Codes
export E_SUCCESS=0
export E_FAILURE=1

# Handy Colors. See 'hcolors.plugins.bash'
export BLACK='\033[0;30m'
export BLUE='\033[0;34m'
export GREEN='\033[0;32m'
export CYAN='\033[0;36m'
export RED='\033[0;31m'
export PURPLE='\033[0;35m'
export BROWN='\033[0;33m'
export GRAY='\033[1;30m'
export LIGHT_GRAY='\033[0;37m'
export LIGHT_BLUE='\033[1;34m'
export LIGHT_GREEN='\033[1;32m'
export LIGHT_CYAN='\033[1;36m'
export LIGHT_RED='\033[1;31m'
export LIGHT_PURPLE='\033[1;35m'
export YELLOW='\033[1;33m'
export WHITE='\033[1;37m'
export NCOLOR='\033[0m'

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

