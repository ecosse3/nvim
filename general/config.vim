" --------------------- Config ---------------------

let mapleader = "\<Space>"

let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
let g:netrw_fastbrowse = 0
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:rainbow_active = 1

let g:coc_global_extensions =
      \ [
      \ 'coc-angular',
      \ 'coc-css',
      \ 'coc-db',
      \ 'coc-emmet',
      \ 'coc-eslint',
      \ 'coc-explorer',
      \ 'coc-highlight',
      \ 'coc-html',
      \ 'coc-import-cost',
      \ 'coc-json',
      \ 'coc-prettier',
      \ 'coc-sh',
      \ 'coc-snippets',
      \ 'coc-styled-components',
      \ 'coc-tabnine',
      \ 'coc-tsserver',
      \ 'coc-yank',
      \ ]

command! -nargs=0 Prettier :CocCommand prettier.formatFile

let g:closetag_filenames = '*.html,*.xhtml,*.js,*.jsx,*.tsx,*.xml'

let g:signify_sign_delete = '-'

let g:vim_jsx_pretty_colorful_config = 1

let g:better_whitespace_enabled = 0

let g:UltiSnipsExpandTrigger="<C-l>"

let g:js_file_import_use_fzf = 1

let g:indentLine_char_list = ['|', '¦', '┆', '┊']

let g:switch_mapping = ""

let g:speeddating_no_mappings = 1

" ---- Fzf Preview ----

let g:fzf_preview_command = 'bat --color=always --plain {-1}'
let g:fzf_preview_git_status_preview_command =
  \ "[[ $(git diff --cached -- {-1}) != \"\" ]] && git diff --cached --color=always -- {-1} | delta || " .
  \ "[[ $(git diff -- {-1}) != \"\" ]] && git diff --color=always -- {-1} | delta || " .
  \ g:fzf_preview_command

" ---- Git Signs ----

lua << EOF
  require('gitsigns').setup {
    signs = {
      add          = {hl = '', text = '+', numhl='GitSignsAddNr'},
      change       = {hl = '', text = '!', numhl='GitSignsChangeNr'},
      delete       = {hl = '', text = '_', numhl='GitSignsDeleteNr'},
      topdelete    = {hl = '', text = '‾', numhl='GitSignsDeleteNr'},
      changedelete = {hl = '', text = '!-', numhl='GitSignsChangeNr'},
    },
    numhl = false,
    keymaps = {
      -- Default keymap options
      noremap = true,
      buffer = true,

      ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
      ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},

      ['n <leader>ghs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
      ['n <leader>ghu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
      ['n <leader>ghr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
      ['n <leader>ghp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
      ['n <leader>ghb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',
    },
    watch_index = {
      interval = 700
    },
    sign_priority = 6,
    status_formatter = nil, -- Use default
  }
EOF
