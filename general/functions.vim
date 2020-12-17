"map :q to buffer delete
cnoreabbrev <expr> q getcmdtype() == ":" && (getcmdline() == 'q' && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) > 1) ? ':Bdelete' : 'q'

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace() " trim white-spaces on entry
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif " close coc-explorer if it's last active window

" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

nnoremap <silent>K :call <SID>show_documentation()<CR>

" Show documentation in preview window
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Highlight on yank
augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Change jsx/tsx filetypes
augroup ReactFiletypes
  autocmd!
  autocmd BufRead,BufNewFile *.jsx set filetype=javascriptreact
  autocmd BufRead,BufNewFile *.tsx set filetype=typescriptreact
augroup END
