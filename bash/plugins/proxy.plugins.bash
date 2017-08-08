#
#  PROXY - Proxy Handler [BASH script version]
#
#  author    Juan J Gonzalez Cardenas [Jota Jota] - <https://github.com/MyXelf/mx-dot-files>
#  version   1.0.0.0
#  date      12.Oct.2014
#
#  legal     Copyright (c) 2014-2017. Licensed under the MIT license.
#

#
# Function: _proxy_set()
#
# TODO: Function description
#
# @params
#   $1 = Preset Title
#   $2 = Proxy URI
#   $3 = Proxy Skip
#
_proxy_set () {
  # Preset name to use as fallback in several cases
  local proxy_direct_preset="Direct"

  local preset_name=$1 proxy_uri="$2" proxy_skip="$3" proxy_var

  # Determine the action to do with the Proxy environment variables. Only when
  # "Direct" is the desired preset, the $proxy_uri variable is NULL.
  [ -n "$proxy_uri" ] && local action='export' || local action='unset'

  # For every $proxy_var the same action will happen to the $PROXY_VAR counterpart
  for proxy_var in 'all_proxy' 'http_proxy' 'https_proxy' 'ftp_proxy' 'rsync_proxy'; do
    case "$action" in
      export ) export $proxy_var="$proxy_uri" ${proxy_var^^}="$proxy_uri";;
      unset  ) unset $proxy_var ${proxy_var^^};;
    esac
  done

  # Determine the action with 'no_proxy' and 'NO_PROXY' environment variables
  [ -n "$proxy_skip" ] && local action='export' || local action='unset'
  proxy_var='no_proxy'
  case "$action" in
    export ) export $proxy_var="$proxy_skip" ${proxy_var^^}="$proxy_skip";;
    unset  ) unset $proxy_var ${proxy_var^^};;
  esac

  # Update the Active Preset
  PROXY_ACTIVE_PRESET=$1
}

#
# Function: _proxy_retrieve_active_preset_name()
#
# TODO: Function description
#
_proxy_retrieve_active_preset_name () {
  # Preset name to use as fallback in several cases
  local proxy_direct_preset="Direct"
  local pfile_active_preset

  if [ -f "$PROXY_PRESETS_FILE" ]; then
    # Retrieve the value of the 'active_preset' entry from the PROXY_PRESETS_FILE
    IFS='= ' read -r _ pfile_active_preset < <(grep -m1 '^active_preset' "$PROXY_PRESETS_FILE" 2> /dev/null)

    if [ -z "$pfile_active_preset" ]; then
      e_wm "No 'active_preset' specified in the 'Proxy Presets' file."
      return $E_FAILURE
    fi
  else
    e_em "Unable to read the 'Proxy Presets' file."
    return $E_FAILURE
  fi

  # Return the Preset name
  echo ${pfile_active_preset:-$proxy_direct_preset}

  return $E_SUCCESS
}

#
# Function: _proxy_pfile_load_preset()
#
# TODO: Function description
#
_proxy_activate_preset () {
  # Preset name to use as fallback in several cases
  local proxy_direct_preset="Direct"

  local preset_name=$1 preset_id=${1,,} preset_found=0
  local preset_pattern="^[[:digit:]]+:${preset_id}\.proxy_(meth|host|port|user|pass|skip)[[:space:]]*=[[:space:]]*(.*)"

  # Direct Preset
  if [ "$preset_id" = "${proxy_direct_preset,,}" ]; then
    _proxy_set $proxy_direct_preset '' ''
    return $E_SUCCESS
  fi

  # Proxy Preset default values
  declare -A preset_values
  preset_values['meth']='http'
  preset_values['host']=''
  preset_values['port']=3128
  preset_values['user']=''
  preset_values['pass']=''
  preset_values['skip']='127.0.0.1'

  # Read the section title of the specified Preset from the PROXY_PRESETS_FILE
  preset_name=$(grep -im1 "^\[${preset_id}\]" "$PROXY_PRESETS_FILE")
  [ ! -z "$preset_name" ] && preset_name=${preset_name:1:-1} || preset_name=$preset_id

  # Read the specified Preset from the PROXY_PRESETS_FILE
  while read preset_line; do
    preset_found=1

    if [[ $preset_line =~ $preset_pattern ]]; then
      preset_values[${BASH_REMATCH[1]}]=${BASH_REMATCH[2]}
    else
      # TODO: Move this to a different array and later print the formatted lines
      e_wm "Syntax Error on line ${preset_line}"
    fi

    # Only filtering the lines starting with the id of the preset, so we can
    # check later with BASH_REMATCH the correct formatting of all the lines. The
    # lines will be prefixed with the line number for pointing the wrong ones.
  done < <(grep --line-number "^${preset_id}\." "$PROXY_PRESETS_FILE")

  # The specified Preset was not found on the PROXY_PRESETS_FILE
  if [ $preset_found -eq 0 ]; then
    # TODO: Determine what to do with the PROXY_ACTIVE_PRESET
    e_em "Preset '${preset_name}' not found in the 'Proxy Presets' file."
    return $E_FAILURE
  fi

  # TODO: Print the syntax error lines

  # Conform the URI for the proxy related environment variables
  # TODO: Implement the user + password
  local proxy_uri="${preset_values['meth']}://${preset_values['host']}:${preset_values['port']}"

  # Modify the proxy environment configuration
  _proxy_set $preset_name "$proxy_uri" "${preset_values['skip']}"

  return $E_SUCCESS
}

#
# Function: proxy()
#
# Helper tool to work with the Proxy settings at the system level
#
proxy () {
  case "$1" in
    # Display current environment
    '' )
      e_hr 'Proxy Handler' 'Current Environment' '\n'
      e_ac "Active Preset = ${I_YELLOW}${PROXY_ACTIVE_PRESET}${R_COLOR}"
      e_ac "Presets File  = ${PROXY_PRESETS_FILE}"
      penv_evars -c 'http_proxy|no_proxy' "\n${I_GRAY}# Generic Proxy Variables${R_COLOR}" "  %-5s %-10s %s %s\n" '='
      ;;

    # Preset name to modify the active one
    [a-zA-Z]* )
      echo "Preset Name?"
      # TODO: Check for $2 asking to fix the preset name in the PFILE
      _proxy_activate_preset $1
      ;;

    # List available presets defined in the PROXY_PRESETS_FILE
    --list | -l )
      echo "Option [$1] List"
      ;;

    # Edit the PROXY_PRESETS_FILE configuration file
    --edit | -e )
      $EDITOR $PROXY_PRESETS_FILE
      ;;

    --help | -h )
      _proxy_plugin_help $FUNCNAME
      ;;

    * )
      e_em "Unknown parameter in command line: $@\n       Try '$FUNCNAME --help' for more information."
      ;;
  esac
}

# --------------------------------------------------------------------------------------------------
#  Base Functions
# --------------------------------------------------------------------------------------------------

#
# Function: _proxy_plugin_init()
#
# Setup the plugin required environment (Autoloading Function)
#
_proxy_plugin_init () {
  # Define the Proxy Presets file (PROXY_PRESETS_FILE) if undefined
  [ -z "$PROXY_PRESETS_FILE" ] && PROXY_PRESETS_FILE=$MXDF_BASH_LOCAL/proxy-presets.ini

  local RV
  RV=$(_proxy_retrieve_active_preset_name)
  [ $? -eq $E_SUCCESS ] && _proxy_activate_preset $RV || echo $RV
} &&
_proxy_plugin_init

#
# Function: _proxy_plugin_help()
#
# Display the Help for the plugin and the related functions
#
_proxy_plugin_help () {
  _mxdf_show_header $BASH_SOURCE

  case "$1" in
    proxy ) cat <<__HEREDOC_PROXY_HELP
TBW!
__HEREDOC_PROXY_HELP
      ;;

    * ) _describe_component_item $BASH_SOURCE
      ;;
  esac

  _mxdf_show_copyright
}

