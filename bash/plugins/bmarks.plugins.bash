#
#  BMARKS - BookMarks Handler [BASH script version]
#
#  author    Juan J Gonzalez Cardenas [Jota Jota] - <https://github.com/MyXelf/bmarks.bash>
#  version   1.0.0.1
#  date      24.Nov.2013
#
#  legal     Copyright (c) 2012-2013
#

#  history
#  -------
#  18.Jun.2012      v1.0.0.0
#                 * BMARKS - BookMarks Handler
#
#  24.Nov.2013      v1.0.0.1
#                 * Integration with MXDF
#                 * Make use of the Handy Colors in the bml() function
#

# Define these variables if we are not under the spell of MXDF (and you should)
if [ -z "$MXDF_ACTIVE" ]; then
  E_SUCCESS=0
  E_FAILURE=1
  I_GRAY='\033[1;30m'
  I_RED='\033[1;31m'
  R_COLOR='\033[0m'
fi

# Define the BMARKS_FILE variable if undefined
if [ -z "$BMARKS_FILE" ]; then
  [ -z "$MXDF_ACTIVE" ] && BMARKS_FILE=$HOME/bmarks.bmarks || BMARKS_FILE=$MXDF_BASH_LOCAL/bmarks.bmarks
fi

# Create the BMARKS_FILE if it doesn't exist
[ ! -f "$BMARKS_FILE" ] && touch $BMARKS_FILE

#
# Function: bms()
#
# Save BMark
#
bms () {
  local bmark_match
  local bmark_name
  local bmark

  # Directory already BMarked
  bmark_match=$(grep -m1 " = ${PWD}$" $BMARKS_FILE)

  if [ ! -z "$bmark_match" ]; then
    echo "Directory already BMarked: '$bmark_match'"
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
bmv () {
  local bmark_match

  # Check if BMark name is not empty
  if [ -z "$1" ]; then
    echo "Please provide a BMark name"
    return $E_FAILURE
  fi

  # Check if supplied a valid BMark name
  bmark_match=$(grep -m1 "^$1 =" $BMARKS_FILE)

  if [ -z "$bmark_match" ]; then
    echo "Invalid BMark name"
    return $E_FAILURE
  fi

  # Return the BMark value
  echo $(echo "$bmark_match" | cut -d' ' -f3-)

  return $E_SUCCESS
}

#
# Function: bm()
#
# Jump to BMark
#
bm () {
  local bmark_value

  # Get the BMark value
  bmark_value=$(bmv $1)

  # Failure
  if [ $? -eq $E_FAILURE ]; then
    echo $bmark_value
    return $E_FAILURE
  fi

  # Jump to the BMark
  echo "Jumping to: '$bmark_value'"
  cd "$bmark_value"
}

#
# Function: bml()
#
# List BMarks
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

#
# Function: _bmarks_complete()
#
# Word completion for BMarks functions
#
_bmarks_complete () {
  local bmark_names cur

  cur="${COMP_WORDS[COMP_CWORD]}"
  bmark_names=$(grep -o '^[^# ].*=' $BMARKS_FILE | cut -d' ' -f1)
  COMPREPLY=( $(compgen -W "$bmark_names" -- "$cur") )
} &&
complete -F _bmarks_complete bm bmv

