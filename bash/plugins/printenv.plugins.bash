#
#  PRINTENV - Print the Shell Environment [BASH script version]
#
#  author    Juan J González Cárdenas [Jota Jota] - <https://github.com/MyXelf/mx-dot-files>
#  version   1.0.0.3
#  date      12.Oct.2014
#
#  legal     Copyright © 2013-2026. Licensed under the MIT license.
#

#
# Function: _penv_filter()
#
# Filter the Shell Environment to show an specific type
#
_penv_filter () {
  # All variables prefixed with the function name to filter them out of the
  # 'Local Variables' list
  local __penv_filter_type_filter=$1
  local __penv_filter_case_switch=$2
  local __penv_filter_pattern=$3
  local __penv_filter_format=${4:-"$AC %-5s %s%s%s\n"}
  local __penv_filter_joiner=${5:-' = '}
  local __penv_filter_declare_filter __penv_filter_lvalue __penv_filter_rvalue

  case $__penv_filter_type_filter in
    evars ) __penv_filter_declare_filter='x' ;;     # Environment Variables
    lvars ) __penv_filter_declare_filter='' ;;      # Local Variables
    funcs ) __penv_filter_declare_filter='F'        # Functions
            __penv_filter_joiner='()' ;;
  esac

  # Based on solution proposed by Stephane Chazelas
  # http://unix.stackexchange.com/questions/72506/how-to-print-shell-variables-and-values-to-be-able-to-copy-paste-them?rq=1
  #
  # XXX:
  #   - The 'shopt' will determine if the pattern match should be case
  #     sensitive or insensitive. Done there to keep it at the subshell level.
  #   - 1st return: Besides the first comment in this function, will filter out
  #     the exported vars from the local variables listing.
  #   - 2nd return: The pattern match, only happening at the left of the '='.
  #     Extended to use the RE-Match mechanism of BASH.
  (
    MATCH=$E_FAILURE
    shopt $__penv_filter_case_switch nocasematch

    eval 'declare() {
            [[ $__penv_filter_type_filter = "lvars" && ($1 == *x* || $2 == __penv_filter_*) ]] && return
            [[ ! ${2%%=*} =~ $__penv_filter_pattern ]] && return

            MATCH=$E_SUCCESS
            __penv_filter_lvalue=${2%%=*}
            [[ $__penv_filter_type_filter != "funcs" ]] && __penv_filter_rvalue=${2#*=}

            printf "$__penv_filter_format" "$1" "$__penv_filter_lvalue" "$__penv_filter_joiner" "$__penv_filter_rvalue"
          }'"
          $(declare -p${__penv_filter_declare_filter})"

    [ $MATCH -eq $E_FAILURE ] && e_dm 'No Matches'
  )
}

#
# Function: penv_evars()
#
# Display the 'Environment Variables'
#
penv_evars () {
  local case_switch='-s'
  [ "$1" = '-c' ] && case_switch='-u' && shift
  if [ "$2" != '-' ]; then
    [ -z "$2" ] && e_hr 'Environment Variables (Exported)' || e_hc $2
  fi
  _penv_filter evars $case_switch "$1" "$3" "$4"
}

#
# Function: penv_lvars()
#
# Display the 'Local Variables'
#
penv_lvars () {
  local case_switch='-s'
  [ "$1" = '-c' ] && case_switch='-u' && shift
  if [ "$2" != '-' ]; then
    [ -z "$2" ] && e_hr 'Local Variables (Non Exported)' || e_hc $2
  fi
  _penv_filter lvars $case_switch "$1" "$3" "$4"
}

#
# Function: penv_funcs()
#
# Display the defined Shell functions
#
penv_funcs () {
  local case_switch='-s'
  [ "$1" = '-c' ] && case_switch='-u' && shift
  if [ "$2" != '-' ]; then
    [ -z "$2" ] && e_hr 'Functions' || e_hc $2
  fi
  _penv_filter funcs $case_switch "$1" "$3" "$4"
}

#
# Function: penv()
#
# Display all Shell variables and functions
#
penv () {
  [[ $1 = '-h' || $1 = '--help' ]] && _printenv_plugin_help $FUNCNAME && return $E_SUCCESS

  for type in 'evars' 'lvars' 'funcs'; do
    penv_$type "$@"
  done
  unset type
}

# --------------------------------------------------------------------------------------------------
#  Base Functions
# --------------------------------------------------------------------------------------------------

#
# Function: _printenv_plugin_help()
#
# Display the Help for the plugin and the related functions
#
_printenv_plugin_help () {
  _mxdf_show_header $BASH_SOURCE

  case "$1" in
    penv ) cat <<__HEREDOC_PENV_HELP
$1 is capable of printing the shell environment, showing only declarations
that match an specified pattern and with deal control of the output format.

Usage:
  $1 [<option>] [<pattern>] [<header>] [<format>] [<joiner>]

  <pattern>    an Extended RE to filter the declarations to output, the match
               is only done on the left-value part of the declarations
  <header>     output string that will precede the results, use '-' to display
               no header
  <format>     string supported by printf() defining the format of the output,
               with 4 placeholders for the predefined variables
  <joiner>     string to print between the left-value and the right-value of
               the declarations to output

Example:
  penv_lvars 'bash_(arg|ver)' 'BASH Vars Demo' '%-5s %s %s %s\n' '<=>'

Options:
  -c           pattern matching case-sensitive, by default is case-insensitive
  -h, --help   print this help message and exit (valid option only for penv)

There are three predefined categories to work on. For each category there is a
helper tool to aid in the filtering:

  penv_evars   print the 'Environment Variables (Exported)'
  penv_lvars   print the 'Local Variables'
  penv_funcs   print the defined shell 'Functions'
  penv         comprise the output of the three tools together
__HEREDOC_PENV_HELP
      ;;

    * ) _describe_component_item $BASH_SOURCE
      ;;
  esac

  _mxdf_show_copyright
}

