" --------------------- Mappings ---------------------
nnoremap <silent> <leader>h :wincmd h<CR>
nnoremap <silent> <leader>j :wincmd j<CR>
nnoremap <silent> <leader>k :wincmd k<CR>
nnoremap <silent> <leader>l :wincmd l<CR>

" Save by CTRL-S
nnoremap <silent> <c-s> :w<CR>
inoremap <silent> <c-s> <ESC> :w<CR>

" Make word uppercase
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<ESC>

"Move selected lines up-down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"Keep visual mode indenting
vnoremap < <gv
vnoremap > >gv

"Easymotion
map f <Plug>(easymotion-bd-f)
map F <Plug>(easymotion-linebackward)

"Prettier
nmap <Leader>ap <Plug>(Prettier)

"Fzf
nnoremap <silent> <c-p> :Files<CR>
nnoremap <silent> <s-p> :Rg<CR>

"Git
nnoremap <Leader>cc :Gcommit -m "

"Tabs
" nnoremap H gT
" nnoremap L gt

"Buffers
nnoremap <silent> <Tab> :BufferNext<CR>
nnoremap <silent> gn :bn<CR>
nnoremap <silent> <S-Tab> :BufferPrevious<CR>
nnoremap <silent> gp :bp<CR>
nnoremap <silent> <s-q> :BufferClose<CR>

" Move between airline tabs
nmap <silent> <leader>1 :BufferGoto 1<CR>
nmap <silent> <leader>2 :BufferGoto 2<CR>
nmap <silent> <leader>3 :BufferGoto 3<CR>
nmap <silent> <leader>4 :BufferGoto 4<CR>
nmap <silent> <leader>5 :BufferGoto 5<CR>
nmap <silent> <leader>6 :BufferGoto 6<CR>
nmap <silent> <leader>7 :BufferGoto 7<CR>
nmap <silent> <leader>8 :BufferGoto 8<CR>
nmap <silent> <leader>9 :BufferGoto 9<CR>

"Remove highlights
nnoremap <silent> <CR> :noh<CR><CR>

"CoC
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <silent><expr> <C-Space> coc#refresh()

map <silent> <c-e> :CocCommand explorer --position floating --sources=file+<CR>

nmap <silent> <C-Space> v<Plug>(coc-codeaction-selected)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" Refactor / Find word across project
nnoremap <Leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader>pf :FZF -q <C-R>=expand("<cword>")<CR><CR>

" Introduce function text object
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

function! s:GoToDefinition()
  if CocAction('jumpDefinition')
    return v:true
  endif

  let ret = execute("silent! normal \<C-]>")
  if ret =~ "Error"
    call searchdecl(expand('<cword>'))
  endif
endfunction

nmap <silent> gd :call <SID>GoToDefinition()<CR>

" Don't yank on delete char
nnoremap x "_x
nnoremap X "_X
vnoremap x "_x
vnoremap X "_X

" Yank until the end of line
nnoremap Y y$

" Floaterm
nnoremap <silent> <F12> :FloatermToggle<CR>
tnoremap <silent> <F12> <C-\><C-n>:FloatermToggle<CR>
tnoremap <silent> <F11> <C-\><C-n>:FloatermNext<CR>

" Avoid issues because of us remapping <c-a> and <c-x> below
nnoremap <Plug>SpeedDatingFallbackUp <c-a>
nnoremap <Plug>SpeedDatingFallbackDown <c-x>

" Manually invoke speeddating in case switch.vim didn't work
nnoremap <silent> <C-a> :if !switch#Switch() <bar>
      \ call speeddating#increment(v:count1) <bar> endif<CR>
nnoremap <C-x> :if !switch#Switch({'reverse': 1}) <bar>
      \ call speeddating#increment(-v:count1) <bar> endif<CR>
