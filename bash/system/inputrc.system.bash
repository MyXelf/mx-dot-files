#!/bin/bash

# --------------------------------------------------------------------------------------------------
#  Readline Variables
# --------------------------------------------------------------------------------------------------

# Ve Improved
bind 'set editing-mode vi'
bind 'set keymap vi-insert'

# Melange
bind 'set show-all-if-ambiguous on'
bind 'set completion-ignore-case on'
bind 'set mark-symlinked-directories on'
bind 'set skip-completed-text on'
bind 'set print-completions-horizontally on'
bind 'set completion-query-items 200'

# --------------------------------------------------------------------------------------------------
#  Readline Commands
# --------------------------------------------------------------------------------------------------

# Up and Down - Non-incremental search
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Ctrl+L - Clears the screen in 'Insert' mode
bind '"\C-l": clear-screen'

# Ctrl+Space - Expand History on current line
bind '"\C- ": history-expand-line'

# Alt+. - Yank last arg
bind '"\e.": yank-last-arg'

