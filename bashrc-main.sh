# Run environment-specific setup.
for f in ~/.myconfig/bashrc-shared.sh ~/.myconfig/bashrc-laptop.sh ~/.myconfig/bashrc-google.sh
do
  if [ -f $f ]; then
    . $f
  fi
done
