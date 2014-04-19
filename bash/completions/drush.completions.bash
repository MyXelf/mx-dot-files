# d => drush
if [ -r /usr/share/bash-completion/completions/drush ]; then
  source /usr/share/bash-completion/completions/drush
  # There is no need to complete the 'd' alias, because it is already included
  # in the default 'drush.complete.sh' script.
fi
