syntax on
set nocompatible
set number
set relativenumber
set ruler
set visualbell
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set nowrap
set noshiftround
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
set hidden
set ttyfast
set laststatus=2
set showmode
set showcmd
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
set autoindent
set mouse=a

vnoremap <C-C> :w !xclip -i -sel c<CR><CR>

nnoremap <F9> :!clear && /usr/bin/time -p %:p<Enter>
autocmd FileType c nnoremap <F9> :w<CR>:!clear && gcc -g -ggdb3 -Wall % -o %< && /usr/bin/time -p ./%<<CR>
autocmd FileType c nnoremap <F10> :w<CR>:!clear && make && ./%<<CR>
