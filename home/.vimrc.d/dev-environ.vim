
"""Base Settings for ALE
command! ALEDisableFixers let g:ale_fix_on_save=0
let g:ale_fix_on_save = 1

"ALE defaults to all linters turned on, so this turns some off.
let g:ale_linters = {
            \   'python': [
            \       'pylint',
            \       'flake8',
            \       'mypy',
            \       'bandit',
            \       'unimport',
            \    ],
            \   'php': ['phpcs'],
            \   'spec': ['rpmlint'],
            \}

" Ale defaults to all fixers turned off, so this turns some on.
" Fixing AUTOMATICALLY CHANGES YOUR CODE on save.
let g:ale_fixers = {
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \   'python': ['black', 'isort'],
            \   'yaml': ['prettier'],
            \   'go':   ['gofmt', 'goimports'],
            \   'php': ['php_cs_fixer'],
            \   'scss': ['prettier'],
            \   'rust': ['rustfmt'],
            \   'javascript' : ['eslint'],
            \   'javascriptreact' : ['eslint'],
            \   'typescript': ['eslint'],
            \   'vue': ['eslint'],
            \   'json' :['jq'],
            \}

" ALE settings for speficic languages.
"PHP
let g:ale_php_phpcs_standard = 'PSR12'

"FORTRAN
let g:ale_fortran_gcc_use_free_form = 0

"JSON
let g:ale_json_jq_options = '--sort-keys'

"""Base Settings for COC
let g:coc_config_home = '~/.alex-environ/home/.vimrc.d/coc'
let g:coc_global_extensions = ['coc-jedi', 'coc-rls', 'coc-tsserver', 'coc-json', 'coc-htmldjango']
"""Language Specific Options.
"Remeber that COC has it's own settings file too, so most of it's settings are
"there.

" VIMSPECTOR
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_install_gadgets = ['debugpy']
