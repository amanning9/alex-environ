" Definitions
" ---------------------------------------
let g:my_vim_dir = expand('~/.vim')
let g:my_vimrc = expand('~/.vimrc')

if !exists("g:my_environ_dir")
    let g:my_environ_dir = expand('~/.alex-environ')
endif

" Remove ALL autocommands to prevent them from being loaded twice.
if has('autocmd')
    autocmd!
endif

" Syntax Highlighting
if has('syntax')
    syntax enable
    set background=dark
endif

" OPTIONS
" ---------------------------------------
set nocompatible                 " The most important VIM option

scriptencoding utf-8		         " Convert all scripts into UTF8 format

" Typing options:
set smarttab
set tabstop=4                    " Set the default tabstops
set shiftwidth=4                 " Set the default autoindent
set softtabstop=4
set expandtab
set hidden
set omnifunc=syntaxcomplete#Complete    "Autocompletion

set autoindent                   " Sensible indenting
set shiftround                   " Round indents to a multiple of 'shiftwidth'
set complete-=i                  " Don't scan includes, since it can be very slow.
set backspace=indent,eol,start   " Set for maximum backspace smartness

" Searching options:
set ignorecase                   " Ignore case in searches ... (\c\C override)
set smartcase                    " ... unless there are caps in the search
set incsearch                    " Perform incremental search as you type search
set hlsearch                     " Highlight all search matches

" Highlighting options:
set showmatch                    " Show the matching bracket
set matchpairs=(:),{:},[:]       " List of characters we expect in balanced pairs
set cursorline                   " Highlights the current line

" Mouse options:
set mouse=a                      " Enable the mouse for all modes

" General options:
set history=1000                 " Save more history.
set visualbell                   " Don't ding all the time

" Setup line numbers. Relative numbers in normal mode, otherwise normal
" numbers.
set number relativenumber
if has('autocmd')
    augroup numbertoggle
        autocmd!
        autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
        autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
    augroup END
endif

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" BACKUPS, UNDO and SWAP FILES
" ---------------------------------------
" Save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or . if all else fails.
if isdirectory(g:my_vim_dir . '/backup') == 0
    execute 'silent !mkdir -p ' . g:my_vim_dir . '/backup >/dev/null 2>&1'
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
execute 'set backupdir^=' . g:my_vim_dir . '/backup/'
set backupdir^=./.vim-backup/
set backup
" Prevent backups from overwriting each other. The naming is weird,
" since I'm using the 'backupext' variable to append the path.
" So the file '/home/docwhat/.vimrc' becomes '.vimrc%home%docwhat~'
if has('autocmd')
    autocmd BufWritePre * nested let &backupext = substitute(expand('%:p:h'), '/', '%', 'g') . '~'
endif

if has('macunix')
    set backupskip+=/private/tmp/*
endif

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory(g:my_vim_dir . '/swap') == 0
    execute 'silent !mkdir -p ' . g:my_vim_dir . '/swap >/dev/null 2>&1'
endif
set directory=./.vim-swap//
execute 'set directory+=' . g:my_vim_dir . '/swap//'
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
execute 'set viminfo+=n' . g:my_vim_dir . '/viminfo'
set viminfo^=!,h,f0,:100,/100,@100

if exists('+undofile')
    " undofile - This allows you to use undos after exiting and restarting
    " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
    " :help undo-persistence
    " This is only present in 7.3+
    if isdirectory(g:my_vim_dir . '/undo') == 0
        execute 'silent !mkdir -p ' . g:my_vim_dir . '/undo >/dev/null 2>&1'
    endif
    set undodir=./.vim-undo/
    execute 'set undodir+=' . g:my_vim_dir . '/undo/'
    set undofile
    set undolevels=1000         " maximum number of changes that can be undone
    set undoreload=10000        " maximum number lines to save for undo on a buffer reload
endif

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
if has('autocmd')
    autocmd BufReadPost * nested
                \ if line("'\"") > 1 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif
endif

" APPEARANCE
" ---------------------------------------
if has('gui_running')
    set guifont=Monospace\ 14
endif

" Fallback colors
colorscheme peachpuff

" KEYBOARD BINDINGS
" ---------------------------------------
map <Leader>[ <ESC>:NERDTreeToggle<RETURN>
map <Leader>] <ESC>:CtrlP<RETURN>

""" FIXES FOR GLITCHES ETC.
" ---------------------------------------
""" Fix copy and paste
if exists('##TextYankPost')
    augroup OSCYank
        autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | execute 'OSCYankReg "' | endif
    augroup END
endif

""" Fix the terminal background on WSL
if (&term =~ '^xterm' && &t_Co == 256)
    set t_ut= | set ttyscroll=1
endif

""" MORE tabs.
set tabpagemax=100

""" COMMANDS
" ---------------------------------------
" For when you forget to sudo... Really Write the file.
cnoremap w!! w !sudo tee % >/dev/null
