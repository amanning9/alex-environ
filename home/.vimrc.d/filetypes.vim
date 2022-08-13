"BASICS
" ---------------------------------------
"Settings for specific filetypes that rely on base-vim only (no plugins)
filetype plugin indent on
filetype plugin on

"LANGUAGE SPECIFIC
" ---------------------------------------
"Apache
au BufNewFile,BufRead /*/httpd/conf.d/* setf apache

"Django
autocmd BufNewFile,BufRead *.djt set syntax=django
autocmd BufNewFile,BufRead *.html.djt set syntax=htmldjango

"Python
    au BufNewFile,BufRead *.py
                \ setlocal tabstop=4
                \ | setlocal softtabstop=4
                \ | setlocal shiftwidth=4
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
autocmd BufRead,BufNewFile */templates/*.yaml,*/templates/*.tpl,*.gotmpl,helmfile.yaml set ft=helm
" Use {{/* */}} as comments
autocmd FileType helm setlocal commentstring={{/*\ %s\ */}}
