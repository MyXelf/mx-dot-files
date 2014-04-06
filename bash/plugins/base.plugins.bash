#
# Function: path_leader()
#
# Navigate directories around the 'Current Working Directory' (CWD)
#
path_leader () {
  local work_path=$PWD
  local max_level=5     # TODO: Determine the 'max_level' value from inspection of the user defined aliases
  local now_level=0
  local alias_sfx=''

  echo -e "\n${WHITE}CWD = ${work_path}${R_COLOR}"

  while [[ ${#work_path} > 1 ]] && (( now_level++ < max_level )); do
    work_path=${work_path%/*}

    [ -z "$work_path" ]  && work_path='/'
    [ $now_level -gt 1 ] && alias_sfx=$now_level

    printf "${I_GREEN}..%-3s${R_COLOR} %s\n" "$alias_sfx" "$work_path"
  done

  echo # Display the HOME directory and the previous Working Directory

  printf "${I_RED}%-6s${R_COLOR}" '~'
  [ "$HOME" != "$PWD" ] && echo "$HOME" || echo 'You are already at your HOME directory'

  printf "${I_RED}%-6s${R_COLOR}" '-'
  [ -n "$OLDPWD" ] && echo "$OLDPWD" || echo 'There is no previuos Working Directory'
}

