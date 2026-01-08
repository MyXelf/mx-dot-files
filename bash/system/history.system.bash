# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# history.system.bash (MXDF::BASH)
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# --------------------------------------------------------------------------------------------------
#  OOSM :: Out-Of-Service Mode
# --------------------------------------------------------------------------------------------------

# The Out-Of-Service Mode will avoid the typed commands to be stored on the
# History. The main purpose is to keep your History clear of trivial commands
# (e.g. long testing sessions). Of course can also be used for illegal
# activities you don't want to be tracked down ;-)
#
# To enable this functionality by default at startup, export the following
# at someplace before this file (i.e. !bash_profile.local.bash).
#
# export OOSM_AUTOSTART=1

#
# Function: oos() = 'Out-Of-Service'
#
# Enable the OOSM
#
oos () {
  if [ -n "$HISTFILE" ]; then
    export OOSM_HFILE=$HISTFILE
    unset HISTFILE
  fi
}

#
# Function: bos() = 'Back-On-Service'
#
# Disable the OOSM
#
bos () {
  if [ -n "$OOSM_HFILE" ]; then
    export HISTFILE=$OOSM_HFILE
    unset OOSM_HFILE
    history -c
    history -r
  fi
}

#
# Function: oosm_active()
#
# Determine if the Out-Of-Service Mode is active
#
oosm_active () {
  [ -z "$HISTFILE" ]
}

# Determine if the OOSM must be reactivated
if [ -n "$OOSM_AUTOSTART" ] || oosm_active; then
  oosm_reactivate=1
fi

# --------------------------------------------------------------------------------------------------
#  History Options
# --------------------------------------------------------------------------------------------------

# History filename
export HISTFILE=$MXDF_BASH_LOCAL/bash_history

# Maximum number of lines in the History file
export HISTFILESIZE=10000

# Number of lines to keep in the current session
export HISTSIZE=10000

# Ignore duplicate and commands starting with spaces
export HISTCONTROL=ignorespace:ignoredups

# Ignore commands following this pattern. Beware of the History substitution
# commands (i.e. '!!'), as you may think you are repeating something that is
# not saved in the history.
export HISTIGNORE="&"                                      # Repeated commands
export HISTIGNORE=${HISTIGNORE}":~:-:..:..[2345?]:cd *"    # Directories Navigation
export HISTIGNORE=${HISTIGNORE}":l:l[slw1]:l\? *"          # Directories Listings
export HISTIGNORE=${HISTIGNORE}":g [lsd]:g dc:g ss"        # Git aliases (trivial ones)
export HISTIGNORE=${HISTIGNORE}":history:h:h? *"           # History
export HISTIGNORE=${HISTIGNORE}":bos:oos"                  # Out-Of-Service Mode
export HISTIGNORE=${HISTIGNORE}":exit"                     # Exit command

# Reactivate OOSM if needed
if [[ $oosm_reactivate -eq 1 ]]; then
  history -c       # Clear the current History before reloading it to avoid duplication
  history -r       # Reload the History right before unsetting it
  oos              # Activate OOSM

  unset oosm_reactivate
fi

