#
# Function: _alinks_complete()
#
# Completion for the alinks() function
#
# See 'debian.plugins.bash'
#
_alinks_complete () {
  local cur prev words cword
  _init_completion || return

  case $prev in
    install )
      COMPREPLY=( $(apt-cache --no-generate pkgnames "$cur" 2> /dev/null) )
      return 0
      ;;
  esac

  if [[ "$cur" == -* ]]; then
    COMPREPLY=( $( compgen -W '$( _parse_help "$1" )' -- "$cur" ) )
    return 0
  fi

  COMPREPLY=( $(compgen -W 'install upgrade dist-upgrade' -- "$cur") )
} &&
complete -F _alinks_complete alinks

