" todos:
" insert line in insert mode without leaving insert mode
" delete line ofwithout losing buffer
" map sth to :noh
" quit from insert mode
"

set nocompatible

" vundle
filetype off
set rtp+=~/.fzf
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Plugin 'groenewege/vim-less'
" Plugin 'kchmck/vim-coffee-script'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'godlygeek/tabular'

call vundle#end()

syntax enable
filetype plugin indent on

set autoindent
set smartindent
set expandtab
set shiftwidth=2
set softtabstop=2
set backspace=indent,eol,start
set incsearch
set hlsearch
set scrolloff=1
set number

" highlight column 81
set colorcolumn=81
highlight ColorColumn ctermbg=3

" highlight extra whitespace and tabs
highlight ExtraWhitespace ctermbg=3
match ExtraWhiteSpace /\s\+$\|\t\+/
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=3

" use tab to navigate splits
nnoremap <tab> <C-w>w
nnoremap <S-tab> <C-w>W

" change appearance of line number gutter
:highlight LineNr ctermfg=DarkGrey

" move multiple lines
nnoremap <C-j> 10j
nnoremap <C-k> 10k
nnoremap <C-h> 10h
nnoremap <C-l> 10l
vnoremap <C-j> 10j
vnoremap <C-k> 10k
vnoremap <C-h> 10h
vnoremap <C-l> 10l

" make Y work like D
nnoremap Y y$

" easier move, insert, and delete lines
execute "set <M-j>=\ej"
execute "set <M-k>=\ek"
nnoremap <M-j> :m .+1<cr>
nnoremap <M-k> :m .-2<cr>
inoremap <M-j> <C-o>:m .+1<cr>
inoremap <M-k> <C-o>:m .-2<cr>
" nnoremap <C-[> O<Esc>j
" nnoremap <C-]> o<Esc>k
" inoremap <C-[> <Esc>O
" inoremap <C-]> <Esc>o
nnoremap <C-d> dd

" use enter to jump to a line
nnoremap <cr> G

" FZF
nnoremap <silent> <leader><C-p> :call fzf#run({
\   'down': '40%',
\   'sink': 'vertical split' })<cr>
nnoremap <silent> <C-p> :FZF<cr>

" copy path to current file
nnoremap <leader>f :!echo -n % \| pbcopy<cr>

" remap redo, use C-r for delete word and insert
nnoremap U <C-r>
nnoremap <C-r> diwi

" easier cursor control in edit mode
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$

" align equal signs
" noremap <space>= :Tabularize /^[^=]*\zs=<cr>
