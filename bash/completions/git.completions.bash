# g => git
if [ -r /usr/share/bash-completion/completions/git ]; then
  source /usr/share/bash-completion/completions/git
  complete -o bashdefault -o default -o nospace -F _git g
fi

