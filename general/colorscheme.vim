" --------------------- Colorscheme & Airline ---------------------
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF

colorscheme nightfly

hi Comment cterm=italic

let g:nvcode_termcolors=256

let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
let g:onedark_termcolors=256

let g:airline_theme='nightfly'

if exists('g:started_by_firenvim')
  let g:airline_powerline_fonts = 0
  let g:airline#extensions#tabline#enabled = 0
else
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#formatter = 'react'
  let g:airline#extensions#tabline#buffer_idx_mode = 1
endif
