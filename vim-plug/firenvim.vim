" Different syntax highligting on specific website
au BufEnter github.com_*.txt set filetype=markdown

" Config
let g:firenvim_config = {
    \ 'globalSettings': {
        \ 'alt': 'all',
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'priority': 0,
            \ 'selector': 'textarea',
            \ 'takeover': 'always',
        \ },
    \ }
\ }

" Disable on specific websites
let fc = g:firenvim_config['localSettings']
let fc['https?://twitter.com'] = { 'takeover': 'never', 'priority': 1 }
