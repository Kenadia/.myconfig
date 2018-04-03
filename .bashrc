# Update path.
export PATH=$HOME/homebrew/bin:$PATH
export PATH=$HOME/bin:$PATH

# If not running interactively, skip most setup.
[ -z "$PS1" ] && return

# K's setup.
if [ -f ~/.myconfig/shared ]; then
  . ~/.myconfig/shared
fi
if [ -f ~/.myconfig/lap ]; then
  . ~/.myconfig/lap
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
