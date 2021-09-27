" --------------------- Config ---------------------

let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<C-l>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"

let g:js_file_import_use_fzf = 0
let g:js_file_import_use_telescope = 1

let g:switch_mapping = ""

let g:speeddating_no_mappings = 1

let g:vsnip_filetypes = {}
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript']

" let g:user_emmet_leader_key='<C-e>'

let g:cursorhold_updatetime = 100

" tsconfig.json is actually jsonc, help TypeScript set the correct filetype
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc

autocmd BufRead,BufNewFile */node_modules/* :LspStop
autocmd BufLeave */node_modules/* :LspStart
