echo "Loading shared config."

# Skip if not running interactively.
[ -z "$PS1" ] && return

# misc
alias beep='osascript -e beep; osascript -e beep'

# path
export PATH=$HOME/homebrew/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=node_modules/.bin:$PATH
export PATH=/usr/local/go/bin:$PATH
export PATH=$HOME/go/bin:$PATH
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
# auto-complete
if [ -f ~/.myconfig/git-completion.bash ]; then
  source ~/.myconfig/git-completion.bash
else
  echo "Please install git-completion.bash script in .myconfig."
fi
__git_complete g __git_main
__git_complete gco _git_checkout
__git_complete gbd _git_branch
__git_complete gr _git_rebase

# prompt
source ~/.myconfig/git-prompt.sh

# Include hostname in prompt if we're on a remote connection.
if [[ -n $SSH_CLIENT ]]; then
  case $HOSTNAME in
    *.schiller.io) host_color='1;33';; # yellow on schiller.io
    *) host_color='1;35';; # magenta elsewhere
  esac
  hostname=`hostname`
  hostname="${hostname%%\.*}"
  PS1='\[\e['$host_color'm\]'$hostname' '
else
  PS1=''
fi

# Add indicator if the last command failed.
status_dot='if [ $? = 0 ]; then printf ""; else printf "\[\e[31m\]* "; fi'

PS1+="\`$status_dot\`\[\e[33m\]${debian_chroot:+($debian_chroot)}\W\[\e[31m\]\`__git_ps1\` \[\e[m\]$ "

# basic aliases
alias b='cd -'
alias c='clear'
alias co='vi ~/.myconfig/bashrc-shared.sh'
alias cr='. ~/.bash_profile'
alias e='echo'
alias k='kubectl'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias o.='open .'
alias o='open'
alias s.='subl .'
alias s='subl'
alias up='cd ..'
alias uup='cd ../..'
alias uuup='cd ../../..'
alias uuuup='cd ../../../..'
alias wh='type'
alias ww='echo "`whoami`@`hostname`"'

shr () {
  ssh root@$1
}

# python
alias ipy='ipython'
alias pfr='pip freeze > requirements.txt'
alias pi='pip install'
alias pig='sudo pip install'
alias pir='pip install -r requirements.txt'
alias py2='python2 -B'
alias py3='python3 -B'
alias py='python -B'
alias va2='source venv/bin/activate'
alias va3='source venv3/bin/activate'
alias va='va2 2>/dev/null || va3'
alias vd='deactivate'
alias vm3='virtualenv venv -p python3'
alias vm2='virtualenv venv'
alias vm='vm3'

# node
alias mni='meteor npm install --save'
alias mnu='meteor npm uninstall --save'
alias nb='npm run build'
alias ni='npm install'
alias nig='npm install -g'
alias nis='npm install --save'
alias nisd='npm install --save-dev'
alias nr='npm run'
alias ns='npm run start'
alias nt='npm run test'
alias nx='PATH=$(npm bin):$PATH'

# yarn
alias y='yarn'
alias ya='yarn add'
alias yae='yarn add --exact'
alias yad='yarn add -D'
alias yade='yarn add -D --exact'
alias yb='yarn build'
alias yc='yarn compile'
alias yd='yarn deploy'
alias ycw='yarn compile:watch'
alias yr='yarn remove'
alias ys='yarn start'

# brew
alias bi='brew install'

# tmux
alias tx='tmux'
alias txa='tmux new -s main -A'
alias txk='tmux kill-server'
alias txl='tmux ls'
alias txn='tmux new'
alias txr='tmux kill-server; tmux new -s main'

# truffle
alias tt='truffle'
alias trc='truffle compile'
alias trm='truffle migrate'
alias trmr='truffle migrate --reset'
alias trn='truffle console'
alias trnn='truffle console --network $NETWORK'
alias trt='truffle test'

# kube
kshell () {
  kubectl exec -it $1 -- /bin/bash
}

# git aliases
alias g='git'
  # add
alias ga='git add'
  # branch
alias gb='git branch'
alias gbd='git branch -D'
  # commit
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gcm='git commit -v -m'
alias gcam='git commit -v -a -m'
alias gcamw='git commit -v -a -m "wip"'
alias gcan='git commit -v --amend --no-edit'
alias gcaa='git commit -v -a --amend'
alias gcaan='git commit -v -a --amend --no-edit'
  # checkout
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
  # cherry
alias gch='git cherry -v'
alias gchm='git cherry -v master'
  # cherrypick
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
  # diff
alias gd='git diff --color=always | less -R'
alias gd2='git diff --minimal -w HEAD | cdiff -s -w 100'
alias gdc='git diff --color=always --cached | less -R'
alias gdm='git diff --color=always master | less -R'
  # fetch
alias gfa='git fetch --all'
alias gfm='git fetch origin master'
  # stash
alias gh='git stash'
alias ghd='git stash drop'
alias ghp='git stash pop'
  # pull
alias gl='git pull'
alias glr='git pull --rebase'
  # log
alias gla='git log --pretty=oneline HEAD^..HEAD | cut -c 1-7'
alias glo='git log --oneline --format="%h %<(50,trunc)%s" | less'
  # merge
alias gma='git merge --abort'
  # clone
alias gn='git clone'
  # push
alias gp='git push'
alias gpf='git push -f'
alias gpu='git push -u origin $(git rev-parse --abbrev-ref HEAD)'
  # rebase
alias gr='git rebase'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias gri='git rebase -i'
alias grim='git rebase -i master'
alias grom='git rebase origin/master'
alias grm='git rebase master'
alias grom='git rebase origin/master'
alias grs='git rebase --skip'
alias gru='git fetch upstream; git rebase upstream/master'
  # status
alias gs='git status'
  # show
alias gsps='git show --pretty=short --show-signature'
  # remote
alias gt='git remote'
alias gtao='git remote add origin'
  # reset (unstage)
alias gu='git reset HEAD'
alias guh='git reset HEAD --hard'
alias guu='git reset HEAD^'
alias guuh='git reset HEAD^ --hard'

alias yarn-linked="find node_modules -type l -maxdepth 3 | grep -v .bin | cut -f2 -d/"

# functions
gcopr () {
  git fetch origin "pull/$1/head:pr$1"
  git checkout "pr$1"
}
gpfmv () {
  echo git push -f origin $(git rev-parse --abbrev-ref HEAD):$1
}
