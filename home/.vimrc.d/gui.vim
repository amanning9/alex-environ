if has('gui_running')
    set guifont=Menlo\ Regular:h20
    set columns=90
    set lines=30

    autocmd VimEnter * if !argc() | NERDTree | endif
    let g:NERDTreeMouseMode=3
endif
