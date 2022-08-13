if !exists("g:my_environ_dir")
    let g:my_environ_dir = expand('~/.alex-environ')
endif

exe "source " . g:my_environ_dir . "/home/.vimrc.d/base.vim"
exe "source " . g:my_environ_dir . "/home/.vimrc.d/filetypes.vim"

exe "source " . g:my_environ_dir . "/home/.vimrc.d/plugins.vim"
exe "source " . g:my_environ_dir . "/home/.vimrc.d/dev-environ.vim"

exe "source " . g:my_environ_dir . "/home/.vimrc.d/gui.vim"
