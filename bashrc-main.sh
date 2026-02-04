# Exit immediately if not an interactive shell.
[[ $- != *i* ]] && return

# Run environment-specific setup.
for f in ~/.myconfig/bashrc-shared.sh ~/.myconfig/bashrc-laptop.sh ~/.myconfig/bashrc-cloud.sh
do
  if [ -f $f ]; then
    . $f
  fi
done
