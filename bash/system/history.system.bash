#!/bin/bash

# History filename
export HISTFILE=$MXDF_BASH_LOCAL/bash_history

# Maximum number of lines in the History file
export HISTFILESIZE=10000

# Number of lines to keep in the current session
export HISTSIZE=10000

# Ignore duplicate and commands starting with spaces
export HISTCONTROL=ignorespace:ignoredups

#
# Ignore commands following this pattern. Beware of the History substitution
# commands (i.e '!!'), as you may think you are repeating something that is not
# saved in the history.
#
export HISTIGNORE="&"                                      # Repeated commands
export HISTIGNORE=${HISTIGNORE}":..:..[2345?]:cd *"        # Filesystem Navigation
export HISTIGNORE=${HISTIGNORE}":l:l[slw1]:l\? *"          # Directory Listing
export HISTIGNORE=${HISTIGNORE}":g [lsd]:g dc:g ss"        # Git aliases (trivial ones)
export HISTIGNORE=${HISTIGNORE}":history:h:h? *"           # History
export HISTIGNORE=${HISTIGNORE}":man *:* --help"           # Man pages
export HISTIGNORE=${HISTIGNORE}":info *:help *:* --help"   # Info & Helps
export HISTIGNORE=${HISTIGNORE}":bos:oos"                  # Out-Of-Service Mode
export HISTIGNORE=${HISTIGNORE}":exit"                     # Exit command

