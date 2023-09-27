"BASICS
" ---------------------------------------
"Settings for specific filetypes that rely on base-vim only (no plugins)
filetype plugin indent on
filetype plugin on

"LANGUAGE SPECIFIC
" ---------------------------------------
"Apache
au BufNewFile,BufRead /*/httpd/conf.d/* setf apache

"ssh
au BufNewFile,BufRead */.ssh/config.d/* setf sshconfig

"Django
autocmd BufNewFile,BufRead *.djt set syntax=django
autocmd BufNewFile,BufRead *.html.djt set syntax=htmldjango

"Python
au FileType python
            \ setlocal tabstop=4
            \ | setlocal softtabstop=4
            \ | setlocal shiftwidth=4
            \ | setlocal expandtab
            \ | setlocal autoindent
            \ | setlocal fileformat=unix

"yaml
au FileType yaml
            \ setlocal tabstop=2
            \ | setlocal softtabstop=2
            \ | setlocal shiftwidth=2
            \ | setlocal expandtab
            \ | setlocal autoindent
            \ | setlocal fileformat=unix

"FORTRAN
let fortran_fixed_source = 1
let fortran_do_enddo=1
let fortran_indent_less=1
function SetfortranOptions()
    setlocal incsearch
    setlocal ignorecase
    setlocal smartcase
    setlocal smarttab
    setlocal expandtab
    setlocal tabstop=2
    setlocal shiftwidth=2
endfunction
autocmd FileType fortran call SetfortranOptions()

"PHP
" Don't beep on > character
au BufWinEnter *.php set mps-=<:>

"Latex
let g:tex_flavor='latex'

"Vim
au BufNewFile,BufRead */.vimrc.d/* set filetype=vim

"Helm
autocmd BufRead,BufNewFile */templates/*.yaml,*/templates/*.tpl,*.gotmpl set ft=helm
" Use {{/* */}} as comments
autocmd FileType helm setlocal commentstring={{/*\ %s\ */}}
" Same as for yaml above
au FileType helm
            \ setlocal tabstop=2
            \ | setlocal softtabstop=2
            \ | setlocal shiftwidth=2
            \ | setlocal expandtab
            \ | setlocal autoindent
            \ | setlocal fileformat=unix
