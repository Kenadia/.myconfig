# Run shared setup.
if [ -f ~/.myconfig/bashrc-shared.sh ]; then
  . ~/.myconfig/bashrc-shared.sh
fi

# Run environment-specific setup.
for f in ~/.myconfig/bashrc-*.sh
do
  if [[ "$f" == *bashrc-main* ]] || [[ "$f" == *bashrc-shared* ]]; then
    continue
  fi
  if [ -f $f ]; then
    . $f
  fi
done
