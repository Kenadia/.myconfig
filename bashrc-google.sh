# Only run in env 'google'.
if [ "$MYCONFIG_ENV" != "google" ]; then
  return
fi
echo "Loading google config."

# Skip if not running interactively.
[ -z "$PS1" ] && return

CREDS=/google/data/ro/projects/chauffeur/sds-mfg/upload_creds/waymo_creds.json
FRESHBINS=/google/data/ro/projects/chauffeur/freshbins/latest

# config
alias coo='vi ~/.myconfig/bashrc-google.sh'

# overrides
alias py='ipython'
alias gd='gdd'
gdd() {
  g diff $@ --minimal --color=always | less -r
}

# shortcuts
alias copybara='/google/data/ro/teams/copybara/copybara'
alias push_update='/google/data/rw/projects/chauffeur/sds-mfg/tools/push_update.par --alsologtostderr --verbosity=0'
alias sync_dev='/google/data/ro/projects/chauffeur/sds-mfg/tools/sync_dev.par --alsologtostderr --verbosity=0'
alias kd='wsh station1.kdsudac.desk -L \*:12000:localhost:12000'
alias sanity='while true; do blaze run third_party/car/hw/testing/test:sanity_test -- --config-value=station_server_port=4444; sleep 3; done'

# deployment
alias build_action='$FRESHBINS/build_action.par --alsologtostderr --verbosity=0'
alias deploy='echo "deploy" | $FRESHBINS/deploy.par --alsologtostderr --verbosity=0'
alias disable='echo "disable" | $FRESHBINS/deploy.par --alsologtostderr --verbosity=0 -disable'

# scripts
alias se='~/code/scripts/se.sh'
alias delete_run='~/code/scripts/delete_run.sh'

# shortcuts
alias cdwg='cd third_party/car/hw/testing/web_gui'
alias hint='g4 integrate --retroactive'
alias wg1='blaze-bin/third_party/py/openhtf/web_gui'
alias wg2='blaze-bin/third_party/car/hw/testing/web_gui/web_gui'
alias zbwg1='blaze build third_party/py/openhtf:web_gui'
alias zbwg2='blaze build third_party/car/hw/testing/web_gui'
alias zbsop='blaze build third_party/car/hw/testing/stations/assembly_sop'
alias zbgen='blaze build third_party/car/hw/testing/stations/assembly_generic'
alias hw='blaze-bin/third_party/py/openhtf/hello_world'
alias zbhw='blaze build third_party/py/openhtf:hello_world'
alias zrdev='iblaze run third_party/car/hw/testing/web_gui:devserver'
alias zbss='blaze build third_party/car/hw/testing/servers:station_server'
alias zbds='blaze build third_party/car/hw/testing/servers:dashboard_server'
alias bbds='blaze-bin/third_party/car/hw/testing/servers/dashboard_server --dashboard-server-port=40005'
alias zrds='zr third_party/car/hw/testing/servers:dashboard_server -- --dashboard-server-port=40005'
alias izrds='izr third_party/car/hw/testing/servers:dashboard_server'
alias zrhw='zr third_party/car/hw/testing/examples:hello_world -- --local true --config-value=station_server_port=4444 basic_action'
alias zrhw2='zr third_party/car/hw/testing/examples:hello_world_2 -- --local true --action greet --config-value=station_server_port=4444'
alias bbgen='blaze-bin/third_party/car/hw/testing/stations/assembly_generic --no-launch-web-gui --local true --config-file=third_party/car/hw/testing/stations/configs/bfd_assembly.yaml --skip-validation --config-value=upload_creds=/google/data/ro/projects/chauffeur/sds-mfg/upload_creds/waymo_creds.json --config-value=station_server_port=4444 modify'
alias bbsop='blaze-bin/third_party/car/hw/testing/stations/assembly_sop --skip-validation --local true --config-value=upload_creds=/google/data/ro/projects/chauffeur/sds-mfg/upload_creds/waymo_creds.json --run-station-server true --cell "My cell" --config-file /google/src/cloud/kschiller/clean4/google3/third_party/car/hw/testing/stations/configs/bfd10_assembly.yaml --config-value=station_server_port=8888 bfd'

# new shortcuts
alias zrhw_='zr third_party/car/hw/testing/examples:hello_world -- --config-value=upload_creds=/google/data/ro/projects/chauffeur/sds-mfg/upload_creds/waymo_creds.json basic_action'
alias zrhw2_='zr third_party/car/hw/testing/examples:hello_world_2 -- --config-value=upload_creds=/google/data/ro/projects/chauffeur/sds-mfg/upload_creds/waymo_creds.json --action greet'
alias zrgen='zr third_party/car/hw/testing/stations:assembly_generic -- --config-file="$(pwd)/experimental/users/kschiller/mock_assembly.yaml" --skip-validation=true'
alias zrsop='zr third_party/car/hw/testing/stations:assembly_sop -- --config-file="$(pwd)/experimental/users/kschiller/mock_assembly.yaml" --skip-validation=true assembly_root --auto-create=true'

# desk aliases
alias cwd='echo -en `pwd`/ | xclip -selection clipboard'
alias sai='sudo apt-get install'
alias sau='sudo apt-get update'
alias addremotekey='sudo cryptsetup luksAddKey --key-slot 4 -q -y /dev/sda5'
alias removeremotekey='sudo cryptsetup luksRemoveKey --key-slot 4 -q /dev/sda5'
alias cdc='cd ~/code'
alias car='cd ~/code/main/google3'
alias gpy='/google/data/ro/projects/g3python/g3python --g3p_local'
alias lint='gpylint'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias gsutil='/google/data/ro/projects/cloud/bigstore/tools/gsutil.par'
alias ngrok='~/ngrok'
alias pa='prodaccess'

# blaze aliases
alias zb='blaze build'
alias zba='blaze build :all'
alias zc='blaze coverage'
alias zca='blaze coverage :all'
alias zcl='blaze clean'
alias zr='/google/src/head/depot/google3/devtools/blaze/scripts/blaze-run.sh'
alias zto='blaze test --compilation-mode=opt'
alias zta='blaze test :all --test_output=all'
alias zt='blaze test --test_output=all'
alias izb='iblaze build'
alias izr='iblaze run'
alias izt='iblaze test'

# g4/p4 aliases
alias 4c='g4 change'
alias 4cw='g4 change --desc wip'
alias 4d='g4 diff'
alias 4l='g4 lint'
alias 4o='g4 reopen'
alias 4p='g4 pending'
alias 4r='g4 revert'
alias 4s='g4 sync'
alias 4u='g4 upload'
alias 4dup='rebaser fork'
alias 4ou='4o;4u'

# git5 aliases
g5newexp() {
  mkdir $1
  cd $1
  git5 start master "experimental/users/kschiller/$1" --import-empty
  cd "google3/experimental/users/kschiller/$1"
}
g5new() {
  mkdir $1
  cd $1
  git5 start clean $2
  cd "google3/$2"
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
alias g5m='git5 mail --no-body'
alias g5r='git5 merge'
alias g5rm='git5 merge master'
alias g5s='git5 sync'
alias g5t='git5 submit'
alias cdcc='cd `cat .citc`'

# preexec
# Improved X11 forwarding through GNU Screen or tmux.
function update-x11-forwarding
{
    if [ -z "$STY" -a -z "$TMUX" ]; then
        echo $DISPLAY > ~/.display.txt
    else
        export DISPLAY=`cat ~/.display.txt`
    fi
}
# This is run before every command.
preexec() {
    [ -n "$COMP_LINE" ] && return  # do nothing if completing
    # Don't cause a preexec for PROMPT_COMMAND.
    # Beware!  This fails if PROMPT_COMMAND is a string containing more than one command.
    [ "$BASH_COMMAND" = "$PROMPT_COMMAND" ] && return
    update-x11-forwarding
}
trap 'preexec' DEBUG
