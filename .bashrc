# Update path.
export PATH=$HOME/homebrew/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$PATH:node_modules/.bin

# If not running interactively, skip most setup.
[ -z "$PS1" ] && return

# K's setup.
if [ -f ~/.myconfig/shared ]; then
  . ~/.myconfig/shared
fi
if [ -f ~/.myconfig/lap ]; then
  . ~/.myconfig/lap
fi
