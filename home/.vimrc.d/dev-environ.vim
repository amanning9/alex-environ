
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

" Spell checking
let g:ale_cspell_options = '--config ~/.alex-envion/home/.config/cspell/config.yaml'

"""Base Settings for COC
let g:coc_config_home = '~/.alex-environ/home/.vimrc.d/coc'
let g:coc_global_extensions = ['coc-jedi', 'coc-rust-analyzer', 'coc-tsserver', 'coc-json', 'coc-htmldjango']
"""Language Specific Options.
"Remeber that COC has it's own settings file too, so most of it's settings are
"there.

" VIMSPECTOR
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_install_gadgets = ['debugpy']

" Config for Coc originally from their github.
" Use tab for trigger completion with characters ahead and navigate
" If node is not available Coc will not be loaded so disable.
if executable('node') " Coc only works if nodejs is available.
    inoremap <silent><expr> <TAB>
                \ coc#pum#visible() ? coc#pum#next(1) :
                \ CheckBackspace() ? "\<Tab>" :
                \ coc#refresh()
    inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

    " Make <CR> to accept selected completion item or notify coc.nvim to format
    inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    " Use <c-space> to trigger completion
    inoremap <silent><expr> <c-@> coc#refresh()

    " Dependenciy of the above. fom Coc github.
    function! CheckBackspace() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction
endif
