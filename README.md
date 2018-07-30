# .myconfig

## Installation

```
cd ~
git clone git@github.com:Kenadia/.myconfig.git
ln .myconfig/.vimrc .vimrc  # Will fail if .vimrc already exists.
cat "export MYCONFIG_ENV=cloud" >> .bashrc  # E.g. one of 'cloud', 'google', 'laptop'.
cat ". ~/.myconfig/bashrc-main.sh" >> .bashrc
cat "source-file ~/.myconfig/.tmux-theme.conf" >> .tmux-conf
. .bashrc
```

## Vim plugin installation

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Open `vi` and run `:PluginInstall`.
