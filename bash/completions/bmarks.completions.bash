#
# Function: _bmarks_complete()
#
# Completion for the BMarks functions
#
# See 'bmarks.plugins.bash'
#
_bmarks_complete () {
  local cur prev words cword bmarks
  _init_completion || return

  bmarks=$(grep -o '^[^# ].*=' $BMARKS_FILE | cut -d' ' -f1)
  COMPREPLY=( $(compgen -W "$bmarks" -- "$cur") )
} &&
complete -F _bmarks_complete bm bmv

