set termguicolors
colorscheme nightfly

hi Comment cterm=italic

" Errors in Red
hi LspDiagnosticsVirtualTextError guifg=Red ctermfg=Red
" Warnings in Yellow
hi LspDiagnosticsVirtualTextWarning guifg=Yellow ctermfg=Yellow
" Info and Hints in White
hi LspDiagnosticsVirtualTextInformation guifg=White ctermfg=White
hi LspDiagnosticsVirtualTextHint guifg=White ctermfg=White

hi link gitmessengerPopupNormal LspSagaBorderTitle

" Change color of cursor line number and bold
hi clear CursorLineNR
augroup CLClear
    autocmd! ColorScheme * hi clear CursorLine
augroup END

hi CursorLineNR cterm=bold guifg=Yellow ctermfg=Yellow
augroup CLNRSet
    autocmd! ColorScheme * hi CursorLineNR cterm=bold guifg=Yellow ctermfg=Yellow
augroup END

" Colorscheme config
let g:nightflyCursorColor         = 0
let g:nightflyUnderlineMatchParen = 0
let g:nightflyNormalFloat         = 1
