# --------------------------------------------------------------------------------------------------
#  General Environment
# --------------------------------------------------------------------------------------------------

# Make Vim the default editor
export EDITOR='vim'

# Pager
export PAGER='pager'

# Man Pager
export MANPAGER='pager -+F --hilite-search --ignore-case --jump-target=.5 -+X --LONG-PROMPT --squeeze-blank-lines'

# --------------------------------------------------------------------------------------------------
#  Environment for Tools
# --------------------------------------------------------------------------------------------------

# Ack
export ACKRC=$MXDF_BASH_RC/ackrc-types
export ACK_OPTIONS='--smart-case --sort-files --pager'
export ACK_COLOR_FILENAME='bold magenta'
export ACK_COLOR_LINENO='bold green'
export ACK_COLOR_MATCH='red'

# Grep
export GREP_COLORS='sl=:cx=:ms=31:mc=31:fn=1;35:ln=1;32:bn=1;32:se=1;30'

# Less
export LESS='--follow-name --hilite-search --ignore-case --jump-target=.5 --no-init --quit-if-one-screen --LONG-PROMPT --RAW-CONTROL-CHARS'
export LESS_TERMCAP_mb=$'\033[1;31m'             # Unknown (?)
export LESS_TERMCAP_md=$'\033[1;31m'             # Sections and Options
export LESS_TERMCAP_me=$'\033[0m'                # Matching after "mb" or "md"
export LESS_TERMCAP_se=$'\033[0m'                # Line endings
export LESS_TERMCAP_so=$'\033[1;44;37m'          # Statusbar & Search Highlight
export LESS_TERMCAP_us=$'\033[1;32m'             # Keywords
export LESS_TERMCAP_ue=$'\033[0m'                # Matching after Keywords

# Lesspipe (Make 'Less' able to handle binary files)
is_command lesspipe && eval "$(lesspipe)"

# LS_COLORS (enable 'ls' command to distinguish file types using colors)
[ -s $MXDF_BASH_RC/dircolors ] && eval "$(dircolors --bourne-shell $MXDF_BASH_RC/dircolors)" || eval "$(dircolors --bourne-shell)"

# Readline Variables and Key Bindings
[ -s $MXDF_BASH_RC/inputrc ] && export INPUTRC=$MXDF_BASH_RC/inputrc

# --------------------------------------------------------------------------------------------------
#  Environment for Plugins :: See 'plugins' component
# --------------------------------------------------------------------------------------------------

# Android Tools Suite RC file [DROID Tools]
export DTOOLS_RC=$MXDF_BASH_LOCAL/droid-tools.rc

# BookMarks Handler [BMarks]
export BMARKS_FILE=$MXDF_BASH_LOCAL/bmarks.bmarks

