# .myconfig

## Installation

```
cd ~
git clone git@github.com:Kenadia/.myconfig.git
ln .myconfig/.vimrc .vimrc  # Will fail if .vimrc already exists.
echo "export MYCONFIG_ENV=cloud" >> .bashrc  # E.g. one of 'cloud', 'google', 'laptop'.
echo ". ~/.myconfig/bashrc-main.sh" >> .bashrc
echo "source-file ~/.myconfig/tmux.conf" >> .tmux.conf
. .bashrc
```

## Vim plugin installation

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Open `vi` and run `:PluginInstall`.
