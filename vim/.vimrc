" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2011 Apr 15
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

set nocp

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END


  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

syntax enable
syntax on
colorscheme desert

"Set mapleader
let mapleader= ","

"Fast reloading of .vimrc
map <silent><leader>ss :source ~/.vimrc<cr>

"Fast editing of .vimrc
map <silent><leader>ee :e ~/.vimrc<cr>

"When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

set gcr=a:block-blinkon0
set nu
set ru
set hls
set is
set backspace=indent,eol,start
set whichwrap=b,s,<,>,[,]
set encoding=utf-8
set ambiwidth=double
filetype plugin indent on

set sw=4
set ts=4
set smarttab
set smartindent

set tw=78
set lbr
set fo+=mB

set sm
set cin
set cino=:0g0t0(sus
set ai
set wrap

set wildignore=*.o,*~,*.pyc
set ignorecase
set hlsearch
set incsearch
set magic
set showmatch
set noerrorbells
set novisualbell
set mouse=a
set autowrite

"------------------ Winmanager -------------------"
let g:winManagerWindowLayout='FileExplorer,TagList'
nmap wm :WMToggle<cr>
"-------------------------------------------------"
"
"
"------------------ Taglist ----------------------"
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
"-------------------------------------------------"
"
"
"--------------- SuperCompletion -----------------"
nnoremap <silent> <F12> :A<CR>
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"
"-------------------------------------------------"
"
"
"----------------- MiniBuf -----------------------"
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplMapCTabSwitchBufs = 1

"let g:miniBufExplorerMoreThanOne = 1       "
"let g:miniBufExplSplitBelow=1                    "Labels below
"let g:miniBufExplVSplit = 20                     "vertical Split
"let g:miniBufExplUseSingleClick = 1              "Use SingleClick to Switch Labels
"-------------------------------------------------"
"
"
"--------------------- Fold ----------------------"
"set foldclose=all
"-------------------------------------------------"
"
"
"--------------------- Maps ----------------------"
map <F2> <ESC>:w<ESC>
map <F3> <ESC>:close<ESC>
map <F12> <ESC>:q!<ESC>
map hh <ESC>:
"-------------------------------------------------"
"
"--------------- User Command --------------------"
command! -nargs=1 NF tabedit <args>                "open a new tab
command! G close
command! -nargs=* SP split <args>
command! -nargs=* VS vsplit <args>
"-------------------------------------------------"


nnoremap <silent> <F9> :Grep<CR>

"启动vim时如果存在tags则自动加载
if exists("tags")
    set tags=./tags
endif

"设置默认shell
set shell=bash

"设置当文件被外部改变的时侯自动读入文件
if exists("&autoread")
    set autoread
endif

"设置文件类型
set ffs=unix,dos,mac

"设置静音模式
set noerrorbells
set novisualbell
set t_vb=

"不要备份文件
set nobackup
set nowb






