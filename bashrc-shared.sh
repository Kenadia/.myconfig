echo "Loading shared config."

# Skip if not running interactively.
[ -z "$PS1" ] && return

# path
export PATH=$HOME/homebrew/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=node_modules/.bin:$PATH
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# prompt
source ~/.myconfig/git-prompt.sh
HOSTNAME=`hostname`
HOSTNAME="${HOSTNAME%%\.*}"
export PS1="\[\e[32m\]$HOSTNAME \[\e[33m\]${debian_chroot:+($debian_chroot)}\W\[\e[31m\]\`__git_ps1\`\[\e[m\] \$ "

# basic aliases
alias b='cd -'
alias c='clear'
alias co='vi ~/.myconfig/bashrc-shared.sh'
alias cr='. ~/.bashrc'
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

# python
alias ipy='ipython'
alias pfr='pip freeze > requirements.txt'
alias pi='pip install'
alias pig='sudo pip install'
alias pir='pip install -r requirements.txt'
alias py3='python3 -B'
alias py='python -B'
alias va3='source venv3/bin/activate'
alias va='source venv/bin/activate'
alias vd='deactivate'
alias vm3='virtualenv venv3 -p python3'
alias vm='virtualenv venv'

# node
alias mni='meteor npm install --save'
alias mnu='meteor npm uninstall --save'
alias nb='npm run build'
alias ni='npm install'
alias nig='sudo npm install --g'
alias nis='npm install --save'
alias nisd='npm install --save-dev'
alias nr='npm run'
alias ns='npm run start'
alias nt='npm run test'

# tmux
alias tx='tmux'
alias txa='tmux new -s main -A'
alias txk='tmux kill-server'
alias txl='tmux ls'
alias txn='tmux new'
alias txr='tmux kill-server; tmux new -s main'

# git aliases
alias g='git'
  # add
alias ga='git add'
  # branch
alias gb='git branch'
alias gbd='git branch -D'
  # commit
alias gc="git commit -v"
alias gca="git commit -v -a"
alias gcm="git commit -v -m"
alias gcam="git commit -v -a -m"
alias gcamw="git commit -v -a -m \"wip\""
alias gcan="git commit -v --amend --no-edit"
alias gcaa="git commit -v -a --amend"
alias gcaan="git commit -v -a --amend --no-edit"
  # checkout
alias gco='git checkout'
alias gcob="git checkout -b"
alias gcom="git checkout master"
  # cherrypick
alias gcp="git cherry-pick"
alias gcpa="git cherry-pick --abort"
alias gcpc="git cherry-pick --continue"
  # diff
alias gd='git diff --color=always | less -R'
  # fetch
alias gfa='git fetch --all'
alias gfm='git fetch origin master'
  # stash
alias gh="git stash"
alias ghd="git stash drop"
alias ghp="git stash pop"
  # pull
alias gl='git pull'
alias glr='git pull --rebase'
  # log
alias gla='git log --pretty=oneline HEAD^..HEAD | cut -c 1-7'
alias glo="git log --oneline --format=\"%h %<(50,trunc)%s\" | less"
  # merge
alias gma='git merge --abort'
  # clone
alias gn='git clone'
  # push
alias gp='git push'
alias gpf='git push -f'
  # rebase
alias gra='git rebase --abort'
alias grc="git rebase --continue"
alias gri="git rebase -i"
alias grim="git rebase -i master"
alias grom='git rebase origin/master'
alias grm="git rebase master"
alias grom='git rebase origin/master'
alias gru="git fetch upstream; git rebase upstream/master"
  # status
alias gs='git status'
  # show
alias gsps="git show --pretty=short --show-signature"
  # reset
alias gu="git reset HEAD"
alias guh="git reset HEAD --hard"
alias guu="git reset HEAD^"
alias guuh="git reset HEAD^ --hard"
