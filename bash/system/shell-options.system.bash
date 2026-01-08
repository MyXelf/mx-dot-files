# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# shell-options.system.bash (MXDF::BASH)
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Auto CD
shopt -s autocd

# Use variables as possible directory names
shopt -s cdable_vars

# Correct minor errors in 'cd' command
shopt -s cdspell

# Use ** pattern in pathname expansion
shopt -s globstar

# Append to the history file, don't overwrite it
shopt -s histappend

# Save multi-line commands in single history entry
shopt -s cmdhist

# Allow to reedit a failed history substitution
shopt -s histreedit

# Check window size after each command (updates LINES and COLUMNS)
shopt -s checkwinsize

