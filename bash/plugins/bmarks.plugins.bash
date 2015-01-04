#
#  BMARKS - BookMarks Handler [BASH script version]
#
#  author    Juan J Gonzalez Cardenas [Jota Jota] - <https://github.com/MyXelf/mx-dot-files>
#  version   1.0.0.3
#  date      05.Oct.2014
#
#  legal     Copyright (c) 2012-2015. Licensed under the MIT license.
#

#
# Function: bms()
#
# Save BMark
#
bms () {
  local bmark_match bmark_name bmark

  # Directory already BMarked
  bmark_match=$(grep -m1 " = ${PWD}$" $BMARKS_FILE)

  if [ ! -z "$bmark_match" ]; then
    e_em "Directory already BMarked: '$bmark_match'"
    return $E_FAILURE
  fi

  # Get or set the BMark name
  [ -z "$1" ] && bmark_name=$(basename $PWD) || bmark_name=$1

  # BMark name already in use
  bmark_match=$(grep -m1 "^$bmark_name =" $BMARKS_FILE)

  if [ ! -z "$bmark_match" ]; then
    echo "BMark name already in use: '$bmark_match'"
    return $E_FAILURE
  fi

  # Do the BMark
  bmark="$bmark_name = $PWD"
  echo  $bmark >> $BMARKS_FILE
  echo "BMark: '$bmark' created!"
}

#
# Function: bmv()
#
# Return BMark value
#
# Completion enabled function
#
bmv () {
  local bmark_match

  # Check if BMark name is not empty
  if [ -z "$1" ]; then
    e_em "Please provide a BMark name"
    return $E_FAILURE
  fi

  # Check if supplied a valid BMark name
  bmark_match=$(grep -m1 "^$1 =" $BMARKS_FILE)

  if [ -z "$bmark_match" ]; then
    e_em "Invalid BMark name"
    return $E_FAILURE
  fi

  # Return the BMark value
  echo $(echo "$bmark_match" | cut -d' ' -f3-)

  return $E_SUCCESS
}

#
# Function: bm()
#
# Jump to a previously saved BMark
#
# Completion enabled function
#
bm () {
  local bmark_value

  # Get the BMark value
  bmark_value=$(bmv $1)

  # Invalid BMark name
  [ $? -eq $E_FAILURE ] && echo $bmark_value && return $E_FAILURE

  # Valid BMark name pointing to non-existent directory
  [ ! -d "$bmark_value" ] && e_em 'Valid BMark pointing to non-existent directory' && return $E_FAILURE

  # Jump to the BMark
  echo "Jumping to: '$bmark_value'"
  cd "$bmark_value"
}

#
# Function: bml()
#
# List all the defined BMarks
#
bml () {
  if [ "$1" = "-v" -o "$1" = "--verbose" ]; then
    # Show whole BMARKS_FILE (comments are formatted different)
    awk -F= '{ if (/^[^# ].*=/) printf "'$I_RED'%-20s'$R_COLOR'%s\n", $1, $2; else printf "'$I_GRAY'%s'$R_COLOR'\n", $0 }' $BMARKS_FILE
  else
    # Only show the valid BMarks (exclude the comments)
    awk -F= '/^[^# ].*=/ { printf "'$I_RED'%-20s'$R_COLOR'%s\n", $1, $2 }' $BMARKS_FILE
  fi
}

# --------------------------------------------------------------------------------------------------
#  Base Functions
# --------------------------------------------------------------------------------------------------

#
# Function: _bmarks_plugin_init()
#
# Setup the plugin required environment (Autoloading Function)
#
_bmarks_plugin_init () {
  # Define the BMARKS_FILE variable if undefined
  [ -z "$BMARKS_FILE" ] && BMARKS_FILE=$MXDF_BASH_LOCAL/bmarks.bmarks

  # Create the BMARKS_FILE if it doesn't exist
  [ ! -f "$BMARKS_FILE" ] && touch $BMARKS_FILE
} &&
_bmarks_plugin_init

#
# Function: _bmarks_plugin_help()
#
# Display the Help for the plugin and the related functions
#
_bmarks_plugin_help () {
  _mxdf_show_header $BASH_SOURCE

  case "$1" in
    bm ) cat <<__HEREDOC_BM_HELP
TBW!
__HEREDOC_BM_HELP
      ;;

    * ) _describe_component_item $BASH_SOURCE
      ;;
  esac

  _mxdf_show_copyright
}

# --------------------------------------------------------------------------------------------------
#  Completion Helpers
# --------------------------------------------------------------------------------------------------

#
# Function: _bmarks_complete()
#
# Completion for the BMarks functions
#
_bmarks_complete () {
  local cur prev words cword bmarks
  _init_completion || return

  bmarks=$(grep -o '^[^# ].*=' $BMARKS_FILE | cut -d' ' -f1)
  COMPREPLY=( $(compgen -W "$bmarks" -- "$cur") )
} &&
complete -F _bmarks_complete bm bmv

