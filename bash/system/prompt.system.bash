#!/bin/bash

# PS Fragment :: LCRV (Last Command Resulting Value)
PS_LCRV='$([ $LCRV -eq 0 ] && echo -e "\[${WHITE}\]√ " || echo -e "\[${I_RED}\]× ")'

# PS Fragment :: USER_COLOR (Root or Regular Users)
is_user_root && PS_USER_COLOR=${RED} || PS_USER_COLOR=${I_GREEN}

# Prompt Statement 1 :: Interactive Default
PS1="\n${PS_LCRV}\t \[${PS_USER_COLOR}\]\u@\h\[${WHITE}\]:\[${I_BLUE}\]\w\[${R_COLOR}\] \[${I_MAGENTA}\]\$(__git_ps1 '[%s] ')\[${WHITE}\]»\[${R_COLOR}\] "

# Prompt Statement 2 :: Interactive Continuation
PS2='continue-> '

# Prompt Statement 3 :: Select Loop
PS3='#? '

# Prompt Statement 4 :: Debug Mode
PS4='+ $0:$LINENO - '

# Trim the CWD
export PROMPT_DIRTRIM=5

# Git Prompt
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="verbose"
export GIT_PS1_DESCRIBE_STYLE="branch"

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

