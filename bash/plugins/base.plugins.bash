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

  e_hr "CWD = ${work_path}"

  while [[ ${#work_path} > 1 ]] && (( now_level++ < max_level )); do
    work_path=${work_path%/*}

    [ -z "$work_path" ]  && work_path='/'
    [ $now_level -gt 1 ] && alias_sfx=$now_level

    printf "${I_GREEN}..%-3s${R_COLOR} %s\n" "$alias_sfx" "$work_path"
  done

  echo # Display the HOME directory and the previous Working Directory

  printf "${I_RED}%-6s${R_COLOR}" '~'
  [ "$HOME" != "$PWD" ] && echo "$HOME" || e_cm 'You are already at your HOME directory'

  printf "${I_RED}%-6s${R_COLOR}" '-'
  [ -n "$OLDPWD" ] && echo "$OLDPWD" || e_cm 'There is no previuos Working Directory'
}

#
# Function: uxt()
#
# Display the specified date/time in several formats
#
uxt () {
  [ -n "$1" ] && local uxt_line="$@" || local uxt_line='now'

  # If only numbers assume a Unix time and prepend the "@"
  [ -z "${uxt_line//[0-9]/}" ] && uxt_line='@'$uxt_line

  e_ac "$(date -d "$uxt_line" +'%Z   = %a, %d %b %Y %T %z')"
  e_ac "$(date --utc -d "$uxt_line" +'%Z   = %a, %d %b %Y %T %z')"
  e_ac "$(date -d "$uxt_line" +'Epoch = %s')"
}

