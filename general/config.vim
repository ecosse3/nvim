" --------------------- Config ---------------------

let mapleader = "\<Space>"

let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
let g:netrw_fastbrowse = 0
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:closetag_filenames = '*.html,*.xhtml,*.js,*.jsx,*.tsx,*.xml'

let g:signify_sign_delete = '-'

let g:vim_jsx_pretty_colorful_config = 1

let g:better_whitespace_enabled = 0

let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<C-l>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"

let g:js_file_import_use_fzf = 0
let g:js_file_import_use_telescope = 1

" let g:indentLine_char_list = ['|', '¦']
" let g:indentLine_fileTypeExclude = [ 'startify' ]
let g:indentLine_setColors = 0
let g:indent_blankline_use_treesitter = v:true
let g:indent_blankline_show_current_context = v:true

let g:switch_mapping = ""

let g:speeddating_no_mappings = 1

let g:typescript_indent_disable = 1

let g:vsnip_filetypes = {}
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript']

let g:user_emmet_leader_key='<c-e>'

let g:git_messenger_floating_win_opts = { 'border': 'single' }
let g:git_messenger_popup_content_margins = v:true

" tsconfig.json is actually jsonc, help TypeScript set the correct filetype
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc

autocmd BufRead,BufNewFile */node_modules/* :LspStop
autocmd BufLeave */node_modules/* :LspStart
