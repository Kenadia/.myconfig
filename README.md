# .myconfig

## Installation

```
cd ~
git clone git@github.com:Kenadia/.myconfig.git
echo "export MYCONFIG_ENV=cloud" >> .bashrc  # E.g. one of 'cloud', 'google', 'laptop'.
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
