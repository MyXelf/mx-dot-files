#!/bin/bash

#
# Function: _penv_filter()
#
# Filters the Shell variables to show specific types
#
_penv_filter () {
  # All variables prefixed with the function name to filter them out of the
  # 'Local Variables' list
  local __penv_filter_type_filter=$1
  local __penv_filter_pattern=$2
  local __penv_filter_suffix

  case $__penv_filter_type_filter in
    evars ) __penv_filter_declare_filter='x';;     # Environment Variables
    lvars ) __penv_filter_declare_filter='';;      # Local Variables
    funcs ) __penv_filter_declare_filter='F'       # Functions
            __penv_filter_suffix='()';;
  esac

  # Based on solution proposed by Stephane Chazelas
  # http://unix.stackexchange.com/questions/72506/how-to-print-shell-variables-and-values-to-be-able-to-copy-paste-them?rq=1
  (
    # Make pattern match case-insensitive
    # Do it here to keep it at the subshell level
    shopt -s nocasematch

    eval 'declare() {
            [[ $__penv_filter_type_filter = "lvars" && ($1 == *x* || $2 == __penv_filter_*) ]] && return
            [[ ${2%%=*} != *$__penv_filter_pattern* ]] && return

            echo -ne "${I_GREEN}>${R_COLOR}"; printf " %-5s %q%s\n" "$1" "$2" "$__penv_filter_suffix"
          }'"
          $(declare -p${__penv_filter_declare_filter})"
  )
}

#
# Function: penv_evars()
#
# Displays the 'Environment Variables'
#
penv_evars () {
  echo -e "\n${WHITE}Environment Variables (Exported)${R_COLOR}"
  _penv_filter evars $1
}

#
# Function: penv_lvars()
#
# Displays the 'Local Variables'
#
penv_lvars () {
  echo -e "\n${WHITE}Local Variables (Non Exported)${R_COLOR}"
  _penv_filter lvars $1
}

#
# Function: penv_funcs()
#
# Displays the defined Shell functions
#
penv_funcs () {
  echo -e "\n${WHITE}Functions${R_COLOR}"
  _penv_filter funcs $1
}

#
# Function: penv()
#
# Displays all Shell variables and functions
#
penv () {
  for type in 'evars' 'lvars' 'funcs'; do
    penv_$type $1
  done
  unset type
}

