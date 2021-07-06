" default dict
"
"
let s:default_dict = {
      \ 'main_color': '#007020',
      \ 'led_names': [[]],
      \ 'led_colors': []
      \ }

let g:openrgb_mode_dict = {}
for mode in ['n', 'v', 'V', '', 'i', 'R', 'c', 'r', 't', 'default']
  let g:openrgb_mode_dict[mode] = copy(s:default_dict)
endfor

" customize dict:
"     - each group of keys in 'led_names' are lit using the same color
"
"
"     - look at 'g:openrgb_led_names' to see the available 'led_names'
"     - if empty(led_colors):
"           colors are assigned automatically
"       else:
"           led_colors are used
" -- normal
"
"
let g:openrgb_mode_dict['n']['main_color'] = '#ffff00'
let g:openrgb_mode_dict['n']['led_names'] = [
      \ ['Key: Right Arrow', 'Key: Left Arrow', 'Key: Up Arrow', 'Key: Down Arrow'],
      \ ['Key: H', 'Key: J', 'Key: K', 'Key: L'],
      \ ['Key: Left Control', 'Key: Left Windows', 'Key: Left Alt', 'Key: Left Shift'],
      \ ['Key: Insert', 'Key: Delete', 'Key: Home', 'Key: End', 'Key: Page Up', 'Key: Page Down'],
      \ ['Key: F1', 'Key: F2', 'Key: F3', 'Key: F4'],
      \ ['Key: F5', 'Key: F6', 'Key: F7', 'Key: F8'],
      \ ['Key: F9', 'Key: F10', 'Key: F11', 'Key: F12'],
      \ ['Key: 0', 'Key: 1', 'Key: 2', 'Key: 3', 'Key: 4', 'Key: 5', 'Key: 6', 'Key: 7', 'Key: 8', 'Key: 9'],
      \ ]

" -- insert
"
"
let g:openrgb_mode_dict['i']['main_color'] = '#007020'
let g:openrgb_mode_dict['i']['led_names'] = [
      \ ['Key: Caps Lock', 'Key: Escape'],
      \ ['Key: Space'],
      \ ]
let g:openrgb_mode_dict['i']['led_colors'] = [
      \ '#0000ff',
      \ '#ffff00'
      \ ]

" -- visual
"
"
let g:openrgb_mode_dict['v']['main_color'] = '#fe8019'

function OpenRGBStatuslineFunc()
  if g:openrgb_is_ready
    call OpenRGBChangeColorFromMode(mode())
  endif
  return ''
endfunction

" if empty(&statusline)
"   set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" endif
" set statusline+=%{OpenRGBStatuslineFunc()}

autocmd FocusGained * call OpenRGBChangeColorFromMode(mode(), 1)
