#!/bin/bash

#
# Function: hcolors()
#
# Shows a demo of the Handy Colors. Instead of keeping this function in sync
# with the definitions, the declarations are parsed directly from the
# environment variables.
#
# See '!base.system.bash'
#
hcolors () {
  # The name of the function defining the 'Handy Colors'
  local hc_function='_hcolors_definition'

  is_function $hc_function || return $E_FAILURE

  local hc_caption="Handy Colors for BASH :: Demo from the 'mx-dot-files'"
  local hc_pattern="export (.*)='(.*m)';?$"
  local hc_index=1 hc_name hc_code

  # Reset to Normal (JIC)
  echo -e "${R_COLOR}"

  while read -r hc_line; do
    if [[ $hc_line =~ $hc_pattern ]]; then
      hc_name='${'${BASH_REMATCH[1]}'}'
      hc_code=${BASH_REMATCH[2]}

      printf "%-20s %-15s ${hc_code} %s ${R_COLOR}\n" "$hc_name" "$hc_code" "$hc_caption"
      (( hc_index++ % 8 == 0 )) && echo
    fi
  done < <(declare -f $hc_function 2> /dev/null)

  # Doing anything from "Tip #2" will avoid showing the Tips
  [[ -n "$1" || -n "$HC_TIPS" ]] && return $E_SUCCESS

  echo # Here comes the TIPS

  # Tip #1
  echo -e "\n ${I_BLUE}TIP #1:${R_COLOR} You can combine ${WHITE}\"Foreground\"${R_COLOR} and ${WHITE}\"Background\"${R_COLOR} definitions:"
  echo -e "         * echo -e \"\${I_YELLOW}\${ON_BLUE} You should see this line in ${I_YELLOW}I_YELLOW${R_COLOR} over ${BLUE}BLUE${R_COLOR}... \${R_COLOR}\""
  echo -e "           ${I_YELLOW}${ON_BLUE} You should see this line in I_YELLOW over BLUE... ${R_COLOR}"

  # Tip #2
  echo -e "\n ${I_GREEN}TIP #2:${R_COLOR} To avoid showing this ${WHITE}\"Tips\"${R_COLOR} do one of the following:"
  echo -e "         * Pass anything as an argument to this function (i.e ${I_RED}${FUNCNAME} x${R_COLOR})"
  echo -e "         * Export ${MAGENTA}HC_TIPS${R_COLOR} with any value"

  # Tip #3
  echo -e "\n ${RED}TIP #3:${R_COLOR} Consider this ${BLACK}${ON_WHITE} Tips ${R_COLOR} as Examples ${I_YELLOW};-)${R_COLOR} ${I_GRAY}(See the Code)${R_COLOR}\n"
}

#
# Function: hl()
#
# Highlights output making use of the Handy Colors and SED-compatible regular
# expressions, with multiple sets support.
#
# Based on 'mycolorize' Copyright 2008 by Andreas Schamanek <andreas@schamanek.net>
# Previously distributed under the GPL license.
#
# Usage Examples
# --------------
#   tail -f <log-file> | hl $I_GREEN '^From: .*'
#   tail -f <log-file> | hl $WHITE '^From: \/.*' ${YELLOW}${ON_BLUE} 'Folder: .*'
#   tail -f <log-file> | hl $RED 'for \/\(her\|him\).*$'
#
# Notes
# -----
#   * Slashes / need no escaping (we use ^A as delimiter)
#   * \/ splits the coloring (similar to procmailrc. Matches behind get color.
#
# See '!base.system.bash'
#
hl () {
  local script color regex
  local sc=$(echo | tr '\012' '\001')  # Separator Character ^A (for SED)
  local rc=$(echo -e $R_COLOR)

  # Compile all rules given at command line to one script for SED
  while [ ! -z "$1" ]; do
    color=$(echo -e $1)
    regex=${2:-"."}
    shift && shift

    # If the regular expression includes \/ we split the substitution
    if [ "/${regex/*\\\/*/}/" = '//' ]; then
      regex="${regex/\\\//\)\(}"
      script="${script};s${sc}\($regex\)${sc}\1${color}\2${rc}${sc}g"
    else
      script="${script};s${sc}\($regex\)${sc}${color}\1${rc}${sc}g"
    fi
  done

  # Invoke SED
  sed -e "$script"
}

