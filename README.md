# .myconfig

## Installation

```
MYCONFIG_ENV=cloud  # E.g. one of 'cloud', 'laptop', ...
cd ~
git clone https://github.com/Kenadia/.myconfig.git
echo "export MYCONFIG_ENV=$MYCONFIG_ENV" >> .bashrc
echo ". ~/.myconfig/bashrc-main.sh" >> .bashrc
echo "source ~/.myconfig/vimrc.vim" >> .vimrc
echo "source-file ~/.myconfig/tmux.conf" >> .tmux.conf
. .bashrc
```

## Vim plugin installation

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Open `vi` and run `:PluginInstall`.

## tmux machine colors

The hostname badge and active window share a color derived
from the tmux server's hostname. Sync both `tmux.conf` and `tmux-host-color.sh`
to each machine, then reload with your tmux prefix followed by `r` (or `tmux source-file ~/.tmux.conf`).
SSH inside a pane does not change the badge; it identifies the tmux server.

For a specific color, put this in `~/.tmux.local.conf` on that machine:

```tmux
set -g @host-color colour75
```

Keep that local file out of config sync. Suggested colors: blue `colour75`,
orange `colour215`, green `colour114`, purple `colour141`. Automatic colors
can repeat across hostnames; use local overrides to distinguish any collisions.
