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
let g:UltiSnipsJumpForwardTrigger="<C-l>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"

let g:js_file_import_use_fzf = 0
let g:js_file_import_use_telescope = 1

let g:indentLine_char_list = ['|', '¦']
let g:indentLine_setColors = 0
let g:indentLine_fileTypeExclude = [ 'startify', 'coc-explorer' ]

let g:switch_mapping = ""

let g:speeddating_no_mappings = 1

let g:typescript_indent_disable = 1

let g:vsnip_filetypes = {}
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript']

" tsconfig.json is actually jsonc, help TypeScript set the correct filetype
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc
