# Ecovim: Ultimate React Neovim Config

[![Last commit](https://img.shields.io/github/last-commit/ecosse3/nvim)](https://github.com/ecosse3/nvim/commits/master)
![Stars](https://img.shields.io/github/stars/ecosse3/nvim?label=%E2%AD%90%20Stars)
![License](https://img.shields.io/github/license/ecosse3/nvim)
![Follow](https://img.shields.io/github/followers/ecosse3?label=Please%20follow%20%20to%20support%20my%20work&style=social)

### A non-minimal Neovim config built to work most efficiently with React, JavaScript & TypeScript frameworks.

## Screenshots

![Dashboard](./.screenshots/4-dashboard.png)
![Neovim](./.screenshots/4-main.png)

## Installation

Make sure to use newest Neovim version (0.6).
Copy it into your terminal:

```bash
bash <(curl -s https://raw.githubusercontent.com/ecosse3/nvim/master/.install/run.sh)
```

:warning: Installation script is in **BETA** status. Please open an issue if you experience any problem with it.

After install configuration:

1. Treesitter Languages are not installed by default.\
Make sure to run `:TSInstall <lang>` or `:TSInstall maintained` after first run.
2. LSP servers are disabled by default. Please enable them in `lua/lsp/config.lua` by uncomment specific lines.

## Configuration

To change Ecovim related config use the `config.lua` file.\
To change vim settings use the `settings.lua` file.

## Keybindings

Currently I have no idea how to write for you my whole workflow of using Ecovim config in React.js projects I am working on,\
but I can write you the most useful custom key bindings by the frequency I use them.

Space (SPC) is my Leader key.

### Searching

| Key Bindings | Description                 |
|--------------|-----------------------------|
| <C - p>      | Telescope git files         |
| <S - p>      | Telescope live grep         |
| s            | Enables lightspeed forward  |
| S            | Enables lightspeed backward |
| SPC s d      | Search dotfiles             |
| SPC s h      | Search file history         |
| SPC s s      | Search history              |


### Working with LSP:

| Key Bindings           | Description                                       |
|------------------------|---------------------------------------------------|
| <C - Space> or SPC c a | Code action                                       |
| <S - K>                | Show documentation under cursor                   |
| gd                     | Go to definition                                  |
| gr                     | Go to references                                  |
| ]g                     | Go to next diagnostic                             |
| [g                     | Go to prev diagnostic                             |
| SPC c f                | Format document (usually ESLint/Prettier)         |
| SPC c r                | Rename                                            |
| SPC c q                | Quick fix - when I exactly know if it will fix it |
| SPC c d                | Local diagnostics list                            |
| SPC c o                | Organize imports                                  |


### Working with Git:

| Key Bindings | Description                                                                                                                              |
|--------------|------------------------------------------------------------------------------------------------------------------------------------------|
| SPC g g      | Lazygit - for commiting and branch change                                                                                                |
| SPC g s      | Telescope status - when I want to change/search file I am working on with git changes                                                    |
| ]c           | Go to next change hunk                                                                                                                   |
| [c           | Go to prev change hunk                                                                                                                   |
| SPC g d      | Advanced powerful diff view with many filters for debugging code, checking previous changes etc.                                         |
| SPC g m      | View hunk diff of a line under cursor                                                                                                    |
| SPC g h r    | Reset changed hunk under cursor - I like to check quickly what I have changed in that line and then just type 'u' to go back             |
| SPC g h s    | Stage hunk under cursor - Sometimes it's faster than selecting lines in Lazygit, so I can stage specific lines and then just do a commit |
| SPC g l c    | Quick check of previous commit in current buffer, <C-s> inside to switch preview                                                         |

### Working with Project:

| Key Bindings | Description                                                                                                                                                                                                                                                                             |
|--------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <C - e>      | Toggles nvim-tree file explorer                                                                                                                                                                                                                                                         |
| SPC p w      | Find word under cursor in project - very useful to find where component is used. Just use binding and type '<'. There is a lot of alternatives like lsp_references but I like it with telescope and to not find only references but whole text under cursor.                            |
| SPC p f      | Find file under cursor in project - it finds files in project which contains text under cursor. Useful when you name directories by component name in React and wants to go quickly to file. 'gd' is better but in some projects without TS or with mixed JS/TS it cannot work properly |
| SPC p t      | Finds TODOs/NOTES in project                                                                                                                                                                                                                                                            |
| SPC p l      | Switch between projects                                                                                                                                                                                                                                                                 |
| SPC p s      | Save session to load it later from Dashboard                                                                                                                                                                                                                                            |

### Commenting

| Key Bindings | Description                |
|--------------|----------------------------|
| gcc          | Create/remove comment      |
| gc (visual)  | Create/remove comment      |
| gcO          | Create comment line before |
| gco          | Create comment line after  |

### Table Mode / Alignment

| Key Bindings | Description                                                                       |
|--------------|-----------------------------------------------------------------------------------|
| ga (visual)  | Aligns selection based on separator (comma, semi-colon, colon etc.)               |
| SPC t m      | Enables Table Mode. Do it in markdown file with some table and you will see magic |
| SPC t i C    | (Only when Table Mode Enabled) Insert column before                               |
| SPC t i c    | (Only when Table Mode Enabled) Insert column after                                |
| SPC t d c    | (Only when Table Mode Enabled) Delete column                                      |
| SPC t d r    | (Only when Table Mode Enabled) Delete row                                         |
| SPC t s      | (Only when Table Mode Enabled) Sort table alphabetically                          |

### Other VERY useful bindings

| Key Bindings    | Description                                                                                                                                          |
|-----------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| <S - q>         | Smartly closes current buffer without breaking UI                                                                                                    |
| <C - a>         | It is not only increases number, but switches between true/false/const/let/function/arrow function/increment dates etc.                              |
| <C - n>         | Finds next occurence (like *) of word and puts multi-cursor there. Then you can go to Insert mode, Append, Change or Delete.                         |
| <C - o>         | Jumps to previous cursor in jumplist. I use it very often.                                                                                           |
| <C - i>         | Jumps to next cursor in jumplist.                                                                                                                    |
| <C - u>         | Uppercase word under cursor.                                                                                                                         |
| v <ENTER>       | Smartly selects next subjects of current treesitter context                                                                                          |
| za              | Toggle folds. By treesitter they are automatically added to TS/JS files in smart way                                                                 |
| zM              | Close all folds                                                                                                                                      |
| zR              | Open all folds                                                                                                                                       |
| gJ              | Smartly joins lines based on treesitter                                                                                                              |
| gS              | Smartly splits lines based on treesitter. I do if VERY often when I want to put import element to new lines (e.g. import { A, B, C, D, E } from ...) |
| < F2 > (visual) | Highlights selection to specific background color selected by :PainterPickColor 1-10.                                                                |
| < F3 >          | Jumps between highlights                                                                                                                             |
| < F4 >          | Erase highlighted line                                                                                                                               |
| < F12 >         | Opens/closes split terminal                                                                                                                          |


More coming soon...
Check out the which-key menu and keybindings.lua for most used maps.


## Performance

Measured on Manjaro Linux.

<details>

| Module                           | Total (ms) | Load time (ms) |
|----------------------------------|------------|----------------|
| nightfly.vim                     | 052.1      | 001.532        |
| fix_cursorhold_nvim.vim          | 064.55     | 000.054        |
| bufferline.vim                   | 069.33     | 004.682        |
| dashboard.vim                    | 069.67     | 000.201        |
| diffview.vim                     | 070.86     | 001.084        |
| emmet.vim                        | 072.67     | 001.705        |
| filetype.nvim                    | 072.80     | 000.020        |
| galaxyline.vim                   | 073.04     | 000.147        |
| glow.lua                         | 073.20     | 000.031        |
| indent_blankline.vim             | 073.82     | 000.519        |
| lightspeed.vim                   | 074.99     | 001.057        |
| trouble.vim                      | 075.18     | 000.082        |
| lspsaga.vim                      | 075.45     | 000.145        |
| colorizer.vim                    | 075.62     | 000.033        |
| nvim-gps.vim                     | 077.13     | 001.424        |
| nvim-lsp-installer.vim           | 077.33     | 000.093        |
| lspconfig.vim                    | 077.51     | 000.073        |
| toggleterm.vim                   | 077.66     | 000.035        |
| nvim-tree.lua                    | 077.84     | 000.061        |
| nvim-treesitter.vim              | 078.47     | 000.557        |
| rainbow.vim                      | 078.71     | 000.140        |
| nvim-web-devicons.vim            | 078.85     | 000.033        |
| ts_context_commentstring.vim     | 108.5      | 000.100        |
| nvim-treesitter-textobjects.vim  | 109.97     | 000.651        |
| nvim-treesitter-textsubjects.vim | 110.8      | 000.218        |
| packer.nvim                      | 111.0      | 032.088        |
| plenary.vim                      | 111.1      | 000.044        |
| splitjoin.vim                    | 113.4      | 002.174        |
| switch.vim                       | 113.8      | 000.297        |
| telescope.vim                    | 114.1      | 000.134        |
| todo-comments.nvim               | 114.310    | 000.028        |
| codepainter.vim                  | 114.724    | 000.297        |
| easy_align.vim                   | 114.966    | 000.146        |
| vimsnippets.vim                  | 115.144    | 000.031        |
| speeddating.vim                  | 115.715    | 000.483        |
| surround.vim                     | 116.206    | 000.378        |
| table-mode.vim                   | 116.954    | 000.636        |
| visual-multi.vim                 | 119.744    | 002.680        |
| cmp_nvim_ultisnips.lua           | 121.151    | 000.920        |
| which-key.nvim                   | 126.094    | 000.021        |
| dashboard.vim                    | 151.122    | 000.483        |

</details>

Ecovim started in 177.538ms

## Todo

| Description                                  | Progress                                                           |
|----------------------------------------------|--------------------------------------------------------------------|
| Create shell installer for Linux & macOS     | ![80%](https://progress-bar.dev/80/?title=progress)                |
| Support for nvim-dap debugger for React      | ![50%](https://progress-bar.dev/50/?title=progress)                |
| Find way to refactor words like in coc       | ![Planned](https://progress-bar.dev/0/?title=planned&color=b8860b) |
| List all plugins I use in README             | ![Planned](https://progress-bar.dev/0/?title=planned&color=b8860b) |
| Support ESLint & Prettier in Native LSP      | ![100%](https://progress-bar.dev/100/?title=done&color=555555)     |
| Replace coc-explorer with nvim-tree.lua      | ![100%](https://progress-bar.dev/100/?title=done&color=555555)     |
| Replace coc.nvim with Native LSP             | ![100%](https://progress-bar.dev/100/?title=done&color=555555)     |
| Change fzf.nvim to telescope.nvim            | ![100%](https://progress-bar.dev/100/?title=done&color=555555)     |
| Update statusline to support LSP diagnostics | ![100%](https://progress-bar.dev/100/?title=done&color=555555)     |
| Rewrite most config to lua                   | ![100%](https://progress-bar.dev/100/?title=done&color=555555)     |
| Support TailwindCSS with colors              | ![100%](https://progress-bar.dev/100/?title=done&color=555555)     |
| Provide current screenshots                  | ![100%](https://progress-bar.dev/100/?title=done&color=555555)     |

