let $FZF_DEFAULT_COMMAND="fd --hidden --type f --exclude .git"
let $FZF_DEFAULT_OPTS="--reverse || --preview '[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null'"

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let g:fzf_nvim_statusline = 0

let g:fzf_branch_actions = {
  \ 'track': {
  \   'prompt': 'Track> ',
  \   'execute': 'echo system("{git} checkout --track {branch}")',
  \   'multiple': v:false,
  \   'keymap': 'ctrl-t',
  \   'required': ['branch'],
  \   'confirm': v:false,
  \ },
  \ 'diff': {
  \   'prompt': 'Diff> ',
  \   'execute': 'Git diff {branch}',
  \   'multiple': v:false,
  \   'keymap': 'ctrl-f',
  \   'required': ['branch'],
  \   'confirm': v:false,
  \ },
  \}

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'Conditional', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'Conditional', 'Conditional'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

 " Make Ripgrep ONLY search file contents and not filenames
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --smart-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4.. -e'}, 'right:50%', '?'),
  \   <bang>0)

" advanced ripgrep integration
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
