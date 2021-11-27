# Ecovim: Ultimate React Neovim Config

[![Project Status: Active](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
![Stars](https://img.shields.io/github/stars/ecosse3/nvim?label=%E2%AD%90%20Stars)
![Follow](https://img.shields.io/github/followers/ecosse3?label=Please%20follow%20%20to%20support%20my%20work&style=social)

## Screenshots

![Dashboard](./screenshots/4-dashboard.png)
![Neovim](./screenshots/4-main.png)

## Configuration

To change Ecovim related config use the `config.lua` file.
To change vim settings use the `settings.lua` file.

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

