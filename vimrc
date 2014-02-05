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
  set guioptions-=L
  set guiheadroom=0
  set guifont=Termsynu\ 11
else
  set background=dark
endif

" Color
let g:kolor_italic=0 " Enable italic. Default: 1
let g:kolor_bold=1 " Enable bold. Default: 1
let g:kolor_underlined=0 " Enable underline for 'Underlined'. Default: 0
let g:kolor_alternative_matchparen=0 " Gray 'MatchParen' color. Default: 0
colorscheme kolor

" backups             
set backup
" unclutter
set backupdir=~/.vim/backup,/tmp
set noswapfile

" Visual and Text things
set laststatus=2
set backspace=indent,eol,start
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
autocmd FileType c,h,cpp,hpp,glsl,php,objc,m set ts=4 sw=4 sts=4 expandtab

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

" Enter to insert newline wihtout entering insert mode
map <C-Enter> O<Esc>
map <CR> o<Esc>

command! W :execute ':silent w !sudo % > /dev/null' | :edit!
command! Wq :execute ':W' | :q
command! WQ :Wq
map ZS :Wq<Return>
map <C-s> :w
