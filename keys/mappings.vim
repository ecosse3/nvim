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
nnoremap H gT
nnoremap L gt

"Buffers
nnoremap <silent> <c-b> :Buffers<CR>
nnoremap <silent> <Tab> :bn<CR>
nnoremap <silent> gn :bn<CR>
nnoremap <silent> <S-Tab> :bp<CR>
nnoremap <silent> gp :bp<CR>
nnoremap <silent> <s-q> :bd<CR>

"Remove highlights
nnoremap <silent> <CR> :noh<CR><CR>

"CoC
inoremap <silent> <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <buffer> <silent><expr> <C-space> coc#refresh()
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

map <silent> <c-e> :CocCommand explorer --position floating<CR>

nmap <C-Space> <Plug>(coc-codeaction)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Refactor / Find word across project
nnoremap <Leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>

" Introduce function text object
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" GoTo code navigation.
nmap <buffer> gd <Plug>(coc-definition)
nmap <buffer> gy <Plug>(coc-type-definition)
nmap <buffer> gi <Plug>(coc-implementation)
nmap <buffer> gr <Plug>(coc-references)

" Don't yank on delete char
nnoremap x "_x
nnoremap X "_X
vnoremap x "_x
vnoremap X "_X
