# --------------------------------------------------------------------------------------------------
#  Base Definitions
# --------------------------------------------------------------------------------------------------

# Common Exit Codes
export E_SUCCESS=0
export E_FAILURE=1

#
# Function: _hcolors_definition()
#
# Handy Colors definitions
#
# Declared in a function because of the mechanism used to demo the definitions
# in hcolors(). Also to unclutter this file.
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
# Determine if the passed argument is a defined 'command'
#
# A 'command' can be any 'alias', 'keyword', 'function', 'builtin' or 'file'.
# More specific functions could be already implemented in this file.
#
is_command () {
  type "$1" &>/dev/null
}

#
# Function: is_alias()
#
# Determine if the passed argument is a defined 'alias'
#
is_alias () {
  alias "$1" &>/dev/null
}

#
# Function: is_function()
#
# Determine if the passed argument is a defined 'function'
#
is_function () {
  declare -F "$1" &>/dev/null
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
# Load an specific 'item' inside a 'component' from the BASH section
#
_load_component_item () {
  [ -s $1 ] && source $1
}

#
# Function: _load_component()
#
# Load all "active items" from the 'component' directory passed as argument
#
# On the first cycle, the active items will be the 'upstream' files that are
# reflected inside the '.active-items.index' file. Only the files following the
# pattern <prefix>.<component>.bash will be included. If there is no index
# file, all the files matching the same pattern will be loaded.
#
# On the second cycle, the active items will be the 'local' files following
# the pattern: <prefix>.<component>.<local-component>.bash
#
# On both cases all the files starting with the characters [!_~.] will be
# excluded.
#
_load_component () {
  local component=$1 item
  local component_dir=$MXDF_BASH/$component
  local items_index=$component_dir/.active-items.index

  # Load 'upstream' items (including the 'local' component)
  if [ -s $items_index ]; then
    # Load valid items reflected in the '.active-items.index' file
    while read item; do
      _load_component_item $component_dir/$item.$component.bash
    done < <(command grep '^[^!_~.#]' $items_index)
  else
    # Load all valid items because there is no index file
    for item in $component_dir/[^!_~]*.$component.bash; do
      _load_component_item $item
    done
  fi

  # The 'local' component loads as 'upstream'
  [ "$component" == 'local' ] && return $E_SUCCESS

  # Load 'local' items
  for item in $component_dir/[^!_~]*.$component.$BASH_LOCAL_COMPONENT.bash; do
    _load_component_item $item
  done

  return $E_SUCCESS
}

#
# Function: _describe_component_item()
#
# Display the relevant information from an specific item
#
_describe_component_item () {
  # TODO: Prototype TBDev!
  local item

  while read item; do
    case "$item" in
      '# Function:'* ) e_ac "Function: ${WHITE}${item:12}${R_COLOR}" ;;
      '# '*          ) e_hc "  ${I_GRAY}${item:2}${R_COLOR}" '\n' ;;
    esac
  done < <(command grep -A3 '^# Function: [^_]' $1)
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

# Information Character
export IC="${I_GREEN}*${R_COLOR}"

#
# Function: e_ic()
#
# Echo a message prepending an Information Character
#
# Support the '-n' option to the echo built-in.
#
e_ic () {
  echo -en "$IC "
  echo -e "$@"
}

#
# Function: e_cm()
#
# Echo a Comment Message
#
e_cm () {
  echo -e "${I_GRAY}# ${@}${R_COLOR}"
}

#
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
#  Strings Helpers
# --------------------------------------------------------------------------------------------------

#
# Function: trim_var_whitespace()
#
# Trim the whitespaces from a variable passed by reference
#
trim_var_whitespace () {
  local tmp_var=${!1}
  tmp_var="${tmp_var##*( )}"   # Remove leading spaces
  tmp_var="${tmp_var%%*( )}"   # Remove trailing spaces
  eval $1=\$tmp_var
}

# --------------------------------------------------------------------------------------------------
#  MXDF::BASH Section
# --------------------------------------------------------------------------------------------------

#
# Function: _mxdf_show_header()
#
# Display the information extracted from the header of a MXDF file
#
_mxdf_show_header () {
  local item value name desc version date

  while read _ item value; do
    case "$item" in
      date    ) date=" - [$value]" ;;
      version ) version=" v$value" ;;
      *       ) name=$item
                [[ $value =~ -' '(.*)' [' ]] && desc=" :: ${BASH_REMATCH[1]}" ;;
    esac
  done < <(head -n9 $1 | command grep '^# .*\(version\|date\)')

  [ -n "$name" ] && e_hc "\n${name}${version}${desc}${date}\n"
}

#
# Function: _mxdf_show_copyright()
#
# Display the copyright banner of the MXDF
#
_mxdf_show_copyright () {
  e_hc "\n8-;"
  echo '  MXDF :: MyXelf Dot Files - <https://github.com/MyXelf/mx-dot-files>'
  echo '  Copyright © 2013-2024. Juan J Gonzalez Cardenas [Jota Jota]'
}

#
# Function: _mxdf_bash_reload()
#
# Reload a component inside the MXDF::BASH section or the whole section
#
_mxdf_bash_reload () {
  local component=$1

  if [ -z "$component" ]; then
    e_hc -n "Reloading ${WHITE}MXDF::BASH${R_COLOR} section using ${WHITE}<~/.bashrc>${R_COLOR} ... "
    _load_component_item $HOME/.bashrc
  else
    e_hc -n "Reloading ${WHITE}MXDF::BASH${R_COLOR} component: ${WHITE}<$component>${R_COLOR} ... "
    _load_component $component
  fi

  [ $? -eq 0 ] && e_hc "${WHITE}Done!${R_COLOR}" || e_hc "${RED}Error!${R_COLOR}"
}

#
# Function: mxdf-bash()
#
# Main interface to the MXDF::BASH section
#
# Completion enabled function
#
mxdf-bash () {
  _mxdf_bash_$1 $2
}

#
# Function: _mxdf_bash_complete()
#
# Completion for the mxdf-bash() function
#
_mxdf_bash_complete () {
  local cur prev words cword
  _init_completion || return

  local command w
  for ((w = 0; w < ${#words[@]} - 1; w++)); do
    [[ ${words[w]} == @(list|reload|enable|disable) ]] && command=${words[w]}
  done

  if [ -n "$command" ]; then
    COMPREPLY=( $(compgen -W "aliases completions $BASH_LOCAL_COMPONENT plugins system" -- "$cur") )
    return 0
  fi

  if [[ "$cur" == -* ]]; then
    COMPREPLY=( $(compgen -W '-h --help' -- "$cur") )
  else
    COMPREPLY=( $(compgen -W 'list reload enable disable help' -- "$cur") )
  fi
} &&
complete -F _mxdf_bash_complete mxdf-bash

