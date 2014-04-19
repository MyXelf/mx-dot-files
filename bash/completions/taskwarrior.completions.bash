# t => task
if [ -r /etc/bash_completion.d/task ]; then
  source /etc/bash_completion.d/task
  complete -o nospace -F _task t
fi

