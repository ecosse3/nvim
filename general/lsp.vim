" Saga
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
nnoremap <silent> gr <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
nmap <silent> <C-Space> <cmd>lua require('lspsaga.codeaction').code_action()<CR>
nnoremap <silent> <Leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent> <Leader>ca <cmd>'<,'>lua require('lspsaga.codeaction').range_code_action()<CR>
nnoremap <silent> <Leader>cr <cmd>lua require('lspsaga.rename').rename()<CR>
nnoremap <silent> <Leader>cf <cmd>lua vim.lsp.buf.formatting()<CR>
vnoremap <silent> <Leader>cf <cmd>'<.'>lua vim.lsp.buf.range_formatting()<CR>
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
nnoremap <silent> <C-k> <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
nnoremap <silent> [g <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
nnoremap <silent> ]g <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

" Compe
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
" inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
" inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" Auto-format
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_sync(nil, 100)

" Light-bulb
autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
