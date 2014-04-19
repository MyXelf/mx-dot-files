# To disable the Handy Colors tips by default at startup, export the following
# at someplace. For other options read Tip #2 in the hcolors() function.
#
# export HC_TIPS=0

#
# Function: hcolors()
#
# Show a demo of the Handy Colors
#
# Instead of keeping this function in sync with the definitions, the
# declarations are parsed directly from the environment variables.
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
  e_hc "${R_COLOR}"

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
  e_hc "\n ${I_BLUE}TIP #1:${R_COLOR} You can combine ${WHITE}\"Foreground\"${R_COLOR} and ${WHITE}\"Background\"${R_COLOR} definitions:"
  e_hc "         * echo -e \"\${I_YELLOW}\${ON_BLUE} You should see this line in ${I_YELLOW}I_YELLOW${R_COLOR} over ${BLUE}BLUE${R_COLOR}... \${R_COLOR}\""
  e_hc "           ${I_YELLOW}${ON_BLUE} You should see this line in I_YELLOW over BLUE... ${R_COLOR}"

  # Tip #2
  e_hc "\n ${I_GREEN}TIP #2:${R_COLOR} To avoid showing this ${WHITE}\"Tips\"${R_COLOR} do one of the following:"
  e_hc "         * Pass anything as an argument to this function (i.e. ${I_RED}${FUNCNAME} x${R_COLOR})"
  e_hc "         * Export ${MAGENTA}HC_TIPS${R_COLOR} with any value"

  # Tip #3
  e_hc "\n ${RED}TIP #3:${R_COLOR} Consider this ${BLACK}${ON_WHITE} Tips ${R_COLOR} as Examples ${I_YELLOW};-)${R_COLOR} ${I_GRAY}(See the Code)${R_COLOR}\n"
}

#
# Function: hl()
#
# Highlight output
#
# Making use of the Handy Colors and SED-compatible regular expressions, with
# multiple sets support.
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

#
# Function: hrainbow()
#
# Show all available ANSI colors codes
#
# Based on 'ansicolors' Copyright 2004 by Nico Golde <nico@ngolde.de>
#
hrainbow () {
  local attr f b

  # Normal Colors
  for attr in 0 1 4 5 7; do
    echo '# -------------------------------------------------------------------------------------------------------------------------------------------'
    echo "#  ESC[${attr};Foreground;Background"
    echo '# -------------------------------------------------------------------------------------------------------------------------------------------'

    for f in 30 31 32 33 34 35 36 37; do
      printf '\033[%s;%sm \\033[%s;%02sm  ' $attr $f $attr $f
      for b in 40 41 42 43 44 45 46 47; do
        printf '\033[%s;%s;%sm \\033[%s;%02s;%02sm  ' $attr $f $b $attr $f $b
      done
      printf '\033[0m\n'
    done
  done

  # Intense Colors
  for attr in 0 1 4 5 7; do
    echo '# ---------------------------------------------------------------------------------------------------------------------------------------------------'
    echo "#  ESC[${attr};Foreground;Background"
    echo '# ---------------------------------------------------------------------------------------------------------------------------------------------------'

    for f in 90 91 92 99 94 95 96 97; do
      printf '\033[%s;%sm \\033[%s;%02sm  ' $attr $f $attr $f
      for b in 100 101 102 103 104 105 106 107; do
        printf '\033[%s;%s;%sm \\033[%s;%02s;%02sm  ' $attr $f $b $attr $f $b
      done
      printf '\033[0m\n'
    done
  done
}
