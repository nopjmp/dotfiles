" nopjmp vimrc
set nocompatible " be iMproved

" Vundle stuff
if filereadable(glob("~/.vimrc.plugins"))
  source ~/.vimrc.plugins
endif

" GUI
if has("gui_running")
  set guioptions-=m
  set guioptions-=T
  set guioptions-=r
  set guiheadroom=0
  set guifont=Termsynu\ 11
else
  set background=dark
  set t_Co=256
  let g:rehash256 = 1
endif

" Color
colorscheme molokai

" backups             
set backup
" unclutter
set backupdir=~/.vim/backup,/tmp
set noswapfile

" Visual and Text things
set laststatus=2
set encoding=utf-8
set number
set showcmd
set showmode
set smartindent
set ttimeoutlen=50
set listchars=tab:»\ ,eol:¬
set list
" Use 2 spaces by default 4 when its convetion
autocmd FileType * set ts=2 sw=2 sts=2 expandtab
autocmd FileType c,h,cpp,hpp,glsl,python,php,objc,m set ts=4 sw=4 sts=4 expandtab

set ttyfast
set smartcase
set hlsearch
set incsearch
set magic
set showmatch
" how many tenths of a second to blink when matching brackets
set mat=2
set mouse=a
set ffs=unix,dos,mac

" Status bar text
let g:airline_theme="powerlineish"
" Powerline / Airline symbols
let g:airline_left_sep=''
let g:airline_right_sep=''
"================== Keybinds ====================
" Treat long lines as break lines
map j gj
map k gk
" Move Faster
map <C-j> <C-d>
map <C-k> <C-u>

" Smart way to move between windows
map <C-h> :tabprev<cr>
map <C-l> :tabnext<cr>

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <C-space> ?

" Map Ctrl + <UP/DOWN> to move lines
no <C-down> ddp
no <C-up> ddkP

" Auto center
nmap G Gzz
nmap n nzz
nmap N Nzz
nmap { {zz
nmap } }zz


" This should be obvious
syntax on
filetype on
filetype plugin on
filetype plugin indent on

" Custom macro silliness
let mapleader=","
let g:mapleader=","

" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>q :q!<cr>

" Quick pairs
imap <leader>' ''<Esc>i
imap <leader>" ""<Esc>i
imap <leader>( ()<Esc>i
imap <leader>[ []<Esc>i
imap <leader>{ {}<Esc>i

" allow backspacing over autoindent, line beaks, and the start of insert
set backspace=indent,eol,start

" Enter to insert newline wihtout entering insert mode
map <C-Enter> O<Esc>
map <CR> o<Esc>

command! W :execute ':silent w !sudo % > /dev/null' | :edit!
command! Wq :execute ':W' | :q
command! WQ :Wq
map ZS :Wq<Return>
map <C-s> :w

" solid underscore
"let &t_SI .= "\<ESC>[4 q"
"" solid block
"let &t_EI .= "\<ESC>[2 q"
"" Save cursor on open
"silent !echo -ne "\033 7"
"" Change cursor to Solid block
"silent !echo -ne "\033[4 q"
"" Restore cursor on close
"autocmd VimLeave * silent !echo -ne "\033 8"
