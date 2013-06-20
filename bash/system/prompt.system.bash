#!/bin/bash

#
# Function: prompt_command()
#
# Defines the commands that will be executed prior to issuing each primary
# Prompt Statement (PS1).
#
prompt_command () {
  # Save the LCRV for later (otherwise it will be altered)
  LCRV=$?

  # Write to the history file the previous command
  history -a
}

# Assign the function for the command prompt
PROMPT_COMMAND=prompt_command

# Set the PS according to the saved LCRV
PSLCRV='$( [ $LCRV -eq 0 ] && echo -e "${WHITE}" || echo -e "${LIGHT_RED}" )'

# Prompt Statement 1 (Interactive Default)
PS1="\n\[${PSLCRV}\]\t \[${LIGHT_GREEN}\]\u@\h\[${NCOLOR}\]:\[${LIGHT_BLUE}\]\w\[${NCOLOR}\] \[${BLUE}\]\$(__git_ps1 '[%s] ')\[${NCOLOR}\]> "

# Prompt Statement 2 (Interactive Continuation)
PS2='continue-> '

# Prompt Statement 3 (Select Loop)
PS3='#? '

# Prompt Statement 4 (Debug Mode)
PS4='+ $0:$LINENO - '

# Trim the CWD
export PROMPT_DIRTRIM=5

# Git Prompt
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="verbose"
export GIT_PS1_DESCRIBE_STYLE="branch"
