# If not running interactively, skip most setup.
[ -z "$PS1" ] && return

# K's setup.
if [ -f ~/.myconfig/shared ]; then
  . ~/.myconfig/shared
fi
if [ -f ~/.myconfig/lap ]; then
  . ~/.myconfig/lap
fi
