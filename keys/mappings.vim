" --------------------- Mappings ---------------------
nnoremap <silent> <leader>h :wincmd h<CR>
nnoremap <silent> <leader>j :wincmd j<CR>
nnoremap <silent> <leader>k :wincmd k<CR>
nnoremap <silent> <leader>l :wincmd l<CR>

nnoremap <silent> H :wincmd h<CR>
nnoremap <silent> J :wincmd j<CR>
nnoremap <silent> K :wincmd k<CR>
nnoremap <silent> L :wincmd l<CR>

" Save by CTRL-S
nnoremap <silent> <c-s> :w<CR>
inoremap <silent> <c-s> <ESC> :w<CR>

" Make word uppercase
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<ESC>

" Move selected lines up-down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Keep visual mode indenting
vnoremap < <gv
vnoremap > >gv

" Hop
" map <silent>f :HopChar2<CR>

" Prettier
nmap <Leader>ap <Plug>(Prettier)

" Telescope
nnoremap <c-p> <cmd>Telescope find_files<CR>
nnoremap <s-p> <cmd>Telescope live_grep<CR>

" Git
nnoremap <silent> <Leader>gla <cmd>lua require('plugins.telescope').my_git_commits()<CR>
nnoremap <silent> <Leader>glc <cmd>lua require('plugins.telescope').my_git_bcommits()<CR>

" Tabs
" nnoremap H gT
" nnoremap L gt

" Buffers
nnoremap <silent> <Tab> :BufferNext<CR>
nnoremap <silent> gn :bn<CR>
nnoremap <silent> <S-Tab> :BufferPrevious<CR>
nnoremap <silent> gp :bp<CR>
nnoremap <silent> <s-q> :BufferClose<CR>

" Move between barbar buffers
nmap <silent> <leader>1 :BufferGoto 1<CR>
nmap <silent> <leader>2 :BufferGoto 2<CR>
nmap <silent> <leader>3 :BufferGoto 3<CR>
nmap <silent> <leader>3 :BufferGoto 3<CR>
nmap <silent> <leader>4 :BufferGoto 4<CR>
nmap <silent> <leader>5 :BufferGoto 5<CR>
nmap <silent> <leader>6 :BufferGoto 6<CR>
nmap <silent> <leader>7 :BufferGoto 7<CR>
nmap <silent> <leader>8 :BufferGoto 8<CR>
nmap <silent> <leader>9 :BufferGoto 9<CR>

nmap <silent> <A-1> :BufferGoto 1<CR>
nmap <silent> <A-2> :BufferGoto 2<CR>
nmap <silent> <A-3> :BufferGoto 3<CR>
nmap <silent> <A-3> :BufferGoto 3<CR>
nmap <silent> <A-4> :BufferGoto 4<CR>
nmap <silent> <A-5> :BufferGoto 5<CR>
nmap <silent> <A-6> :BufferGoto 6<CR>
nmap <silent> <A-7> :BufferGoto 7<CR>
nmap <silent> <A-8> :BufferGoto 8<CR>
nmap <silent> <A-9> :BufferGoto 9<CR>

" Remove highlights
nnoremap <silent> <CR> :noh<CR><CR>

" Refactor / Find word across project
" TODO: Find way to project-refactor-word via LSP
nnoremap <Leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader>pf yiw<cmd>Telescope find_files<CR><C-r>+<ESC>
nnoremap <Leader>pw <cmd>Telescope grep_string <CR><ESC>

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
nnoremap <silent> <C-x> :if !switch#Switch({'reverse': 1}) <bar>
      \ call speeddating#increment(-v:count1) <bar> endif<CR>

" Quickfix
nmap <silent> <Leader>, :cp<CR>
nmap <silent> <Leader>. :cn<CR>

" VSnip
"" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Easy Align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Close quickfix window
nmap <silent> <leader>cc :cclose<CR>

" Replace <C-W> with s
" nnoremap s <C-W>
