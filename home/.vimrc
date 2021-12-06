if !exists("g:my_environ_dir")
    let g:my_environ_dir = expand('~/.alex-environ')
endif

exe "source " . g:my_environ_dir . "/home/.vimrc.d/base"
exe "source " . g:my_environ_dir . "/home/.vimrc.d/filetypes"

exe "source " . g:my_environ_dir . "/home/.vimrc.d/plugins"
exe "source " . g:my_environ_dir . "/home/.vimrc.d/dev-environ"
