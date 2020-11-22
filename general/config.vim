" --------------------- Config ---------------------
let mapleader = "\<Space>"

let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
let g:netrw_fastbrowse = 0
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:rainbow_active = 1

let g:coc_global_extensions = ['coc-explorer', 'coc-json', 'coc-tsserver', 'coc-tslint-plugin', 'coc-eslint', 'coc-emmet', 'coc-prettier', 'coc-angular', 'coc-snippets', 'coc-styled-components', 'coc-css', 'coc-html', 'coc-import-cost']
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
