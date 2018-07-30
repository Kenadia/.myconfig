# Only run in env 'google'.
if [ "$MYCONFIG_ENV" != "google" ]; then
  return
fi
echo "Loading google config."

# Skip if not running interactively.
[ -z "$PS1" ] && return

# config
alias coo='vi ~/.myconfig/bashrc-google.sh'

# desk aliases
alias addremotekey='sudo cryptsetup luksAddKey --key-slot 4 -q -y /dev/sda5'
alias gd="git diff --minimal -w HEAD | cdiff -s -w 100"
alias pa='prodaccess'
alias removeremotekey='sudo cryptsetup luksRemoveKey --key-slot 4 -q /dev/sda5'
alias sai='sudo apt-get install'

# blaze
alias zb='blaze build'
alias zc='blaze coverage'
alias zr='blaze run'

# git5
g5newex() {
  git5 start $1 "experimental/users/kschiller/$2" --import-empty
  cd "google3/experimental/users/kschiller/$2"
}
g5ex() {
  CITC="$(git5 export -d "$1" | grep 'cd /' | cut -d ' ' -f 2)"
  if [ -n "$CITC" ]
  then
    echo "$CITC" > .citc
    echo "Wrote path to CITC review client to .citc"
  fi
}
alias g5dr='git5 drop'
alias g5d='git5 diff'
alias g5l='git5 lint'
alias g5m='git5 mail --no-body -m'
alias g5r='git5 merge'
alias g5rm='git5 merge master'
alias g5s='git5 sync'
alias g5t='git5 submit'
alias cdc='cd `cat .citc`'
