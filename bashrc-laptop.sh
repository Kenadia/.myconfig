# Only run in env 'laptop'.
if [ "$MYCONFIG_ENV" != "laptop" ]; then
  return
fi
echo "Loading laptop config."

# Skip if not running interactively.
[ -z "$PS1" ] && return

# profiles
function xswitch() {
  CONFIG=~/.gitconfigs/.gitconfig-$1
  KEY=~/.ssh/$1
  cp "$CONFIG" ~/.gitconfig
  ssh-add -D
  ssh-add $KEY
  echo $1 > ~/.xwho
  xwho
}
function xwho() {
  WHO=$(cat ~/.xwho)
  echo "[$WHO]"
  git config --global -l
  ssh-add -L
}

# config
alias coo='vi ~/.myconfig/bashrc-laptop.sh'

# local directories
alias cdc='cd ~/code'

# erlang
export KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac"
export ERL_AFLAGS="-kernel shell_history enabled"

