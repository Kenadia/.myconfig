# Only run in env 'laptop'.
if [ "$MYCONFIG_ENV" != "laptop" ]; then
  return
fi
echo "Loading laptop config."

# Skip if not running interactively.
[ -z "$PS1" ] && return

# config
alias coo='vi ~/.myconfig/bashrc-laptop.sh'

# desk
alias desk='ssh -t desk "tmux new -s main -A"'
alias auth='ssh -O exit desk; auth-refresh'
alias remo='sudo systemsetup -setremotelogin on'
alias authall='cd; auth; remount'
alias aa='authall'
alias a='authall'

# laputa
alias laputa='sudo sshfs -o allow_other,defer_permissions,volname=laputa,IdentityFile=/users/kschiller/.ssh/id_rsa files@schiller.io:/home/files /laputa; cd /laputa'
alias ulaputa='sudo umount -f /laputa'
