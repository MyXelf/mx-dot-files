# Directories Listings
alias ls='ls --color=auto'
alias ll='ls --all --human-readable --classify -l'
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
alias ..?='path_leader'
alias -- -='cd -'

mkcd () { mkdir -p "$@" && cd "$@"; }

# Verbose File Operations
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'

