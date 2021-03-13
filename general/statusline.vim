let s:cache = {'branch': ''}

augroup custom_statusline
  autocmd!
  autocmd BufEnter * silent! call FugitiveDetect(expand('<afile>')) | let s:cache.branch = fugitive#head()
  autocmd BufEnter,WinEnter * setlocal statusline=%!Statusline()
  autocmd BufLeave,WinLeave * setlocal statusline=%f\ %y\ %m
  autocmd User FugitiveChanged let s:cache.branch = fugitive#head()
  autocmd VimEnter,ColorScheme * call s:set_statusline_colors()
augroup END

function! s:set_statusline_colors() abort
  let is_dark = &background ==? 'dark'
  let s:normal_bg = synIDattr(hlID('Normal'), 'bg')
  let s:normal_fg = synIDattr(hlID('Normal'), 'fg')
  let s:statusline_bg = synIDattr(hlID('Statusline'), 'bg')
  let s:comment_fg = synIDattr(hlID('Comment'), 'fg')
  let s:warning_fg = synIDattr(hlID('WarningMsg'), 'fg')
  let s:error_fg = synIDattr(hlID('ErrorMsg'), 'fg')

  silent! exe 'hi StItem guibg='.s:normal_fg.' guifg='.s:normal_bg.' gui=NONE'
  silent! exe 'hi StItem2 guibg='.s:comment_fg.' guifg='.s:normal_bg.' gui=NONE'
  silent! exe 'hi StSep guifg='.s:normal_fg.' guibg='.s:statusline_bg.' gui=NONE'
  silent! exe 'hi StSep2 guifg='.s:comment_fg.' guibg='.s:statusline_bg.' gui=NONE'
  silent! exe 'hi StErr guibg='.s:error_fg.' guifg='.s:normal_bg.' gui=bold'
  silent! exe 'hi StErrSep guifg='.s:error_fg.' guibg='.s:statusline_bg.' gui=NONE'
  silent! exe 'hi StWarn guibg='.s:warning_fg.' guifg='.s:normal_bg.' gui=bold'
  silent! exe 'hi StWarnSep guifg='.s:warning_fg.' guibg='.s:statusline_bg.' gui=NONE'
endfunction

function! s:sep(item, ...) abort
  let l:opts = get(a:, '1', {})
  let l:show = get(a:, '2', 1)
  if !l:show
    return ''
  endif
  let l:no_after = get(l:opts, 'no_after', 0)
  let l:no_before = get(l:opts, 'no_before', 0)
  let l:sep_color = get(l:opts, 'sep_color', '%#StSep#')
  let l:color = get(l:opts, 'color', '%#StItem#')
  let l:side = get(l:opts, 'side', 'left')
  let l:sep_before = '█'
  let l:sep_after = '█'
  if l:side !=? 'left'
    let l:sep_before = '█'
    let l:sep_after = '█'
  endif

  if l:no_before
    let l:sep_before = ' '
  endif

  if l:no_after
    let l:sep_after = ' '
  endif

  return l:sep_color.l:sep_before.l:color.a:item.l:sep_color.l:sep_after.'%*'
endfunction

let s:st_mode = {'color': '%#StMode#', 'sep_color': '%#StModeSep#', 'no_before': 1 }
let s:st_err = {'color': '%#StErr#', 'sep_color': '%#StErrSep#'}
let s:st_mode_right = extend(copy(s:st_mode), { 'side': 'right', 'no_before': 0 })
let s:st_err_right = extend(copy(s:st_err), {'side': 'right'})
let s:st_warn = {'color': '%#StWarn#', 'sep_color': '%#StWarnSep#', 'side': 'right', 'no_after': 1}
let s:sec_2 = {'color': '%#StItem2#', 'sep_color': '%#StSep2#'}

function! Statusline() abort
  let l:mode = s:mode_statusline()
  let l:statusline = s:sep(l:mode, s:st_mode)
  let l:git_status = s:git_statusline()
  let l:statusline .= '%<'
  " let l:statusline .= s:sep(fugitive#head(), s:sec_2, !empty(FugitiveStatusline()))
  let l:statusline .= s:sep(l:git_status, s:sec_2, !empty(l:git_status))
  let l:statusline .= s:sep(s:get_path(), &modified ? s:st_err : s:sec_2)
  let l:statusline .= s:sep(' + ', s:st_err, &modified)
  let l:statusline .= s:sep(' - ', s:st_err, !&modifiable)
  let l:statusline .= s:sep('%w', {}, &previewwindow)
  let l:statusline .= s:sep('%r', {}, &readonly)
  let l:statusline .= s:sep('%q', {}, &buftype ==? 'quickfix')
  " let l:position = get(b:, 'coc_current_function', '')
  " let l:statusline .= s:sep(l:position, s:sec_2, !empty(l:position))
  let l:statusline .= '%='
  let l:anzu = exists('*anzu#search_status') ? anzu#search_status() : ''
  let l:statusline .= s:sep(l:anzu, extend({'side': 'right'}, s:sec_2), !empty(l:anzu))
  let l:ft = &filetype
  let l:statusline .= s:sep(l:ft, extend({'side': 'right'}, s:sec_2), !empty(l:ft))
  let l:statusline .= s:sep(': %c', s:st_mode_right)
  let l:statusline .= s:sep(': %l/%L', s:st_mode_right)
  " let l:statusline .= s:sep('%p%%', extend({'no_after': empty(coc#status())}, s:st_mode_right))
  " let l:statusline .= s:sep(coc#status(), extend({ 'no_after': !empty(coc#status()) }, s:st_err_right), !empty(coc#status()))
  let l:statusline .= '%<'
  let l:statusline .= OpenRGBStatuslineFunc()
  return l:statusline
endfunction

function! s:git_statusline() abort
  if !exists('b:gitsigns_status')
    return s:with_icon(s:cache.branch, "\ue0a0")
  endif
  let l:result = join(filter([s:cache.branch, b:gitsigns_status], {-> !empty(v:val) }), ' ')
  return s:with_icon(l:result, "\ue0a0")
endfunction

function! s:mode_statusline() abort
  let l:mode = mode()
  call s:mode_highlight(l:mode)
  let l:modeMap = {
  \ 'n'  : 'NORMAL',
  \ 'i'  : 'INSERT',
  \ 'R'  : 'REPLACE',
  \ 'v'  : 'VISUAL',
  \ 'V'  : 'V-LINE',
  \ 'c'  : 'COMMAND',
  \ '' : 'V-BLOCK',
  \ 's'  : 'SELECT',
  \ 'S'  : 'S-LINE',
  \ '' : 'S-BLOCK',
  \ 't'  : 'TERMINAL',
  \ }

  return get(l:modeMap, l:mode, 'UNKNOWN')
endfunction

function! s:mode_highlight(mode) abort
  if a:mode ==? 'i'
    hi StMode guibg=#83a598 guifg=#3c3836
    hi StModeSep guifg=#83a598
  elseif a:mode =~? '\(v\|V\|\)'
    hi StMode guibg=#fe8019 guifg=#3c3836
    hi StModeSep guifg=#fe8019
  elseif a:mode ==? 'R'
    hi StMode guibg=#8ec07c guifg=#3c3836
    hi StModeSep guifg=#8ec07c
  else
    silent! exe 'hi StMode guibg='.s:normal_fg.' guifg='.s:normal_bg.' gui=NONE'
    silent! exe 'hi StModeSep guifg='.s:normal_fg.' guibg='.s:statusline_bg.' gui=NONE'
  endif
endfunction

function! s:with_icon(value, icon) abort
  if empty(a:value)
    return a:value
  endif
  return a:icon.' '.a:value
endfunction

function! s:get_path() abort
  let l:path = expand('%')
  if isdirectory(l:path)
    return '%F'
  endif

  let l:path = substitute(expand('%'), '^'.getcwd(), '', '')

  if len(l:path) < 40
    return '%f'
  endif

  return pathshorten(l:path)
endfunction
