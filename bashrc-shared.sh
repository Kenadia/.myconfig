echo "Loading shared config."

# Skip if not running interactively.
[ -z "$PS1" ] && return

export PGCONNECT_TIMEOUT=3
export GEM_HOME="$HOME/.gem"

# misc
alias beep='osascript -e beep; osascript -e beep'
alias tscw='tsc --watch'
alias authors='git log --pretty=format:"%an <%ae>" | sort | uniq'

# path
export PATH=$HOME/homebrew/bin:$PATH
export PATH=/opt/homebrew/opt/python@3.10/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=/usr/local/opt/python/libexec/bin:$PATH
export PATH=node_modules/.bin:$PATH
export PATH=/usr/local/opt/ruby/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/.gem/bin"

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

#
# prompt
#
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
#
# end prompt
#

# basic aliases
alias b='cd -'
alias c='clear'
alias co='vi ~/.myconfig/bashrc-shared.sh'
alias cr='. ~/.bash_profile'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias lll='ls -alF | less'
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

# go
alias gde='godotenv'

# python
alias ipy='ipython'
alias pfr='pip freeze > requirements.txt'
alias pi='pip install'
alias pig='sudo pip install'
alias pir='pip install -r requirements.txt'
alias py='python -B'
alias va='source .venv/bin/activate'
alias vd='deactivate'
alias vm='python -m venv .venv'

# node
alias n='npm'
alias n.='node .'
alias nb='npm run build'
alias ni='npm install'
alias nie='npm install --save-exact'
alias nig='npm install -g'
alias nis='npm install --save'
alias nisd='npm install --save-dev'
alias nl='npm run lint'
alias nr='npm run'
alias nrc='npm run compile'
alias ncw='npm run compile:watch'
alias nd='npm run dev'
alias nn='NODE_ENV=development node'
alias nnn='NODE_ENV=development node -r dotenv-flow/config'
alias ns='npm start'
alias nsw='npm run start:watch'
alias nt='npm test'
alias nu='npm uninstall'
alias nv='npm run coverage'
alias ntw='npm run test:watch'
alias nll='npm ls --depth=0 --link=true'

# yarn
alias y='yarn'
alias yd='yarn dev'

# tmux
alias tx='tmux'
alias txa='tmux new -s main -A'
alias txk='tmux kill-server'
alias txl='tmux ls'
alias txn='tmux new'
alias txr='tmux kill-server; tmux new -s main'

# forge
alias fb='forge build'
alias ft='forge test'

# hardhat
alias hh='hardhat'
alias hhc='hardhat compile'
alias hhn='hardhat console'
alias hhr='hardhat run'
alias hht='hardhat test'
alias hhb='hardhat --network mumbai'
alias hhbn='hardhat --network mumbai console'
alias hhm='hardhat --network mainnet'
alias hhmn='hardhat --network mainnet console'
alias hhp='hardhat --network polygon'
alias hhpn='hardhat --network polygon console'

# truffle
alias tt='truffle'
alias trc='truffle compile'
alias trd='truffle develop'
alias trm='truffle migrate'
alias trmr='truffle migrate --reset'
alias trn='truffle console'
alias trnm='RPC_NODE_URI=$ETHEREUM_HTTP_NODE_MAINNET truffle console --network mainnet'
alias trnn='truffle console --network $NETWORK'
alias trt='truffle test'

# truffle testing
alias trct='trc --all --network test'
alias trmrt='trmr --network test'
alias trnt='trn --network test'
alias trclean='rm -rf build/; truffle compile --all --network test; truffle migrate --reset --network test'
alias trcleantest='rm -rf build/; truffle compile --all --network=test; truffle migrate --reset --network=test; truffle test'
alias nyctrt='nyc --exclude=[] --reporter=lcov truffle test'
alias nyct='nyc --exclude=[] --reporter=lcov'

# docker
alias dcu='docker-compose up'
alias dls='docker container ls'
function drm() {
  docker stop $1 && docker rm $1
}

# git aliases
alias g='git'
  # add
alias ga='git add'
  # branch
alias gb='git branch'
alias gbb='git branch --sort=committerdate'
alias gbd='git branch -D'
alias gbl='git for-each-ref --sort=authordate --format "%(authordate:iso) %(align:left,25)%(refname:short)%(end) %(subject)" refs/heads'
# gbl2 function below
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
alias gcom='git checkout main'
  # cherry
alias gch='git cherry'
alias gchm='git cherry main'
  # cherrypick
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
  # diff
alias gd='git diff'
alias gdc='git diff --cached'
alias gdm='git diff main'
  # fetch
alias gfa='git fetch --all'
alias gfm='git fetch origin main'
  # stash
alias gst='git stash'
alias gstd='git stash drop'
alias gstp='git stash pop'
alias gstw='git stash show -p stash@{0}'
  # pull
alias gl='git pull'
alias glr='git pull --rebase'
  # log
alias gla='git log --pretty=oneline HEAD^..HEAD | cut -c 1-7'
alias glo='git log --oneline --format="%h %<(50,trunc)%s" | less -R'
  # merge
alias gma='git merge --abort'
alias gmc='git merge --continue'
alias gmm='git merge main'
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
alias gri2='git rebase -i HEAD~2'
alias gri3='git rebase -i HEAD~3'
alias gri4='git rebase -i HEAD~4'
alias gri5='git rebase -i HEAD~5'
alias grim='git rebase -i main'
alias grom='git rebase origin/main'
alias grm='git rebase main'
alias grom='git rebase origin/main'
alias gru='git fetch upstream; git rebase upstream/main'
  # status
alias gs='git status'
  # show
alias gw='git show'
alias gsps='git show --pretty=short --show-signature'
  # reset
alias gu='git reset HEAD'
alias guh='git reset HEAD --hard'
alias guu='git reset HEAD^'
alias guuh='git reset HEAD^ --hard'

# gh aliases
alias gcopr='gh pr checkout'
alias gpc='gh pr create'
alias gpm='gh pr merge'

#
# Functions
#

# node-eval-log
function nel {
  COMMAND="console.log($@)"
  nn -e "$COMMAND"
}
function nev {
  COMMAND="$@"
  nn -e "$COMMAND"
}
function nnel {
  COMMAND="console.log($@)"
  nnn -e "$COMMAND"
}
function nnev {
  COMAND="$@"
  nnn -e "$COMMAND"
}
function gbl2 {
  TEMP=$(git for-each-ref --shell --format "git --no-pager log -1 --date=iso --format='%%ad '%(align:left,25)%(refname:short)%(end)' %%h %%s' \$(git merge-base %(refname:short) main);" refs/heads)
  OUT=$(eval "$TEMP" | sort)
  echo "$OUT"
}

# create and push new typescript project
function new_ts () {
  cd ~/code/kenadia
  mkdir $1
  cd $1
  degit Kenadia/ts-template
  git init
  git add .
  git commit -m "Add ts-template"
  git remote add origin "git@github.com:Kenadia/$1.git"
  git push -u origin main
}

# update all npm packages
function ncu {
  npx -p npm-check-updates ncu -u
}
