#!/bin/bash

# ----------------------------------------------------------------------------------------------------------------------
#  Base Helpers
# ----------------------------------------------------------------------------------------------------------------------

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

