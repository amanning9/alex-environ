" VUNDLE
" ---------------------------------------
filetype off                    " Turn off before processing Vundle (required)
let g:ale_disable_lsp = 1       "ALE plays nice with COC. Must be before plugins.

" PLUGINS
" ---------------------------------------
function! LoadPlugins()
    Plug 'scrooloose/nerdtree'                          " NERDTree for vim file explorer
    Plug 'w0rp/ale'                                     " Syntax checking and Fixing

    if exists('##TextYankPost')
        Plug 'ojroques/vim-oscyank', { 'branch': 'main' }   " Fix the clipboard
    endif

    if executable('node') " Coc only works if nodejs is available.
        Plug 'neoclide/coc.nvim', {'branch': 'release'} "Autocompetion
    endif

    Plug 'puremourning/vimspector'
    Plug 'sagi-z/vimspectorpy', { 'do': { -> vimspectorpy#update() } }

    " THEMES
    Plug 'altercation/vim-colors-solarized'             " Solarized is a pretty colour scheme
    Plug 'morhetz/gruvbox'                              " gruvbox is a good colour scheme on 256 colours

    Plug 'amanning9/django-plus.vim'                    " Improvements for identifying files in django projects.
    Plug 'towolf/vim-helm'
    Plug 'Glench/Vim-Jinja2-Syntax'                     " Jinja syntax detection.
endfunction

" PLUGIN INITIALISATION
" ---------------------------------------
" Only install vundle and bundles if git exists...
if executable('git') && has('autocmd')
    " Install Plug and run for the first time
    if empty(glob('~/.vim/autoload/plug.vim'))
        echomsg 'Running vim for the first time, bootstrapping vim configuration...'
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
endif

" Initialise plugins on every vim load
execute 'set rtp+=' . g:my_vim_dir . '/bundle/vundle/'
silent! call plug#begin('~/.vim/plugged')
call LoadPlugins()
call plug#end()

" THEME CONFIGURATION
" ---------------------------------------
" Use solarized light in GUI, otherwise gruvbox dark
if has('gui_running')
    set background=dark
    colorscheme solarized
else
    set background=dark
    colorscheme gruvbox
endif

" Put these back on.
filetype plugin indent on
filetype plugin on
