# Ecovim: Frontend Neovim Config

[![Last commit](https://img.shields.io/github/last-commit/ecosse3/nvim?style=for-the-badge)](https://github.com/ecosse3/nvim/commits/master)
![Stars](https://img.shields.io/github/stars/ecosse3/nvim?style=for-the-badge)
![License](https://img.shields.io/github/license/ecosse3/nvim?style=for-the-badge)
![Neovim Version](https://img.shields.io/badge/For%20Neovim-0.11+-yellowgreen?style=for-the-badge&logo=neovim&logoColor=d8abbb&color=d8abbb)

### A non-minimal Neovim config built to work most efficiently with Frontend Development.

## ✨ Features

<table>
<tr>
<td valign="top" width="33%">

### 🤖 AI & Assistance
- [Avante](https://github.com/yetone/avante.nvim) - Claude-powered coding agent
- [GitHub Copilot](https://github.com/features/copilot) - AI pair programmer
- [Copilot NES](https://github.com/github/copilot.vim) - Next Edit Suggestions
- [Opencode](https://github.com/sudo-tee/opencode.nvim) - OpenAI integration
- [MCPHub](https://github.com/ravitemer/mcphub.nvim) - Model Context Protocol

</td>
<td valign="top" width="33%">

### 🎨 UI & Experience
- [Tokyonight](https://github.com/folke/tokyonight.nvim) theme
- Custom [galaxyline](https://github.com/glepnir/galaxyline.nvim) statusline
- [Snacks.nvim](https://github.com/folke/snacks.nvim) - explorer, picker, notifications
- [tiny-glimmer](https://github.com/rachartier/tiny-glimmer.nvim) - highlight animations
- [tiny-inline-diagnostic](https://github.com/rachartier/tiny-inline-diagnostic.nvim) - enhanced diagnostics
- [todo-comments](https://github.com/folke/todo-comments.nvim) - TODO highlighting
- [which-key](https://github.com/folke/which-key.nvim) - keybinding helper

</td>
<td valign="top" width="33%">

### 💻 Frontend Development
- TypeScript, React, Next.js, Vue
- [TailwindCSS](https://tailwindcss.com/) with color highlighting
- [blink.cmp](https://github.com/Saghen/blink.cmp) - completion engine
- [boundary.nvim](https://github.com/Kenzo-Wada/boundary.nvim) - RSC `'use client'` markers
- NPM package info in package.json
- [Jest](https://github.com/facebook/jest) testing & coverage
- [treesj](https://github.com/Wansmer/treesj) - smart split/join lines

</td>
</tr>
<tr>
<td valign="top" width="33%">

### 🔧 DevOps & Tools
- Docker LSP support
- Terraform & HCL
- YAML language server
- [yazi.nvim](https://github.com/mikavilpas/yazi.nvim) - terminal file manager
- [harpoon](https://github.com/ThePrimeagen/harpoon) - quick file navigation
- [multicursor](https://github.com/jake-stewart/multicursor.nvim) - multi-cursor editing


</td>
<td valign="top" width="33%">

### 🔍 Code Quality
- Native LSP via [mason.nvim](https://github.com/williamboman/mason.nvim)
- [SchemaStore](https://github.com/b0o/SchemaStore.nvim) - 500+ JSON/YAML schemas
- [inc-rename](https://github.com/smjonas/inc-rename.nvim) - live-preview rename
- [symbol-usage](https://github.com/Wansmer/symbol-usage.nvim) - reference counts
- [grug-far](https://github.com/MagicDuck/grug-far.nvim) - search & replace
- [text-case](https://github.com/johmsalas/text-case.nvim) - case conversion
- [scissors](https://github.com/chrisgrieser/nvim-scissors) - snippet editing

</td>
<td valign="top" width="33%">

### 🌳 Git Integration
- [Lazygit](https://github.com/jesseduffield/lazygit) terminal UI
- [gitsigns](https://github.com/lewis6991/gitsigns.nvim) - inline diffs
- [diffview](https://github.com/sindrets/diffview.nvim) - diff viewer
- [octo.nvim](https://github.com/pwntester/octo.nvim) - GitHub PRs & issues
- Custom git blame
- Side blame panel

</td>
</tr>
</table>

### 📘 TypeScript & React Features

EcoVim ships with deep TypeScript and React/Next.js integration out of the box:

| Feature | Plugin | Description |
|---------|--------|-------------|
| **Type checking** | [tsc.nvim](https://github.com/dmmulroy/tsc.nvim) | Async project-wide `tsc --noEmit` with quickfix |
| **Error translation** | [ts-error-translator](https://github.com/dmmulroy/ts-error-translator.nvim) | Human-readable TypeScript errors |
| **RSC boundaries** | [boundary.nvim](https://github.com/Kenzo-Wada/boundary.nvim) | Visualize `'use client'` directive usage in Next.js |
| **Template strings** | [template-string](https://github.com/axelvc/template-string.nvim) | Auto-convert to template literals on `${}` |
| **Tailwind values** | [tw-values](https://github.com/MaximilianLloyd/tw-values.nvim) | Preview resolved Tailwind class values |
| **Tailwind fold** | [tailwind-fold](https://github.com/razak17/tailwind-fold.nvim) | Fold long Tailwind class strings |
| **Smart increment** | [dial.nvim](https://github.com/monaqa/dial.nvim) | Cycle true/false, const/let, increment dates |
| **Reference counts** | [symbol-usage](https://github.com/Wansmer/symbol-usage.nvim) | Show usage counts above functions/components |
| **Live rename** | [inc-rename](https://github.com/smjonas/inc-rename.nvim) | Preview LSP rename as you type |
| **JSON/YAML schemas** | [SchemaStore](https://github.com/b0o/SchemaStore.nvim) | Auto-schemas for tsconfig, package.json, etc. |

### 🚀 Performance
- **Startup time**: ~90ms (measured on M1 Mac)
- **Lazy loaded**: All plugins via [lazy.nvim](https://github.com/folke/lazy.nvim)

## Screenshots

Dashboard

![Dashboard](./.screenshots/6-alpha.png)

Overview

![Neovim](./.screenshots/5-main.png)

<details>
<summary>More screenshots</summary>

Some of screenshots can be old

TailwindCSS with nvim-cmp

![TailwindCSS](./.screenshots/5-tailwind.png)

Which Key Menu

![WhichKey](./.screenshots/4-which-key.png)

Lazygit

![Lazygit](./.screenshots/4-lazygit.png)

Git Side Blame

![Side Blame](./.screenshots/4-side-blame.png)
</details>

---

## ☕ Support

If you enjoy using EcoVim and would like to support its development:

[![GitHub Sponsors](https://img.shields.io/badge/GitHub%20Sponsors-Sponsor%20me-ea4aaa?style=for-the-badge&logo=github)](https://github.com/sponsors/ecosse3)

Your support helps maintain and improve EcoVim. Thank you! 🙏

## Installation

**Just clone GitHub repo into ~/.config/nvim.**

**Prerequisities**

- Make sure you have installed the latest version of Neovim v0.11+ (nightly is preferred).
- Have wget, curl, unzip, git, make, pip, python, npm, node, luarocks, fd, ripgrep and cargo installed on your system. You can check if you are missing anything with `:checkhealth` command.
- Have any nerd font installed. *Fira Code* has been used in screenshots. You can download it from [nerdfonts.com](https://www.nerdfonts.com/font-downloads).

**After install configuration:**

1. Selected treesitter Languages are installed by default.
To check it run `:TSInstallInfo`.
Make sure to run `:TSInstall <lang>` for specific language you want to install.
2. LSP servers are enabled by default. You can check installed LSP servers by `:Mason` command.

## Configuration

All customization is done in `lua/config/user.lua`. This file is **gitignored** and won't cause merge conflicts when updating!

### Quick Start

```bash
# Copy the example file
cp lua/config/user.lua.example lua/config/user.lua

# Edit your personal config
nvim lua/config/user.lua
```

### Quick Customization Examples

```lua
-- lua/config/user.lua

-- Change colorscheme
EcoVim.colorscheme = "tokyonight-storm"

-- Add custom LSP servers
EcoVim.lsp.ensure_installed = { "rust_analyzer", "gopls" }

-- Override formatters
EcoVim.formatters = {
  javascript = { "prettierd" },
  typescript = { "prettierd" },
}

-- Disable default keymaps
EcoVim.keys.s = false  -- Disable flash.nvim 's' key

-- Add custom autocmds
EcoVim.autocmds.auto_save = {
  event = "FocusLost",
  pattern = "*",
  command = "silent! wa",
}

-- Override any plugin config
EcoVim.plugin_overrides.snacks = function(opts)
  opts.picker.layout = "vertical"
  return opts
end

-- Custom vim options
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
```

### Full Configuration Options

| Option | Type | Description |
|--------|------|-------------|
| `colorscheme` | string | Theme name (default: "tokyonight-night") |
| `ui.font` | table | GUI font settings |
| `ui.float.border` | string | Border style: "rounded", "single", "double" |
| `plugins.ai.*.enabled` | boolean | Enable/disable AI plugins |
| `lsp.ensure_installed` | table | Additional LSP servers to install |
| `lsp.exclude` | table | LSP servers to not auto-enable |
| `lsp.servers` | table | Custom LSP server configurations |
| `formatters` | table | Override formatters per filetype |
| `linters` | table | Override linters per filetype |
| `keys` | table | Disable default keymaps: `keys.s = false` |
| `autocmds` | table | Add custom autocmds |
| `plugin_overrides` | table | Override any plugin configuration |

### Updating EcoVim

Since your config is in `user.lua` (gitignored), you can safely update:

```bash
cd ~/.config/nvim
git pull
```

No merge conflicts with your personal settings!

### For vim settings and new plugins

- Edit `config/options.lua` for vim options
- Create files in `lua/plugins/` for new plugins

## Keybindings

Currently I have no idea how to write for you my whole workflow of using Ecovim config in React.js projects I am working on,\
but I can write you the most useful custom key bindings by the frequency I use them.

Space (SPC) is my Leader key.

<details>
<summary>File Explorer</summary>

### File Explorer

| Key Bindings | Description                                   |
|--------------|-----------------------------------------------|
| <C - e>      | Open File Explorer                            |
| Backspace    | Back to file explorer (in editor normal mode) |
| g?           | Open commands menu                            |
| a            | Create new file/directory                     |
| x            | Cut                                           |
| c            | Copy                                          |
| y            | Copy name                                     |
| r            | Rename                                        |
| I            | Toggle git ignore files                       |

</details>

<details>
<summary>Searching</summary>

### Searching

| Key Bindings | Description         |
|--------------|---------------------|
| <C - p>      | Neural Open (AI-powered file finder) |
| <S - p>      | Live grep (Snacks picker) |
| s            | Flash.nvim jump to any word  |
| SPC s d      | Search dotfiles     |
| SPC s h      | Search file history |
| SPC s s      | Search history      |

</details>

<details>
<summary>Working with LSP</summary>

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

</details>

<details>
<summary>Working with Git</summary>

### Working with Git:

| Key Bindings | Description                                                                                                                              |
|--------------|------------------------------------------------------------------------------------------------------------------------------------------|
| SPC g g      | Lazygit - for committing and branch change                                                                                               |
| SPC g s      | Git status (Snacks picker) - when I want to change/search file I am working on with git changes                                                    |
| ]c           | Go to next change hunk                                                                                                                   |
| [c           | Go to prev change hunk                                                                                                                   |
| SPC g d      | Advanced powerful diff view with many filters for debugging code, checking previous changes etc.                                         |
| SPC g m      | View hunk diff of a line under cursor                                                                                                    |
| SPC g h r    | Reset changed hunk under cursor - I like to check quickly what I have changed in that line and then just type 'u' to go back             |
| SPC g h s    | Stage hunk under cursor - Sometimes it's faster than selecting lines in Lazygit, so I can stage specific lines and then just do a commit |
| SPC g l c    | Quick check of previous commit in current buffer, <C-s> inside to switch preview                                                         |

</details>

<details>
<summary>Working with Project</summary>

### Working with Project:

| Key Bindings | Description                                                                                                                                                                                                                                                                             |
|--------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <C - e>      | Toggles Snacks file explorer                                                                                                                                                                                                                                                         |
| SPC p w      | Find word under cursor in project - very useful to find where component is used. Just use binding and type '<'. There is a lot of alternatives like LSP references but I like it with Snacks picker and to not find only references but whole text under cursor.                            |
| SPC p f      | Find file under cursor in project - it finds files in project which contains text under cursor. Useful when you name directories by component name in React and wants to go quickly to file. 'gd' is better but in some projects without TS or with mixed JS/TS it cannot work properly |
| SPC p l      | Switch between projects (Snacks picker)                                                                                                                                                                                                         |
| SPC p t      | Finds TODOs/NOTES in project                                                                                                                                                                                                                                                            |
| SPC p s      | Save session to load it later from Dashboard                                                                                                                                                                                                                                            |

</details>

<details>
<summary>Commenting</summary>

### Commenting

| Key Bindings | Description                |
|--------------|----------------------------|
| gcc          | Create/remove comment      |
| gc (visual)  | Create/remove comment      |
| gcO          | Create comment line before |
| gco          | Create comment line after  |

</details>

<details>
<summary>Table Mode / Alignment</summary>

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

</details>

<details>
<summary>Other</summary>

### Other VERY useful bindings

| Key Bindings | Description                                                                                                                                                                               |
|--------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <S - q>      | Smartly closes current buffer without breaking UI                                                                                                                                         |
| <D - s>      | Save file (macOS Cmd+S) |
| <D - q> / <D - w> | Close buffer (macOS Cmd+Q/W) |
| <D - d> / <D - u> | Half-page scroll down/up (macOS Cmd+D/U) |
| <D - i>      | Jump forward in jumplist (macOS Cmd+I) |
| <C - a>      | It is not only increases number, but switches between true/false/const/let/function/arrow function/increment dates etc.                                                                   |
| <C - n>      | Finds next occurrence (like *) of word and puts multi-cursor there. Then you can go to Insert mode, Append, Change or Delete. [Read more](https://github.com/mg979/vim-visual-multi/wiki) |
| <C - o>      | Jumps to previous cursor in jumplist. I use it very often.                                                                                                                                |
| v <ENTER>    | Smartly selects next subjects of current treesitter context                                                                                                                               |
| s            | Standalone jump to any word with `folke/flash.nvim`                                                                                                                                       |
| ciq          | Change inside ANY quotes (`` or '' or "" etc.) with `mini.ai`                                                                                                                             |
| cib          | Change inside ANY brackets ({} or [] or () etc.) with `mini.ai`                                                                                                                           |
| za           | Toggle folds. By LSP and nvim-ufo they are automatically added to supported files in smart way.                                                                                           |
| zM           | Close all folds                                                                                                                                                                           |
| zR           | Open all folds                                                                                                                                                                            |
| zr           | Open all folds except imports/comments                                                                                                                                                    |
| gJ           | Smartly joins lines based on treesitter                                                                                                                                                   |
| gS           | Smartly splits lines based on treesitter. I do if VERY often when I want to put import element to new lines (e.g. import { A, B, C, D, E } from ...)                                      |
| < F12 >      | Opens/closes terminal                                                                                                                                                                     |
| ~            | Switch function arguments smartly                                                                                                                                                         |

</details>

Check out the which-key menu and [keymappings.lua](https://github.com/ecosse3/nvim/blob/master/lua/config/keymappings.lua) for most used maps. 


## Performance

Measured on M1.

Ecovim started in 91.13ms 

<details>
<summary>Done</summary>

| Description                                     | Progress                                                       |
|-------------------------------------------------|----------------------------------------------------------------|
| lazy.nvim instead of packer                     | ![100%](https://progress-bar.dev/100/?title=done&color=555555) |
| Better support for null-ls and local formatting | ![100%](https://progress-bar.dev/100/?title=done&color=555555) |
| Better support to project word refactor         | ![100%](https://progress-bar.dev/100/?title=done&color=555555) |
| Support for nvim-dap debugger for React         | ![100%](https://progress-bar.dev/100/?title=done&color=555555) |
| Support ESLint & Prettier in Native LSP         | ![100%](https://progress-bar.dev/100/?title=done&color=555555) |
| Replace coc.nvim with Native LSP                | ![100%](https://progress-bar.dev/100/?title=done&color=555555) |
| Replace telescope.nvim with snacks.nvim picker  | ![100%](https://progress-bar.dev/100/?title=done&color=555555) |
| Replace nvim-tree with snacks.nvim explorer     | ![100%](https://progress-bar.dev/100/?title=done&color=555555) |
| Update statusline to support LSP diagnostics    | ![100%](https://progress-bar.dev/100/?title=done&color=555555) |
| Rewrite most config to lua                      | ![100%](https://progress-bar.dev/100/?title=done&color=555555) |
| Support TailwindCSS with colors                 | ![100%](https://progress-bar.dev/100/?title=done&color=555555) |
| Provide current screenshots                     | ![100%](https://progress-bar.dev/100/?title=done&color=555555) |
| Create shell installer for Linux & MacOS        | ![100%](https://progress-bar.dev/100/?title=done&color=555555) |
| Better LSP configuration via EcoVim.lsp         | ![100%](https://progress-bar.dev/100/?title=done&color=555555) |
| Custom formatters/linters via EcoVim config     | ![100%](https://progress-bar.dev/100/?title=done&color=555555) |
| Plugin/keymap customization via EcoVim config   | ![100%](https://progress-bar.dev/100/?title=done&color=555555) |

</details>
