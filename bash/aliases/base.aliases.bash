# Directories Listings
alias ls='ls --color=auto'
alias ll='ls --all --human-readable --classify --group-directories-first -l'
alias l1='ls --almost-all -1'
alias l?='ll | ?'
alias lw='l1 | wcl'
alias l='ll'

# Directories Navigation & Handling
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'
alias -- -='cd -'

mkcd () { mkdir -p "$@" && cd "$@"; }

# Grep
alias grep='grep --color=auto --exclude-dir=.bzr --exclude-dir=.cvs --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn'

# Verbose File Operations
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'

# Disk Space
alias df='df --human-readable --print-type --exclude-type=tmpfs --exclude-type=devtmpfs'
alias ducks='du -cksh * .* --exclude=. --exclude=.. 2>/dev/null | sort -rh | head -n21 | hl $RED ".*\ttotal$" $I_GREEN "^[0-9.]\+."'

# Find
f? () { [ ${#1} = 1 ] && local t=$1 && shift; local p=$1; shift; find -type ${t:-f} -iname "*$p*" "$@"; }

# Grep
alias ?='grep --ignore-case --initial-tab'
alias ??='? --line-number --recursive'

# History
alias h?='history | ?'
alias htail='oosm_active && tail -f $OOSM_HFILE || tail -f $HISTFILE'

h () { history ${1:-$((LINES - 4))} | hl $I_GREEN "^\s*[0-9]\+"; }
profiler () { history | awk -v c1=$I_BLUE -v c2=$I_RED -v rc=$R_COLOR '{ comm[$2]++; t++ } END { for (w in comm) { printf "%s %4s %s %s %5.2f%% %s   %s\n", c1, comm[w], rc, c2, comm[w]/t*100, rc, w } }' | sort -nrk2 | head -n${1:-25}; }

# Processes
ps? () { local p="$@"; ps auxww | grep -i --color=never --regexp="^USER.*COMMAND$\|[${p:0:1}]${p:1}"; }

# XDG
alias xo='xdg-open'

