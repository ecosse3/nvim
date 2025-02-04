# Changelog

All notable changes to this project will be documented in this file. See [standard-version](https://github.com/conventional-changelog/standard-version) for commit guidelines.

## [4.2.0](https://github.com/ecosse3/nvim/compare/v4.1.1...v4.2.0) (2025-02-04)


### Features

* **cmp:** change blink copilot provider & enable ghost text ([3dc8c98](https://github.com/ecosse3/nvim/commit/3dc8c988ce0ab1e8429b7c4aed83d0c3cf2b367b))
* **keymappings:** adjust font size keymap ([dc7a3b0](https://github.com/ecosse3/nvim/commit/dc7a3b0afec92aa7f30e9f8cc7ea76d8a084580c))
* **options:** update vert fill char ([82f071f](https://github.com/ecosse3/nvim/commit/82f071fd04bc665a454c1532cf151547d18f5020))
* **picker:** replace telescope.nvim with Snacks Picker ([74c9866](https://github.com/ecosse3/nvim/commit/74c9866759dd840fcf622ac9adf2333de536f138))
* **plugins:** add treesitter context indent plugin ([c23fd2b](https://github.com/ecosse3/nvim/commit/c23fd2be90358e78ea4b04ffbf4fd7d22da99401))
* **plugins:** enable Snacks Bigfile ([46a07f6](https://github.com/ecosse3/nvim/commit/46a07f66cd7b9a1b623ecae3f7e40c67eabdbe0d))
* **plugins:** enable Snacks Statuscolumn ([a2c293a](https://github.com/ecosse3/nvim/commit/a2c293a7df4bdd0b78b28bdefccbbbfa02369d2c))
* **plugins:** replace dressing.nvim with Snacks Input ([0a4c46e](https://github.com/ecosse3/nvim/commit/0a4c46e86c8002a169ddecf83ea8079cc7efd060))
* **plugins:** replace mini.bufremove with Snacks BufDelete ([052b468](https://github.com/ecosse3/nvim/commit/052b4685ce9ce84df71bba44ed6cbcddae5d6ea3))
* **plugins:** replace notify plugin with Snacks Notifier ([dffe40a](https://github.com/ecosse3/nvim/commit/dffe40a3f6e861134d085512ebf28804e1d1d617))
* **plugins:** replace Nvim Tree with Snacks Explorer & adjust color scheme ([686b596](https://github.com/ecosse3/nvim/commit/686b5967cec615a17fa53949e00ef78c0bd29118))


### Bug Fixes

* **formatting:** typo in prettierd formatter ([35d89b7](https://github.com/ecosse3/nvim/commit/35d89b7bc8ea8456d089960051570eddbe9b3bac)), closes [#186](https://github.com/ecosse3/nvim/issues/186)

### [4.1.1](https://github.com/ecosse3/nvim/compare/v4.1.0...v4.1.1) (2025-01-15)


### Bug Fixes

* **lsp:** properly initialize typescript-tools ([ec14639](https://github.com/ecosse3/nvim/commit/ec14639b92d36d6655ee443395c051257b95b4ec))

## [4.1.0](https://github.com/ecosse3/nvim/compare/v4.0.0...v4.1.0) (2025-01-15)


### Features

> [!IMPORTANT]
> Big changes:

* **plugins:** replace nvim-cmp with blink.cmp ([01edcd0](https://github.com/ecosse3/nvim/commit/01edcd0784fbbed868a3ba9efbfde244670cbcec))
* **plugins:** add codecompanion.lua AI plugin ([47e7efe](https://github.com/ecosse3/nvim/commit/47e7efe689121e912f35923da95aa444213dbd39))
* **lsp:** migrate to typescript-tools from native LSP ts_ls ([eb55f0e](https://github.com/ecosse3/nvim/commit/eb55f0e2f18506e982f0c9acfe573ff66da94dc7))

* add new icons for breakpoints and stopped states ([a94aa97](https://github.com/ecosse3/nvim/commit/a94aa97b748a09e799335bd1df78b77c6d2c832b))
* **colorscheme:** add custom styling for the Pmenu component ([e0cd9c5](https://github.com/ecosse3/nvim/commit/e0cd9c551f77ed1561459365a6b02d81cea1136d))
* **debugging:** add Next.js debug configuration for server-side debugging & monorepo support ([885db0f](https://github.com/ecosse3/nvim/commit/885db0fe00b193bd75df58a3fc3ce5ea852c780b))
* enhance markdown file type support in render markdown plugin ([e0a3598](https://github.com/ecosse3/nvim/commit/e0a359870ab3faab84cba89297d5f059c41c62c1))
* **git:** change backgrounds of incoming Git Conflict styles ([c818a35](https://github.com/ecosse3/nvim/commit/c818a35f2dd119f40910b9ac4007800bc1bc4d2e))
* **lsp:** enable inlay hints for Lua ([035e9a4](https://github.com/ecosse3/nvim/commit/035e9a42eea018e21dccd995ecf7bcbcfc526a3c))
* **lsp:** speed up ([36dfeab](https://github.com/ecosse3/nvim/commit/36dfeab3f5c010641a62a701f5637236cba7449c))
* **plugins:** add Avante AI plugin (disabled by default) ([5cef9f0](https://github.com/ecosse3/nvim/commit/5cef9f0787221d64ca259521886dde20557d7883))
* **plugins:** add harpoon plugin ([65b788d](https://github.com/ecosse3/nvim/commit/65b788dc1ee06927c5faafc651c2e7e74d01c975))
* **plugins:** add nvim-sops plugin ([4c08c2e](https://github.com/ecosse3/nvim/commit/4c08c2ed441d529262f10cb90be294bf1431da62))
* **plugins:** add xml formatting support ([c075617](https://github.com/ecosse3/nvim/commit/c075617550b6468c47cdf7950c8ffc5d97c4cfeb))
* **plugins:** enable codecompanion by default and add it to EcoVim configuration switches ([a7b7080](https://github.com/ecosse3/nvim/commit/a7b7080b89295bc51e402625c139252f1f86be44))
* **plugins:** enable lazy loading for neotest plugin ([017131c](https://github.com/ecosse3/nvim/commit/017131c7a85fc164555b2e33b86e8eeded4c9b37))
* **plugins:** implement sorting options for telescope buffer search & add buffer deletion shortcut ([b17b682](https://github.com/ecosse3/nvim/commit/b17b682bb990aa578e4c68412cbe07106f74de62))
* **plugins:** introduce snacks plugin with lazygit integration ([4670872](https://github.com/ecosse3/nvim/commit/46708726b0677b181acb002aa9c18102d4f4135c))
* **plugins:** lazy load neotest only for specific test filetypes ([82b5c27](https://github.com/ecosse3/nvim/commit/82b5c27a11f933a5b5289272faf8f32e2f7e9716))
* **plugins:** remove old zen mode plugin and use Zen snacks with zoom support ([7a1b289](https://github.com/ecosse3/nvim/commit/7a1b289530db27acb5d3edeeee36f527b94d1642))
* **plugins:** rename bqf-init.lua to bqf.lua for clarity & add fzf-lua as dependency ([e292399](https://github.com/ecosse3/nvim/commit/e292399777531d660b585def526db52a78d2d607))
* **plugins:** update layout configuration in telescope to vertical for better preview handling ([2831c5e](https://github.com/ecosse3/nvim/commit/2831c5e024dd3ed1d7f9ec257b76179c66e15ba4))


### Bug Fixes

* **dap:** fix javascript/typescript debugging without dap-vscode-js ([5c1e7e5](https://github.com/ecosse3/nvim/commit/5c1e7e53366db343b7d1519d67210e9d28aace1e))
* **plugins:** configuration of multicursors ([c624197](https://github.com/ecosse3/nvim/commit/c6241972b36068f995bacdfda6f4240c8b1779b3))
* **plugins:** working autopairs with blink.cmp ([e2db8ae](https://github.com/ecosse3/nvim/commit/e2db8ae87203ea4135b6b709e20c292d05088eea))
* **plugins:** working blink autocompletion ([fff56d0](https://github.com/ecosse3/nvim/commit/fff56d03ac98d6e1bf46c3b7e4bad25e4002019e))


### Refactors

* change git_files to find_files for improved functionality in Ecovim Dotfiles picker ([342f4eb](https://github.com/ecosse3/nvim/commit/342f4ebcd6b973b8b3f00b561cee47adb39bcc66))
* **keymappings:** consolidate dap keymaps ([68d12a2](https://github.com/ecosse3/nvim/commit/68d12a2236099354b04f096962cb7eee434528bd))
* reorganize LSP configuration loading ([0c3ba7f](https://github.com/ecosse3/nvim/commit/0c3ba7f3cf17a014e1a274855aa9b7779683b2b1))
* streamline project key bindings ([0135eab](https://github.com/ecosse3/nvim/commit/0135eab40cd02d8fe5c33aa161ac17ec252c45c2))
* update quickfix key mappings to use <Leader> prefix ([a0ddf84](https://github.com/ecosse3/nvim/commit/a0ddf84a7f7bb5191067658bc9ddafa4d1a9701a))

## [4.0.0](https://github.com/ecosse3/nvim/compare/v3.9.0...v4.0.0) (2024-09-06)


### ⚠ BREAKING CHANGES

#### This version contains breaking changes in the way how files are structured and how plugins are loaded. The `lua/config/plugins.lua` file with all plugins is deprecated and each plugin is managed separately via file inside `plugins` directory.

* **lsp:** integrate vtsls for TypeScript language support
* **plugins:** new external blame setup
* **plugins:** add new ultimate-autopairs configuration
* **plugins:** setup for package-info.nvim
* **plugins:** printer setup
* **plugins:** refactoring plugin configuration
* **plugins:** scissors plugin configuration
* **plugins:** session manager configuration and key mappings
* **plugins:** setup for Alpha.nvim dashboard plugin
* **plugins:** spectre plugin with refactor key mappings
* **plugins:** spider.lua plugin configuration
* **plugins:** add stay-in-place plugin configuration
* **plugins:** remove custom telescope pickers and git functions
* **plugins:** new configuration for todo-comments plugin
* **plugins:** new NvimTree key bindings and configuration
* **plugins:** add treesj plugin configuration
* **plugins:** update trouble plugin configuration
* **plugins:** Zen Mode setup with custom configurations
* **plugins:** deprecate plugins.lua file and manage plugins by separate file inside plugins directory

### Features

* add buffer search picker to Telescope plugin ([a99b13d](https://github.com/ecosse3/nvim/commit/a99b13d54768dc0fcda5caf543e6b3acd998cf41))
* add initial implementation of codesnap.nvim plugin ([d8ad99e](https://github.com/ecosse3/nvim/commit/d8ad99e0caaad983ee89d4f14032fcaa37ea632d))
* **autocmds:** attach jest commands to *spec.ts/tsx files ([89709b6](https://github.com/ecosse3/nvim/commit/89709b6c531258d63b883f04d6f90fcd1f836dda))
* include markdown as a recognized file type for rendering ([c3cfd04](https://github.com/ecosse3/nvim/commit/c3cfd042848577f287f069e03a9856e9438f60cc))
* **lsp:** integrate vtsls for TypeScript language support ([e48d4da](https://github.com/ecosse3/nvim/commit/e48d4da6346e5d07d37afa983fdce447e704096a))
* **neovide:** add Neovide specific configurations and keymaps ([fa69013](https://github.com/ecosse3/nvim/commit/fa690138a0510083ad2c0db5fa28ae4cf9e7c0f0))
* **neovide:** adjust transparency settings for Neovide compatibility ([f683a3a](https://github.com/ecosse3/nvim/commit/f683a3a9f828a015e0682b09ad1265dec6346874))
* **plugins:** add fidget.nvim plugin for enhanced UI feedback ([b44584c](https://github.com/ecosse3/nvim/commit/b44584c3cd7d38e405eaf9e1929e01d69227b91e))
* **plugins:** add markdown-preview plugin configuration ([c57a840](https://github.com/ecosse3/nvim/commit/c57a840081f0de179b4c9df673062fd6267a7142))
* **plugins:** add marks.nvim plugin with BufEnter event trigger ([5883e87](https://github.com/ecosse3/nvim/commit/5883e872f2c78ab3f87727dd73986f8cca10bed6))
* **plugins:** add new smart-splits plugin configuration ([9835bbf](https://github.com/ecosse3/nvim/commit/9835bbfc3804f17d4456d981d37acb9f6f1e72ca))
* **plugins:** add new tabout.lua plugin ([bc26910](https://github.com/ecosse3/nvim/commit/bc2691016f4e00e5407c95222df7bf3b48e2c8c5))
* **plugins:** add new ultimate-autopairs configuration ([619c25d](https://github.com/ecosse3/nvim/commit/619c25dae3b2ddb338878c5c7c4f5cdd1a292791))
* **plugins:** add nvim-bqf ([7f1e1d3](https://github.com/ecosse3/nvim/commit/7f1e1d3b14035a2f3e89c090b4c669ad613d0e94))
* **plugins:** add text-case plugin for text manipulation ([1be6651](https://github.com/ecosse3/nvim/commit/1be665100d99c039761bf70e5440e7fb5e1b37f4))
* **plugins:** add treesitter configuration for auto closing tags ([0a69a4f](https://github.com/ecosse3/nvim/commit/0a69a4f21a9853149fa38131b290627a230aca27))
* **plugins:** add ufo utils handler and update config handler ([6a3bc6e](https://github.com/ecosse3/nvim/commit/6a3bc6e62368218f16dacdc9c0e9e9de3196d75d))
* **plugins:** add vim-table-mode plugin for markdown files ([bb53b1a](https://github.com/ecosse3/nvim/commit/bb53b1a24ebd081ce17d2d06add8f2772946a64f))
* **plugins:** create base plugins initialization file with general plugins & subdirectories config ([5753e43](https://github.com/ecosse3/nvim/commit/5753e438f94f4b41a86a50e0c8db63ccc9dd4128))
* **plugins:** integrate echasnovski mini.align and mini.ai plugins ([729cbac](https://github.com/ecosse3/nvim/commit/729cbacde58e5f23a4d51c181cc86d3e9a2cbcfb))
* **plugins:** integrate new markdown rendering plugin with dependencies ([9a1f758](https://github.com/ecosse3/nvim/commit/9a1f758ffd5a51d859c987de0229a3f0db5b28b4))
* **plugins:** new external blame setup ([10bcb31](https://github.com/ecosse3/nvim/commit/10bcb310a3a5a44367f882ee4c7c359c5317f8e2))
* **plugins:** remove custom documentcolors and replace colorizer with nvim-highlight-colors plugin ([5d411e3](https://github.com/ecosse3/nvim/commit/5d411e3d77b903598d429067cb79842caf48165d))
* **plugins:** replace null-ls with conform & nvim-lint ([8c60d74](https://github.com/ecosse3/nvim/commit/8c60d74244cce10a6f7b0c234de51f633f2154b8))
* **plugins:** setup codeium and copilot AI integrations ([ab63e37](https://github.com/ecosse3/nvim/commit/ab63e37dc0a71089c68856b1c1bd28f79eb0a933))
* **plugins:** update copilot chat to canary version ([c2a2b6f](https://github.com/ecosse3/nvim/commit/c2a2b6f0d56eea22e2d0796d14766bbee3a4c9eb))
* **plugins:** update noice config ([91d25cf](https://github.com/ecosse3/nvim/commit/91d25cf143b410632c303c2c78ec703c0e34c513))
* **plugins:** update nvim notify plugin ([892650e](https://github.com/ecosse3/nvim/commit/892650e311ca18a1ae8578b4a99a9796f9108253))
* **queries:** extend jsx element for typescriptreact queries ([e8ba48e](https://github.com/ecosse3/nvim/commit/e8ba48efc2899f43ef5538130dfe24d77af671aa))
* **utils:** add is_plugin_loaded function for lazy loading plugins ([072aa2d](https://github.com/ecosse3/nvim/commit/072aa2dde6cfd8c14a0896cb3335307861979be7))
* **utils:** add utility functions for table manipulation ([615a01c](https://github.com/ecosse3/nvim/commit/615a01c5af00b88d90a8b8dcf51186f2ab0be21e))


### Bug Fixes

* **colorscheme:** correct 'none' values in highlight definitions ([b364497](https://github.com/ecosse3/nvim/commit/b364497bb7de0105b0eee036f4c55d5ee14f0a5e))
* **functions:** format on save ([830e804](https://github.com/ecosse3/nvim/commit/830e804b95a558929a97e638c4c7f7ae4bf6e0cf))
* **which-key:** wk.add function to registering keymaps in which-key ([5632309](https://github.com/ecosse3/nvim/commit/56323097ba3c6e1487939aa063e4ae8479bbe0b7))


### Refactors

* **colorscheme:** configure 'FiraCode Nerd Font' and 'tokyonight-night' colorscheme ([4ac3eb4](https://github.com/ecosse3/nvim/commit/4ac3eb4658d0e506ada56b9f05c5c56c6f3d1f58))
* consolidate and simplify which-key mappings ([1e0974e](https://github.com/ecosse3/nvim/commit/1e0974e2ed6b2814d5fef58be154d7369601fea8))
* **dap:** reorganize DAP setup for modular configuration ([e795b60](https://github.com/ecosse3/nvim/commit/e795b6092eb893127e9ccd2c10782d627ce62820))
* **keymappings:** change local leader map from ; to , (comma) ([c9d6ab2](https://github.com/ecosse3/nvim/commit/c9d6ab2c21b491a37a0a0bd5e01e402cd9ec7d03))
* **lsp:** enable inlay hints & virtual text by default ([8e43c71](https://github.com/ecosse3/nvim/commit/8e43c71a782254b12cf0cd24c7fae53ea00380c5))
* **lsp:** lsp plugins ([dbaa3b6](https://github.com/ecosse3/nvim/commit/dbaa3b662d656b643dba52fb20521901b235a434))
* **plugins:** add flash.nvim with lazy loading in separate file ([3be5836](https://github.com/ecosse3/nvim/commit/3be5836a1e4758032987bca31e29ca6a917ae7c0))
* **plugins:** add keymaps and setup for toggleterm plugin ([e1d374f](https://github.com/ecosse3/nvim/commit/e1d374fd099eebf939aa2dda9503e60236cd1133))
* **plugins:** add setup.lua for which-key plugin ([e60a2fd](https://github.com/ecosse3/nvim/commit/e60a2fdd04f8d98b639601a3721361a352e25ede))
* **plugins:** add stay-in-place plugin configuration ([ffd8df6](https://github.com/ecosse3/nvim/commit/ffd8df6a159d9e47989774320e3fd53b45320f31))
* **plugins:** add treesj plugin configuration ([30c4731](https://github.com/ecosse3/nvim/commit/30c4731602b5b3757be1aefe1b5aea4b35d97194))
* **plugins:** change barbar to bufferline ([450891d](https://github.com/ecosse3/nvim/commit/450891d5727055ef054a4e723ff1b08633d79058))
* **plugins:** clean up unused cinnamon plugin setup ([0c33c86](https://github.com/ecosse3/nvim/commit/0c33c8696ee109cbd5149c2a29cb0c52250ebe27))
* **plugins:** deprecate plugins.lua file and manage plugins by separate file inside plugins directory ([d28830a](https://github.com/ecosse3/nvim/commit/d28830a356e4992d9ef0d2db448b8d0ac4b7cdbc))
* **plugins:** general testing plugins file ([380264a](https://github.com/ecosse3/nvim/commit/380264a2f7bef3ef80540ff4682af47f37b48495))
* **plugins:** move git plugins configuration to a single file ([65b843c](https://github.com/ecosse3/nvim/commit/65b843c935ff2be1496340714d6ddd63e3c61318))
* **plugins:** move multicursor functionality with smoka7/multicursors.nvim plugin ([2cc4567](https://github.com/ecosse3/nvim/commit/2cc4567c697570b0602c7a79e4ba14ceb0c9a0d7))
* **plugins:** navic & winbar ([7dff7f3](https://github.com/ecosse3/nvim/commit/7dff7f329445a216405e0a63a02ccb616dda9077))
* **plugins:** new configuration for todo-comments plugin ([8469d63](https://github.com/ecosse3/nvim/commit/8469d631afd79d203e44df6c51162e4bc4870225))
* **plugins:** new NvimTree key bindings and configuration ([9aea1c8](https://github.com/ecosse3/nvim/commit/9aea1c8fe507abcb0b2b4a1f2d378cb3d8a45cdd))
* **plugins:** printer setup ([48c7e22](https://github.com/ecosse3/nvim/commit/48c7e22cbe6325065cc51ce6841b73e44e220d73))
* **plugins:** refactoring plugin configuration ([1aae97f](https://github.com/ecosse3/nvim/commit/1aae97f8c88bbd7900edcf18cd49fb354abc980e))
* **plugins:** remove custom telescope pickers and git functions ([7cff815](https://github.com/ecosse3/nvim/commit/7cff8159a68f25cac9da664ce3579b06b1a692ce))
* **plugins:** remove gps plugin configuration ([c57d794](https://github.com/ecosse3/nvim/commit/c57d794aa8292cc73b68f0f4546972254140c006))
* **plugins:** require numb.nvim in separate file ([ed3bd2f](https://github.com/ecosse3/nvim/commit/ed3bd2ffee35e6e2c6fae3d4fc74520d17ed937b))
* **plugins:** require nvim-web-devicons in separate file ([1503e34](https://github.com/ecosse3/nvim/commit/1503e34baa3a730afaa021a4e183118e820da74f))
* **plugins:** restructure and enhance indentation plugin configuration ([44350b0](https://github.com/ecosse3/nvim/commit/44350b0740910c1d0d2b034d74a38aef262fa332))
* **plugins:** scissors plugin configuration ([c6817b6](https://github.com/ecosse3/nvim/commit/c6817b6f169bdcaaded80866f21f83ffb4da75d3))
* **plugins:** session manager configuration and key mappings ([88dc9d7](https://github.com/ecosse3/nvim/commit/88dc9d7ceae75ddc77691edf98e307f905c950aa))
* **plugins:** setup for Alpha.nvim dashboard plugin ([a731f11](https://github.com/ecosse3/nvim/commit/a731f113978624eb5b0512819944df39e1f34b3d))
* **plugins:** setup for package-info.nvim ([dbf2d29](https://github.com/ecosse3/nvim/commit/dbf2d2924d3702510da401dc5e041b55fcf1a976))
* **plugins:** simplify trouble.nvim configuration ([d898ef8](https://github.com/ecosse3/nvim/commit/d898ef80e3d8758ebda6438da870a0f06d56685e))
* **plugins:** spectre plugin with refactor key mappings ([5d7ab3e](https://github.com/ecosse3/nvim/commit/5d7ab3e358e02702ff54e131408692c4ed53be01))
* **plugins:** spider.lua plugin configuration ([8e84f5f](https://github.com/ecosse3/nvim/commit/8e84f5fe73738217e46dc1b3ce3b5b79978ccfab))
* **plugins:** streamline cmp and luasnip configuration ([b246919](https://github.com/ecosse3/nvim/commit/b2469199dd27bf0e25a26913e7bad3e4f818ac1a))
* **plugins:** update trouble plugin configuration ([d0a44d3](https://github.com/ecosse3/nvim/commit/d0a44d3411a447f24d1d1003d235f7af4f1868b0))
* **plugins:** Zen Mode setup with custom configurations ([d4d7e0b](https://github.com/ecosse3/nvim/commit/d4d7e0bb1dd52e1bc3e3ec32b71038ed85597062))

## [3.9.0](https://github.com/ecosse3/nvim/compare/v3.8.0...v3.9.0) (2024-02-25)


### ⚠ BREAKING CHANGES

* **lsp:** move lsp configs inside config directory

### Features

* **cmp:** boost copilot priority ([6da4b80](https://github.com/ecosse3/nvim/commit/6da4b80aa53c693ea20a19d9c40058db4ce91167))
* **config:** disable ChatGPT by default ([d58d5d2](https://github.com/ecosse3/nvim/commit/d58d5d2957c2fbf50105a0f6548666611922afb4))
* **dap:** improve config ([a97a93b](https://github.com/ecosse3/nvim/commit/a97a93b3d82fa8c0637704f4287a644fb45d2a86))
* **formatting:** add conform.nvim & nvim-lint for linting & formatting ([325074d](https://github.com/ecosse3/nvim/commit/325074deba13795d4c2947064158a179a0105fd2))
* **keymappings:** add quickfix list keymap to <leader>q ([610f504](https://github.com/ecosse3/nvim/commit/610f50453f250138863a7aacb84d6c8a71d2b114))
* **keymappings:** change save session management keymap to <leader>pS ([7b14813](https://github.com/ecosse3/nvim/commit/7b1481399da926465163feb94cc14d88e45bab9f))
* **keymappings:** support textsubjects prev selection with <BS> ([ae67b8d](https://github.com/ecosse3/nvim/commit/ae67b8da455bc3170bf57cde40bc25dfff12d034))
* **keymappings:** use own format function for <leader>cf ([4b5e751](https://github.com/ecosse3/nvim/commit/4b5e7519c92fabdf76b0a9ec47f139d27c7b1b3d))
* **lazy:** remove "tohtml" default plugin ([508a44d](https://github.com/ecosse3/nvim/commit/508a44d11910de4d69345798b5b97fb4c158a914))
* **lsp:** automatically enable all LSPs installed by mason ([84e9837](https://github.com/ecosse3/nvim/commit/84e983756bb51bf64486512bccfe8c879aedfb02))
* **options:** set localleader to ; instead of , (comma) ([125312b](https://github.com/ecosse3/nvim/commit/125312b591028ed7997b17fe21ce01204c5db871))
* **plugins:** add codesnap instead of carbon.sh ([f918d1a](https://github.com/ecosse3/nvim/commit/f918d1a7d8e731f830e00e2029e6e1277a5e00ea))
* **plugins:** add copilot chat ([6274b67](https://github.com/ecosse3/nvim/commit/6274b678957868013a8b422eb4891099bd83ea6d))
* **plugins:** add marks.nvim ([5c8092c](https://github.com/ecosse3/nvim/commit/5c8092c0921788bd58d9d60e142d85a5496157c2))
* **plugins:** add new textcase plugin with Subs command for smart substitute ([09022a3](https://github.com/ecosse3/nvim/commit/09022a331001312595aeacb7eddc4f2c70a3d3e9))
* **plugins:** add nvim-bqf ([aaf3d4b](https://github.com/ecosse3/nvim/commit/aaf3d4bcc953bc17e67fe4ebfeb6e0fecad6935b))
* **plugins:** add nvim-scissors plugin for snippet management ([0e970d9](https://github.com/ecosse3/nvim/commit/0e970d95b71a279dd50f5b26d5fee9012ff3316f))
* **plugins:** add refactoring.nvim ([04b9144](https://github.com/ecosse3/nvim/commit/04b91440bb8d98c5d3b3795bf09b594d60b9ef95))
* **plugins:** add remote flash keybinding ([fe5f67c](https://github.com/ecosse3/nvim/commit/fe5f67ce20199c6cffeec56d342e3d47523a27ac))
* **plugins:** shorten directory path output in printer plugin to match git cwd ([5a96b1a](https://github.com/ecosse3/nvim/commit/5a96b1af0f4ddc55a8528baf921989645f024175))
* **plugins:** simplify alpha keymappings ([0610a4e](https://github.com/ecosse3/nvim/commit/0610a4ed4fa03305661e526b322a8f14787d6d56))
* **plugins:** update button keybindings for Alpha plugin ([91e3618](https://github.com/ecosse3/nvim/commit/91e36181dbd7b082d2fbb5adaa9a561206db9360))


### Bug Fixes

* **cmp:** don't return from cmp config when one of plugins is not correctly loaded ([07629b5](https://github.com/ecosse3/nvim/commit/07629b5b730012ef180149158d8bc07cf6881104)), closes [#165](https://github.com/ecosse3/nvim/issues/165)
* **comment:** require ts_context_commentstring after opting our of jsx branch ([a0750d5](https://github.com/ecosse3/nvim/commit/a0750d5717c189206b19639e4c05eac1d5a4b91a))
* **config:** disable wezterm zen intergration by default ([b6bac9c](https://github.com/ecosse3/nvim/commit/b6bac9cd9ef45f7bd0f59083d185d92b7c80b6b6))
* **keymappings:** moving forward in jumplist via <C-i> ([ae1c279](https://github.com/ecosse3/nvim/commit/ae1c279ec35625bfc3266e51755a6504d86726d0))
* **lsp:** directly go to definition instead opening glance if found only one ([dfd83f2](https://github.com/ecosse3/nvim/commit/dfd83f2cb8387ffe15d216c15c99beebae66888d))
* **lsp:** require path to lsp.function in toggle auto format ([fd03dd0](https://github.com/ecosse3/nvim/commit/fd03dd0f4411f09c47167a1eaf629438407c7a8c))
* **lsp:** update signs config to new neovim spec ([d2872d8](https://github.com/ecosse3/nvim/commit/d2872d8ee59ae97e041fcef296a7199ed2b1275f))
* **plugins:** correctly disable indent blanklint in zen mode ([4bd17f6](https://github.com/ecosse3/nvim/commit/4bd17f6be8b8d6b6857f55dbad5181943c24d4c8))
* **plugins:** fix indent-blankline.nvim setup options ([85e8940](https://github.com/ecosse3/nvim/commit/85e8940fa2d3d9603ccf203883a383910724242c))
* **plugins:** remove 'shade' since it breaks ([10c1e6d](https://github.com/ecosse3/nvim/commit/10c1e6deb9969efbeadd15b38e28359ad579d599))
* **typescript:** correctly enable inlay hints lsp for typescript ([ec42ddc](https://github.com/ecosse3/nvim/commit/ec42ddc19c3230b0e71d9f5a8b6a2239b8e5bf5e))


### Refactors

* **functions:** extract format function which uses lsp format or eslint ([2db797a](https://github.com/ecosse3/nvim/commit/2db797a8f425e0d65a6f29b82012040b7cf5c477))
* **lsp:** move lsp configs inside config directory ([ab6879a](https://github.com/ecosse3/nvim/commit/ab6879a322cbe9f56817e19c834acd068096df7b))
* **plugins:** add luasnip as cmp dependency ([db7e367](https://github.com/ecosse3/nvim/commit/db7e3674fe60f93d5f0a0b14ed55fd54a0b09ca8))

## [3.8.0](https://github.com/ecosse3/nvim/compare/v3.7.1...v3.8.0) (2023-09-29)


### Features

* **cmp:** prioritize copilot & limit options in cmp ([9988c26](https://github.com/ecosse3/nvim/commit/9988c26b6e5938284406a8be770b096e8e52fb12))
* **debugger:** update dap config to use VSCode JS Adapter ([30d4dff](https://github.com/ecosse3/nvim/commit/30d4dff7a6479a770b2e8814d14a4421ad9a729e))
* **functions:** auto format on save by ESLint if possible ([d9edbcc](https://github.com/ecosse3/nvim/commit/d9edbccc924ddb0111ce20322422648cd3db12f3))
* improve todo comments bg adding foreground highlight for all text ([73d8fc2](https://github.com/ecosse3/nvim/commit/73d8fc259fd83c09c125cefe3b565a8945dcf873))
* **keymappings:** remap git conflict mappings for intuitive usage ([9d3206d](https://github.com/ecosse3/nvim/commit/9d3206ddae23f668653033e4653838615fe285ee))
* **keymappings:** remap telescope git status to <Leader>gs and diffview git status to <Leader>gS ([9683427](https://github.com/ecosse3/nvim/commit/9683427ec5d04e9abcecca4a55db4426cfca6131))
* **lsp:** add tailwind css intellisense support for cn() ([e8d2425](https://github.com/ecosse3/nvim/commit/e8d2425f7ccc26d46c81e890194230bbdf0ef788))
* **lsp:** use mason path for tsserver ([4ea1701](https://github.com/ecosse3/nvim/commit/4ea1701c2c44aadff248fb2330a04738281405da))
* **plugins:** add cmp-git plugin ([5c9ecb0](https://github.com/ecosse3/nvim/commit/5c9ecb0159c57aba8b44cf444f8099c6be337f16))
* **plugins:** add octo.nvim plugin for Pull Requests management ([e97089c](https://github.com/ecosse3/nvim/commit/e97089c8ff2280ec9bcef1ad9e7faa5d7d9df0d3))
* **plugins:** add refactoring.nvim plugin ([5e76f92](https://github.com/ecosse3/nvim/commit/5e76f92393548c953057f4e9b756ef22e9723975))
* **plugins:** add tailwind-sorter.nvim plugin (TailwindSort command) ([740df25](https://github.com/ecosse3/nvim/commit/740df25614dc96b38ea2b1ef9e38640951627449))
* **plugins:** add tw-values.nvim plugin (keymap: <Leader>cv) ([25be62b](https://github.com/ecosse3/nvim/commit/25be62bd0bbf1e3a167f1225b3429248ee2e9a5d))
* **plugins:** limit flash.nvim keys ([c83958e](https://github.com/ecosse3/nvim/commit/c83958eb15c3f3614ecddfc53f83abe4b08731f8))
* **plugins:** update indent-blankline config ([a276c11](https://github.com/ecosse3/nvim/commit/a276c11fad521bbe479759d4a2f42363f51310d9))
* **plugins:** use native lsp styles for hover instead of noice.nvim ([4ffe8c9](https://github.com/ecosse3/nvim/commit/4ffe8c99af3f4d98eb96c82943ea09b8f85daeda))
* **telescope:** add typescript only shortcut to multi-rg (S-p) ([05cefcd](https://github.com/ecosse3/nvim/commit/05cefcd144313015e8b458e6d96af48e3fc395e4))
* **telescope:** match special characters in telescope grep (S-p mapping) without escape symbols ([7b8f1a3](https://github.com/ecosse3/nvim/commit/7b8f1a330c5815da2d29ecae491672a78d218ad1))
* **ui:** add border to multicursors.nvim popup ([270b620](https://github.com/ecosse3/nvim/commit/270b620433b5c0aff84afad8bb92dfd8925515cb))
* **ui:** scale down lazygit window to 0.9 scaling factor ([e80e0f7](https://github.com/ecosse3/nvim/commit/e80e0f7f233ff1c01e790f559563fa87977d6137))
* **utils:** add GIT_CWD global fn ([addd27c](https://github.com/ecosse3/nvim/commit/addd27cf2ede4a6b0698a85c58d1bd908fe309d6))


### Bug Fixes

* **plugins:** remove deprecated hide_root_folder from nvim-tree config ([4d915e5](https://github.com/ecosse3/nvim/commit/4d915e539e8a2eb7349db28af0434c618ab7c9f7))
* **plugins:** remove unnecessary FixCursorHold.nvim plugin ([7c53061](https://github.com/ecosse3/nvim/commit/7c53061b9b1f3290257fa9ed609ce83196b91cc9)), closes [#12587](https://github.com/ecosse3/nvim/issues/12587)

### [3.7.1](https://github.com/ecosse3/nvim/compare/v3.7.0...v3.7.1) (2023-09-09)


### Bug Fixes

* **icons:** update box & buffer nerd icons ([00ed206](https://github.com/ecosse3/nvim/commit/00ed206ba975312d5b01c6f8e767990ae886125f))
* **icons:** update expandtab nerd icons in statusline ([b00c3ef](https://github.com/ecosse3/nvim/commit/b00c3ef2d8407cd29f22afe894033bd826291eba))
* **icons:** update paragraph & lsp icon in cmp ([5e41d99](https://github.com/ecosse3/nvim/commit/5e41d9977ace290e7b1a629494fbdbff477964c7))
* **lazy:** set concurrency to 5 so it fixes issue with github timeout ([e963507](https://github.com/ecosse3/nvim/commit/e96350751a2722bea45787ea527bdb1bd787cf25))
* **plugins:** add max_item_count back for buffer in cmp ([60c7d7d](https://github.com/ecosse3/nvim/commit/60c7d7d03eec0f85153d03e5d082346453b4ca12))
* **plugins:** fix commenting in Comment.nvim plugin ([b288dee](https://github.com/ecosse3/nvim/commit/b288dee3fd892efa28f5ae3cacf7e426deb0e44d))
* **plugins:** fix lazy spec for nvim-lsp-file-operations ([60ee27d](https://github.com/ecosse3/nvim/commit/60ee27df09f9a2090f1b4bc6e19d5c2961392f08)), closes [#161](https://github.com/ecosse3/nvim/issues/161)
* **plugins:** nvim-surround loading ([711731c](https://github.com/ecosse3/nvim/commit/711731c5a9309210711b290e2f4bced8afa58f6b))
* **plugins:** proper sorting of copilot & max view entries set to 100 for performance ([e03fe28](https://github.com/ecosse3/nvim/commit/e03fe28415b09230c0807b3da14dfdd09ee946d4))
* **plugins:** remove legacy view.mappings from nvim-tree ([d2656d3](https://github.com/ecosse3/nvim/commit/d2656d3865792de17e73575f162b758157fc5d64))

## [3.7.0](https://github.com/ecosse3/nvim/compare/v3.6.0...v3.7.0) (2023-08-02)


### Features

* **keymappings:** add visual keymap for multicursor plugin ([2f2ffcf](https://github.com/ecosse3/nvim/commit/2f2ffcf4daab586b4009eae90db354f383885a14))
* **keymappings:** move spectre keymaps to plugin itself ([60c8b9f](https://github.com/ecosse3/nvim/commit/60c8b9ff15e92744aa5b166f037d88d94b76e1fb))
* **keymappings:** move which-key bufferline keymaps to plugin itself ([97e48d5](https://github.com/ecosse3/nvim/commit/97e48d52d986b81acbe6b3e1834b491a589f9ab6))
* **keymappings:** move which-key comment-box keymaps to plugin itself ([03cca90](https://github.com/ecosse3/nvim/commit/03cca903eb6e2efc814522a113d72d053142570e))
* **keymappings:** move which-key git-conflict keymaps to plugin itself ([dd2d2a7](https://github.com/ecosse3/nvim/commit/dd2d2a792165f4e21adda7844066d282e8d8de1d))
* **keymappings:** move which-key gitsigns keymaps to plugin itself ([a46ba66](https://github.com/ecosse3/nvim/commit/a46ba66b4b593b49be93decdc20f3e50cc34c041))
* **keymappings:** move which-key lazygit keymaps to plugin itself ([eeabba7](https://github.com/ecosse3/nvim/commit/eeabba795ed973a6c6619d4c3e08a5130e534305))
* **keymappings:** move which-key session manager keymaps to plugin itself ([78f0240](https://github.com/ecosse3/nvim/commit/78f0240979b074cdc02d96c057dff7d3ec7a3a2b))
* **keymappings:** move which-key toggleterm keymaps to plugin itself ([5ac11bb](https://github.com/ecosse3/nvim/commit/5ac11bbe5ef797d2161cc848b35abaf84f64228f))
* **plugins:** add min_chars opt to tailwind-fold plugin ([45741ab](https://github.com/ecosse3/nvim/commit/45741abfe0edb2a14541322ee052dfea97958a93))
* **plugins:** change vim-visual-multi to multicursors.nvim ([1c34619](https://github.com/ecosse3/nvim/commit/1c346198117edab78e31892920068023c82a58d9))
* **plugins:** enable diffview & move which-key keymaps to plugin itself ([8f71912](https://github.com/ecosse3/nvim/commit/8f71912ae95740b9cc0063eb12a47fdeaf2118d3))


### Bug Fixes

* **blame:** remove t_Co option which fixes highlighting in Git Blame window ([12b011b](https://github.com/ecosse3/nvim/commit/12b011b02871550c335a7e5949570abcb5ee325c))
* **icons:** change deprecated nerd icons to new ones ([0e29a84](https://github.com/ecosse3/nvim/commit/0e29a84251a99e7688401acff0796e470a38d95d))
* **icons:** fix alpha icons & provide new ones ([78c2704](https://github.com/ecosse3/nvim/commit/78c27041ab9e65bed07341343807da00d3a9561f))
* **icons:** fix arrow bottom left icon of nvim-ufo ([dc6facc](https://github.com/ecosse3/nvim/commit/dc6faccf50a2c83c66d382925824725534e2a237))
* **icons:** fix more icons ([15f44a9](https://github.com/ecosse3/nvim/commit/15f44a9e9ea3a703a5e3bbd530dd496afd45b0cc))
* **keymappings:** remove duplicated keymaps of comment-box ([5ac2e50](https://github.com/ecosse3/nvim/commit/5ac2e505acdbb4233ad2a7aeab0f896faebf4fdb))
* **plugins:** fix loading of vim-rooter ([efc344d](https://github.com/ecosse3/nvim/commit/efc344dbf50fb78faed7583f3102b0572c57d8c8))
* **plugins:** remove deprecated anchor option from dressing ([8e3011b](https://github.com/ecosse3/nvim/commit/8e3011bf3df77b2012cd64f2ef1d31e37fb7d01b))

## [3.6.0](https://github.com/ecosse3/nvim/compare/v3.5.2...v3.6.0) (2023-07-10)


### Features

* **cmp:** add support for TailwindCSS colors previews in autocompletion ([b37c297](https://github.com/ecosse3/nvim/commit/b37c297d955a4f37e013834d29d2f90f53afe121))
* **lsp:** do NOT lazy load lspconfig ([e838416](https://github.com/ecosse3/nvim/commit/e838416e42906c60b936d71c3be07f2970ff8c7a))
* **lsp:** switch typescript.nvim and tsserver LSP to typescript-tools plugin ([41164b6](https://github.com/ecosse3/nvim/commit/41164b67e4f69c5fb2f8df26cabfff45cfdd6d6a))
* **plugins:** add mini.ai plugin ([d025184](https://github.com/ecosse3/nvim/commit/d02518452ea54cdeee5ebbc3308ae957259f8b6b))
* **plugins:** add nvim-lsp-file-operations plugin ([dfea8a3](https://github.com/ecosse3/nvim/commit/dfea8a31aa0825ce01f2c32c5c7995fd6a8637f3))
* **plugins:** add support for WezTerm & Alacritty in Zen plugin ([6754f7f](https://github.com/ecosse3/nvim/commit/6754f7f251cc118bc8112d51f1ac9e9d2aa6cad7))
* **plugins:** add tailwind-fold.nvim plugin which automatically folds tailwind classes ([06fd8e3](https://github.com/ecosse3/nvim/commit/06fd8e38671569a8b07cfe95959e3daa7ae76c64))
* **plugins:** change deprecated nvim-ts-rainbow to rainbow-delimiters.nvim ([0cadfda](https://github.com/ecosse3/nvim/commit/0cadfda882c76fa1a16cbe0489fbda59cea79e15))
* **plugins:** deprecate null-ls ([689bb6e](https://github.com/ecosse3/nvim/commit/689bb6e20e53cef57f0dce4f8ce8b2400e9bb0e1))
* **plugins:** keep main branch of typescript-tools ([704320d](https://github.com/ecosse3/nvim/commit/704320d91be48f223e60526275e8e072b5de45c3))
* **plugins:** remove duplicated opts from TSC.nvim ([8b564a1](https://github.com/ecosse3/nvim/commit/8b564a1e42f84e89b69c841a3a5f15ebcc4392a5))
* **plugins:** remove inlay-hints plugin since it's natively available in nvim 0.10 ([573589c](https://github.com/ecosse3/nvim/commit/573589c15b6d5bd305a746fbb50cd9cb5f9b5dc0))
* **plugins:** replace lightspeed.nvim with folke/flash.nvim ([8e42262](https://github.com/ecosse3/nvim/commit/8e4226209df1b9cd39f7bafac1e78427df7884e4))


### Bug Fixes

* **lsp:** resolve error getting lsp code for diagnostics ([4848699](https://github.com/ecosse3/nvim/commit/48486999fd8a9c76871e6e6ee03a1022b97edc61))
* minor typo in README.md ([#150](https://github.com/ecosse3/nvim/issues/150)) ([432bae9](https://github.com/ecosse3/nvim/commit/432bae905641597ec214dc03e171662729148088))
* **plugins:** change loading event of gitsigns.nvim to BufRead so it doesn't throw an error ([b586ff6](https://github.com/ecosse3/nvim/commit/b586ff6600d1492bae3616237baeb0387dfdcbcf))
* **plugins:** keep fixed width of 40 in nvim-tree ([cfdb764](https://github.com/ecosse3/nvim/commit/cfdb764368866b9ecf40b3ca20a1a03a6c1dc602))
* **plugins:** remove improt-cost.nvim plugin since it breaks ([8d27308](https://github.com/ecosse3/nvim/commit/8d27308cc4c04ac7262043e30093395f7c170ad1))
* **which-key:** change LSP mappings to new one from typescript-tools ([503f10f](https://github.com/ecosse3/nvim/commit/503f10f6910d8b90072d23402865a55f023e66f1))

### [3.5.2](https://github.com/ecosse3/nvim/compare/v3.5.1...v3.5.2) (2023-05-27)


### Bug Fixes

* **cmp:** fix cmp when copilot is disabled ([7cbedc8](https://github.com/ecosse3/nvim/commit/7cbedc8b6e54a6650b0e3c99e1219469692d6257)), closes [#143](https://github.com/ecosse3/nvim/issues/143)
* **cmp:** properly skip copilot comparators if copilot is disabled in EcoVim settings ([4ee606a](https://github.com/ecosse3/nvim/commit/4ee606a16b3b3844852f431557977b4d9625de25))
* **git:** use new utils method to close other buffers with worktree ([63e17b9](https://github.com/ecosse3/nvim/commit/63e17b9c5e672605bb76603a8d44184fd9d4fba7))
* **plugins:** install dap_repl treesitter parser only if not installed ([2c40c0e](https://github.com/ecosse3/nvim/commit/2c40c0e04939c31ade840ce0da9ad88222aeb7e6)), closes [#145](https://github.com/ecosse3/nvim/issues/145)

### [3.5.1](https://github.com/ecosse3/nvim/compare/v3.5.0...v3.5.1) (2023-05-24)


### Bug Fixes

* **treesitter:** ensure that "vim" parser is installed ([6ca2ca3](https://github.com/ecosse3/nvim/commit/6ca2ca36b598eb4081d0c17eb8fae821fbf6b853)), closes [#142](https://github.com/ecosse3/nvim/issues/142)
* **which-key:** close other buffers ([#138](https://github.com/ecosse3/nvim/issues/138)) ([ba94cf6](https://github.com/ecosse3/nvim/commit/ba94cf68f5c13df2af4e93a7e1b299b22dfb47c0))

## [3.5.0](https://github.com/ecosse3/nvim/compare/v3.4.0...v3.5.0) (2023-05-17)


### Features

* **dap:** add nvim-dap-vscode-js new adapter ([69a8a59](https://github.com/ecosse3/nvim/commit/69a8a59c1dd6e18eaa8d8b32db272bc6fff965b6))
* **plugins:** add nvim-dap-repl-highlights with treesitter plugin ([4816b16](https://github.com/ecosse3/nvim/commit/4816b168a3a9f4d7632afde98a041f34c38bfdbf))
* **plugins:** switch barbar.nvim to bufferline.nvim ([6ecd9f4](https://github.com/ecosse3/nvim/commit/6ecd9f40b19f82beffd308bdc33681326b77b356))
* **ui:** add rounded float border to LspInfo ([2bcd96e](https://github.com/ecosse3/nvim/commit/2bcd96e7980f8c0d4ab2d5dc8eb279b2c9ebcd8e))
* **ui:** link LspInfoBorder to FloatBoder in tokyonight.nvim ([60e737c](https://github.com/ecosse3/nvim/commit/60e737c8cbfdbe18bc78253dc2f50f837817bdbe))


### Bug Fixes

* **colorscheme:** almost correct barbar highlights ([00645d6](https://github.com/ecosse3/nvim/commit/00645d642bba00d7caff8f66b0dcf858f5eb86b7))
* **keymaps:** support range formating with visual selection ([24bef17](https://github.com/ecosse3/nvim/commit/24bef176230ac6779c5d1b5427f50d33d14a9b44))

## [3.4.0](https://github.com/ecosse3/nvim/compare/v3.3.0...v3.4.0) (2023-04-28)


### Features

* **plugins:** add list of base languages to ensure_installed in treesitter ([b0c58b1](https://github.com/ecosse3/nvim/commit/b0c58b1cd77b9a4f51affb29ee75dd50361dfa40)), closes [#135](https://github.com/ecosse3/nvim/issues/135)


### Bug Fixes

* **plugins:** resize of nvim-tree works with "File Explorer" title ([94c4fed](https://github.com/ecosse3/nvim/commit/94c4fed05d7e4d753bd8dc71ef7ea89cfe70b490))
* **winbar:** return filename if parent dir doesn't exist ([6b53c18](https://github.com/ecosse3/nvim/commit/6b53c18b54a0709c8c294d8748ee604eb301a135)), closes [#134](https://github.com/ecosse3/nvim/issues/134)

## [3.3.0](https://github.com/ecosse3/nvim/compare/v3.2.0...v3.3.0) (2023-04-25)


### Features

* **cmp:** prioritize copilot cmp comparators & lint ([afe1f07](https://github.com/ecosse3/nvim/commit/afe1f079f6bd20ef4947fe5fe53d5d7236359ebd))
* **dap:** add new keymaps to focus specific dap window & disable shade by default ([e3710c1](https://github.com/ecosse3/nvim/commit/e3710c1b0cf401a6a3e9acdcee063feb4a903749))
* **lsp:** enable codespell for markdown & text files ([0e2e426](https://github.com/ecosse3/nvim/commit/0e2e42622a77c8ba364f3239d179f4b7e9d0c382))
* **lsp:** improve vuels lsp config ([e64b642](https://github.com/ecosse3/nvim/commit/e64b642b35ae3e9756c686f144c043ae142be13c))
* **options:** set cmdheight to 0 by default (can be changed personally) ([241691f](https://github.com/ecosse3/nvim/commit/241691fec47e867cc75cb7a6c10b76c04a317cc0))
* **plugins:** add 'jump_by_subwords' option to EcoVim config with nvim-spider plugin && enable noice by default ([b23c9ae](https://github.com/ecosse3/nvim/commit/b23c9ae1e78278a11b0c935cd6aab1a7a1853eff))
* **plugins:** add glance.nvim plugin for great definitions/references LSP UI ([6fda79d](https://github.com/ecosse3/nvim/commit/6fda79d19f4bde6ea09d73ecb1dccd5039481063))
* **plugins:** add tsc.nvim ([fb762fe](https://github.com/ecosse3/nvim/commit/fb762fe9338c4c4c2802cf434f3d6cc662ec51d2))
* **plugins:** add tsc.nvim mapping to which-key & remove chatgpt config file ([10e68ae](https://github.com/ecosse3/nvim/commit/10e68aedd9cc3ccdeeea51134e1fcb070951c2c2))
* **plugins:** replace ChatGPT.nvim with NeoAI.nvim ([772af39](https://github.com/ecosse3/nvim/commit/772af39bcc5d09ce729635554311d558c9f1edd5))
* **plugins:** update nvim-tree & make "File Explorer" title always align in the middle even when resized ([9494b6f](https://github.com/ecosse3/nvim/commit/9494b6fb54620424dcc0ab75e7f23c3dbadeb01d))
* **winbar:** move winbar autocmds to winbar itself & add titles for DAP windows ([aa4b3fa](https://github.com/ecosse3/nvim/commit/aa4b3faa312e5195f323325226fe989f5b1e48c2))
* **zen:** disable signcolumn on zen mode & lint ([07954cf](https://github.com/ecosse3/nvim/commit/07954cf3f4817acd3fbf86f6896d8541f801d54c))


### Bug Fixes

* **colorscheme:** change color of BufferInactiveIndex in tab bar (barbar.nvim) ([1f7a415](https://github.com/ecosse3/nvim/commit/1f7a4150026df2b9f39766ff49b38d3611ef787f))
* return nvim-notify notification record from vim.notify ([#133](https://github.com/ecosse3/nvim/issues/133)) ([f35c525](https://github.com/ecosse3/nvim/commit/f35c525f865d1fada6e7f92c86c51884913f98f8))
* **telescope:** weird issue in insert mode in telescope ([ee6d428](https://github.com/ecosse3/nvim/commit/ee6d4287b58b84e480059a34aba96d628d15dc21))
* **utils:** change deprecated pretty_print to print ([a4a2cf4](https://github.com/ecosse3/nvim/commit/a4a2cf42b67fde07451dfd5cce364bc23ca962cc))

## [3.2.0](https://github.com/ecosse3/nvim/compare/v3.1.1...v3.2.0) (2023-04-04)


### Features

* **ai:** add codeium AI plugin & configure copilot ([df0bf24](https://github.com/ecosse3/nvim/commit/df0bf24ff2ab3828f2de5897c3399db3870ea5e7))
* **ai:** make ChatGPT disabled by default and configurable via EcoVim config ([b172d8b](https://github.com/ecosse3/nvim/commit/b172d8b9dd21f14794266b9255ea9d96d79b1ecd))
* **colorscheme:** remove italic from comments ([7db438e](https://github.com/ecosse3/nvim/commit/7db438e68053567320d02f8594dcfd25c5e3a165))
* **lsp:** enable TypeScript codeactions for null-ls by default ([7f15721](https://github.com/ecosse3/nvim/commit/7f157212bce8aa2ec00234cfa886f7fe9c7c6b52))
* **plugins:** add experimental noice UI plugin disabled by default toggable via EcoVim config ([3445910](https://github.com/ecosse3/nvim/commit/3445910177a3dac8d81bfe43ff99bd77a81b271c))
* **plugins:** use nvim-navic instead of nvim-gps which is deprecated ([d43d281](https://github.com/ecosse3/nvim/commit/d43d281675ff63f38fa7cb04adc50c3516238884))
* **plugins:** use treejs instead of splitjoin & configure mappings ([f930dd2](https://github.com/ecosse3/nvim/commit/f930dd23bf6635e1ecedd007e240fcc01d44d6dd))
* **tabnine:** disable by default & make configurable via EcoVim config ([3124357](https://github.com/ecosse3/nvim/commit/3124357b26ddd3dd4fda04b1423a5feb6ab75488))


### Bug Fixes

* **ai:** fix copilot config ([c1314c8](https://github.com/ecosse3/nvim/commit/c1314c8e998d23babe04fae30666a9b45831b636))
* **cmp:** fix cmp completely for AI & provide new kind sources ([55b7a62](https://github.com/ecosse3/nvim/commit/55b7a6209fca66fc68c3651d23ce742f4c4954bd))
* **lsp:** silent unnecessary messages while using tsserver & tailwing via hover handlers ([055be17](https://github.com/ecosse3/nvim/commit/055be17d9a9e049ba84996dfcf8635721f6785c7))
* **plugins:** fix zen mode after removing hlargs ([55db522](https://github.com/ecosse3/nvim/commit/55db5224c2762e2482076a1ab1098e49754d3149))
* **plugins:** keep barbar 1.0 version until fixed ([42b95c1](https://github.com/ecosse3/nvim/commit/42b95c13fba4000e50faa712e449421c2a88d972))
* **plugins:** remove cinnamon plugin ([dbdcbeb](https://github.com/ecosse3/nvim/commit/dbdcbebf2dd5f8b707f2d21009b44f6a86c6b73e))
* **plugins:** temporarily disable diffview.nvim since it's broken ([a470f5b](https://github.com/ecosse3/nvim/commit/a470f5bf802955dc65d4971d4ed2cb303c1138f7))
* **plugins:** trigger nvim-tree via cmds ([cfd75fd](https://github.com/ecosse3/nvim/commit/cfd75fda8a0445d68092ecaf2bd2b765dda4fa42))

### [3.1.1](https://github.com/ecosse3/nvim/compare/v3.1.0...v3.1.1) (2023-03-17)


### Bug Fixes

* **cmp:** increase priority of LSP since buffer was breaking sorting ([4c0eee8](https://github.com/ecosse3/nvim/commit/4c0eee8146fc6d013e47ee1df3c13f13c945a7e5))
* **plugins:** leep default keymaps of ChatGPT cause new versions breaks custom ones ([fe83f5d](https://github.com/ecosse3/nvim/commit/fe83f5df46c71721daab3e8802436d9192adfe58))
* **plugins:** map "s" key to lightspeed.nvim plugin so it works correctly ([7a7b4d6](https://github.com/ecosse3/nvim/commit/7a7b4d66bfcbe303b85a9685bfe53902a355955e))
* **plugins:** use new api of nvim-tree in session-manager ([61a20f7](https://github.com/ecosse3/nvim/commit/61a20f788f70a9d2d8b14fd690ea5aa9fec46c6f))

## [3.1.0](https://github.com/ecosse3/nvim/compare/v3.0.3...v3.1.0) (2023-03-13)


### Features

* **cmp:** limit lsp autocompletion types specifically for TypeScript & JavaScript ([87432e5](https://github.com/ecosse3/nvim/commit/87432e5cbe193a19a8936531669c83c4396752b2))
* **config:** disable hlargs.nvim since semantic tokens support is added to tokyonight colorscheme ([30ec1bc](https://github.com/ecosse3/nvim/commit/30ec1bcdcd6414268a3e5ea56032271adea85895))
* **lsp:** add cva classRegex & style tailwindcss config ([1936f30](https://github.com/ecosse3/nvim/commit/1936f30dda6787d530fdf500f529b6b055de40b2))
* **lsp:** add includeCompletionsForModuleExports suggest option to tsserver settings ([a930ba0](https://github.com/ecosse3/nvim/commit/a930ba08b93b3a5d6f154a74cde4426be6c6cd17))
* **plugins:** add autocmd to notify when conflict is detected in git file ([e98989d](https://github.com/ecosse3/nvim/commit/e98989d2b068c48c333878bd9f51004b7acdc4ca))
* **plugins:** add chat-gpt.lua config ([5360709](https://github.com/ecosse3/nvim/commit/536070990ab61e0667a1ae7f9d6859d108456c85))
* **plugins:** add import-cost plugin ([2944316](https://github.com/ecosse3/nvim/commit/2944316130929fa9e237e651d7703923f95da11f))
* **plugins:** add inlay hints banned notify message ([7a7168b](https://github.com/ecosse3/nvim/commit/7a7168ba4986bbcafae17270939c8be54063bbc7))
* **plugins:** add mason-null-ls and configure it ([8983c47](https://github.com/ecosse3/nvim/commit/8983c4740ecd75da5a623f6d7d2709a8db2babbc))
* **plugins:** add nvim-coverage plugin and load on Coverage command ([d5cc8f8](https://github.com/ecosse3/nvim/commit/d5cc8f89ae4e7e048080f7ef8eea82070f1a2582))
* **plugins:** make printer.nvim load lazily ([6e38313](https://github.com/ecosse3/nvim/commit/6e383137978298562f97e1f06f4ad3330f05b7f9))
* **plugins:** replace AndrewRedev/splitjoin.vim plugin with Wansmer/treesj which uses treesitter and lua ([92e8857](https://github.com/ecosse3/nvim/commit/92e885773bd2ba0081918b620df3a8566a48aa73))
* **plugins:** temporarily disable cinnamon.nvim plugin ([e998225](https://github.com/ecosse3/nvim/commit/e998225054b67d8150f05a7fbfebdabe30d76371))


### Bug Fixes

* **config:** remove old api from colorscheme config ([9f23046](https://github.com/ecosse3/nvim/commit/9f23046974f15a9a285332b91e2b4b9f3f65bb22))
* **plugins:** change nvim tree api keymap in lazy.vim plugins keys ([5f83da6](https://github.com/ecosse3/nvim/commit/5f83da60a31eb519ad42693569dba6d956e00877))
* **plugins:** do not lazy load diffview.nvim ([b737e2e](https://github.com/ecosse3/nvim/commit/b737e2ebed9532d93bb12f7ed492f4b957c7761a))
* **plugins:** do not lazy load git-conflict.nvim plugin ([ce3a809](https://github.com/ecosse3/nvim/commit/ce3a809f124706ff5b5b5124311bb880742d0430))
* **plugins:** fix nvim-tree config ([fa4a9be](https://github.com/ecosse3/nvim/commit/fa4a9be456fa6e861544de0ba87bd927219866b7))
* **plugins:** fix zen config ([2872089](https://github.com/ecosse3/nvim/commit/2872089fea330ff95bcd77c524b460eb984141c2))
* **plugins:** remove lazyredraw option ([b35768a](https://github.com/ecosse3/nvim/commit/b35768a2f8e6f1c35f227dffa5be597e5598ddff))

### [3.0.3](https://github.com/ecosse3/nvim/compare/v3.0.2...v3.0.3) (2023-02-14)


### Bug Fixes

* **lsp:** add "Inlay Hints request failed" to banned messages ([9e9a3a4](https://github.com/ecosse3/nvim/commit/9e9a3a482f88f3159c1be8b785ed43f46f1d1ce3))
* **plugins:** correctly load printer.nvim ([065a9a3](https://github.com/ecosse3/nvim/commit/065a9a3951be3430dca3413bffdba16f0fae2b86))
* **plugins:** lazy load ZenMode on command ([964aa3d](https://github.com/ecosse3/nvim/commit/964aa3d4bd518d291a3fb50930c1e3d6f39ac793))
* replace sumneko_lua (deprecated) with lua_ls ([c133fd7](https://github.com/ecosse3/nvim/commit/c133fd7e76d62bdf3b40d1ebca60e20bc7a4d19c))

### [3.0.2](https://github.com/ecosse3/nvim/compare/v3.0.1...v3.0.2) (2023-01-29)


### Bug Fixes

* **plugins:** fix keymaps for dap ([0ac5cd4](https://github.com/ecosse3/nvim/commit/0ac5cd4761ca72c51edbf0d2e6e2692f493fc802))
* **plugins:** lazy load dap via keys ([131bbbc](https://github.com/ecosse3/nvim/commit/131bbbcdf26a9373216ddc27faba412f777d7b57))
* **plugins:** lazy load git-worktree via keys ([dea1b42](https://github.com/ecosse3/nvim/commit/dea1b42e195e803540ff152eb3392c7c329b19e0))
* **plugins:** lazy load template-string ([16d3688](https://github.com/ecosse3/nvim/commit/16d3688aabfb54a2bde2fdc544409bea140d743f))
* **plugins:** lazy load vim-visual-multi ([157fe44](https://github.com/ecosse3/nvim/commit/157fe4425d45c9f4712e8247646defe1906ca99c))
* **ui:** fix issue with spamming "No information avialable" via vim.notify ([d4fd970](https://github.com/ecosse3/nvim/commit/d4fd970d8b0970d46bcb54e9c88c4074292d35d6)), closes [#121](https://github.com/ecosse3/nvim/issues/121)


### Refactors

* **plugins:** kyazdani42 -> nvim-tree ([c7c199f](https://github.com/ecosse3/nvim/commit/c7c199fd967469d8edf9c062e370a757fe51d4bb))

### [3.0.1](https://github.com/ecosse3/nvim/compare/v3.0.0...v3.0.1) (2023-01-27)


### Bug Fixes

* **plugins:** use inlay-hints config to change highlight group ([3d87878](https://github.com/ecosse3/nvim/commit/3d878788768b3e899ecc7d628f8f0c4e39f0f7ff))

## [3.0.0](https://github.com/ecosse3/nvim/compare/v2.4.2...v3.0.0) (2023-01-27)


### ⚠ BREAKING CHANGES

* change packer.nvim to lazy.nvim

### Features

* add lazy-lock.json ([24e9070](https://github.com/ecosse3/nvim/commit/24e90708cffdf947fb5fa9a45072c189da6a5cac))
* change packer.nvim to lazy.nvim ([0b2a659](https://github.com/ecosse3/nvim/commit/0b2a659bdccb7dc35933a2814e5bb817fe9b885c))
* **config:** add luarc.json ([626571c](https://github.com/ecosse3/nvim/commit/626571c710e01b9372f6d78f32fc6e908b14cf41))
* disable diagnostics with git conflict in file ([2a28a97](https://github.com/ecosse3/nvim/commit/2a28a9714945a0ee224ddd6850ac2643047347f4))
* **install:** update installation script for lazy.nvim ([ba20bb0](https://github.com/ecosse3/nvim/commit/ba20bb089ed401683cfbcbb4d3a76e6e31de04f4))
* **keymappings:** add keymaps for Lazy management ([19ab421](https://github.com/ecosse3/nvim/commit/19ab4215ab3666bfd993d70d52a9caa5f9eef802))
* **plugins:** add Copilot.nvim & refactor cmp formatting ([51f0ebc](https://github.com/ecosse3/nvim/commit/51f0ebc4ea9b235e733b95b4f1b08ba37797c02b))
* **plugins:** add inlay-hints default config ([c75d448](https://github.com/ecosse3/nvim/commit/c75d448bce8669f1bcabc7c27b747cf18896d967))
* **plugins:** add notifiations to session manager ([3b60f90](https://github.com/ecosse3/nvim/commit/3b60f9025dd376cbffed4b785b24fe4a513c005d))
* **plugins:** add printer plugin with gp keymap ([dbbd3ec](https://github.com/ecosse3/nvim/commit/dbbd3ecbcdc04512deaaae9bed5ef419e3ed76aa))
* **plugins:** center view after scrolling with <C-u> and <C-d> ([4ee1c5c](https://github.com/ecosse3/nvim/commit/4ee1c5cf51e260e6d64398a453a626104e33bfd1))
* **plugins:** shade windows on terminal open ([52b1d41](https://github.com/ecosse3/nvim/commit/52b1d41cef8d2ab38728d2bc1ab95bee0c18e135))
* **plugins:** use main branch of inlay-hints & default config ([3d6bace](https://github.com/ecosse3/nvim/commit/3d6bace7b0c2203a7220fc8e5dac0b1e6773f542))


### Bug Fixes

* **autocmds:** icons path ([40fc776](https://github.com/ecosse3/nvim/commit/40fc776437271b77dc77dade597a023a8d80f444))
* **install:** install lazy before running neovim plugin sync in headless mode ([923548e](https://github.com/ecosse3/nvim/commit/923548ea948916b3050c213cade60561edd22caf))
* **keymappings:** correct git blame maps ([e613248](https://github.com/ecosse3/nvim/commit/e6132487ae00fc7c7938f574000752f10506332d))
* **lazy:** reorder plugins ([68aef6b](https://github.com/ecosse3/nvim/commit/68aef6b57c313aebd2165a6ff36d0b532e031b8b))
* **lsp:** deprecated vim.lsp.buf.range_code_action ([43e2907](https://github.com/ecosse3/nvim/commit/43e2907dc1458cdd8460789ac45bc406404ae1ab))
* **lsp:** use ufo config handler only for virtual text ([eb680cb](https://github.com/ecosse3/nvim/commit/eb680cbb0679ad2280d45bbb9d475f6fecbaf217))
* **plugins:** disable unnecessary diagnostics in neotest ([39e7df7](https://github.com/ecosse3/nvim/commit/39e7df7c47e5e47761bc37e048fa7c1ebc612fad))
* **plugins:** do not resize window on open file ([c476be9](https://github.com/ecosse3/nvim/commit/c476be9a7b7ce09d44db8bdbc28b047a4c6b0c1e)), closes [#94](https://github.com/ecosse3/nvim/issues/94)
* **plugins:** enable table mode for markdown by default ([c38e3e8](https://github.com/ecosse3/nvim/commit/c38e3e8c7df2d4c90874c12670b9b8daeb09eb40))
* **plugins:** force date display in alpha to english ([8dd721d](https://github.com/ecosse3/nvim/commit/8dd721d19e9545c053bc18581463840449d15198)), closes [#110](https://github.com/ecosse3/nvim/issues/110)
* **plugins:** icons in gps ([7886514](https://github.com/ecosse3/nvim/commit/7886514c0357d6929fbbfdf70c582ea21dde6378))
* **plugins:** set keymappings in plugin load directly instead of nvim-ufo config file ([e1c08b4](https://github.com/ecosse3/nvim/commit/e1c08b4279f349481ba6251ce5c78c6219103237))
* **plugins:** update gitsigns hl groups ([49ace44](https://github.com/ecosse3/nvim/commit/49ace4419086e4e5450639df92c16eb1434f1311))


### Refactors

* **config:** remove impatient ([eed1c66](https://github.com/ecosse3/nvim/commit/eed1c66c225505ee51ae0246080abaa1e5f539e1))
* **dirs:** config.lua -> EcoVim.lua ([bd16a02](https://github.com/ecosse3/nvim/commit/bd16a02c557c65d23558071fb19b6e418773d3ff))
* **dirs:** move autocmds, colorscheme, keymappings to config dir ([0118159](https://github.com/ecosse3/nvim/commit/0118159b0c81ab93ef9760c94f699f8628f4e8c4))
* **dirs:** move icons & functions to utils dir ([fb44f0b](https://github.com/ecosse3/nvim/commit/fb44f0b2c6f95a8defbe792249ae55ab99e7def0))
* **dirs:** settings.lua -> config/options.lua ([84b79d2](https://github.com/ecosse3/nvim/commit/84b79d21f94ee3a8c020d783459d21bdea9dd828))
* **internal:** remove packer commands ([9413e74](https://github.com/ecosse3/nvim/commit/9413e74d8f9f023d91f711abe0a48e7600cacd7f))

### [2.4.2](https://github.com/ecosse3/nvim/compare/v2.4.1...v2.4.2) (2022-10-20)


### Bug Fixes

* **lsp:** replace update_capabilities with default_capabilities ([f2f2323](https://github.com/ecosse3/nvim/commit/f2f2323a446046e692923cfbf9a6e053fa65a182))
* **lsp:** use lspconfig server names ([36caeed](https://github.com/ecosse3/nvim/commit/36caeed763fe24477b920cc796f8c9e7e60fc21c))

### [2.4.1](https://github.com/ecosse3/nvim/compare/v2.4.0...v2.4.1) (2022-10-06)


### Bug Fixes

* **plugins:** remove filetype.nvim since it's not needed in 0.8 anymore ([d37004f](https://github.com/ecosse3/nvim/commit/d37004f9eb24776996d74509359413310bbb5517))
* **tree:** use bufferline.api to set offset ([2dc1488](https://github.com/ecosse3/nvim/commit/2dc14884594cb237b7d68d3eaafa6c261d3bc684))

## [2.4.0](https://github.com/ecosse3/nvim/compare/v2.3.0...v2.4.0) (2022-09-29)


### Features

* **autocmds:** decrease yank highlight timeout from 200ms to 100ms ([af3a6fb](https://github.com/ecosse3/nvim/commit/af3a6fbf85dc8825de4a123ce73b35748a641453))
* **keybindings:** add [t and ]t mappings for jumping to next/prev todo ([689d83c](https://github.com/ecosse3/nvim/commit/689d83c6c8e3ffb4fa7d5bc000e744f4bf29114f))
* **keymappings:** add gl keymapping to open line diagnostic ([ebb61bb](https://github.com/ecosse3/nvim/commit/ebb61bb21dd21b2d1beaee5fdeb5ee9a57618e2a))
* **lsp:** add emmet ls with deprioritized autocomplete sorting (always at the bottom) ([9dccb4b](https://github.com/ecosse3/nvim/commit/9dccb4b48a8789a6019f6c0533542b61bdfa77b7)), closes [#96](https://github.com/ecosse3/nvim/issues/96)
* **lsp:** more consistent ReactDTS filtering ([#97](https://github.com/ecosse3/nvim/issues/97)) ([b3652ba](https://github.com/ecosse3/nvim/commit/b3652ba52d1a444d3a8481ee8ff2b9cd90e1801f))
* **plugins:** switch vim-easy-align to mini.nvim ([484a84f](https://github.com/ecosse3/nvim/commit/484a84f7add76a572cac72c565c6abc05a8023e7))


### Bug Fixes

* **plugins:** revert todo-comments to folke ([#98](https://github.com/ecosse3/nvim/issues/98)) ([fbd0dcf](https://github.com/ecosse3/nvim/commit/fbd0dcfaaa6baf16cab9d3d412c2dcfed64d9635))
* **plugins:** use lua setup for barbar.nvim bufferline ([4d48147](https://github.com/ecosse3/nvim/commit/4d4814716862d5514c52b42fb466b48e1e18061b))

## [2.3.0](https://github.com/ecosse3/nvim/compare/v2.2.2...v2.3.0) (2022-09-12)


### Features

* **keymappings:** add git conflict keymappings ([2908199](https://github.com/ecosse3/nvim/commit/2908199e36b34f24d5772419f2d120631bc54d20))
* **lsp:** support classnames & clsx in tailwindcss LSP ([4aa4e81](https://github.com/ecosse3/nvim/commit/4aa4e818a599136a5f0358bc2ff18a468daa744a))
* **lsp:** support inlay hints ([d8ac1d8](https://github.com/ecosse3/nvim/commit/d8ac1d8e10d5b69e51237a06e15a345f2b236088))
* **plugins:** support back diffview.nvim ([eb23a34](https://github.com/ecosse3/nvim/commit/eb23a3406de476b52b67a7109ddf9b9fc4368aff))


### Bug Fixes

* **colorscheme:** provide MsgArea fg color ([a4f3698](https://github.com/ecosse3/nvim/commit/a4f3698b1717b2f49b7837bc3d434dc5d6aaa2d2))
* **lsp:** ignore rules linting for Tailwind in CSS/SCSS files ([2373084](https://github.com/ecosse3/nvim/commit/2373084146b697854920b40790264668d3db7266))
* **plugins:** add default jestCommand for neotest-jest to fix running tests ([9679774](https://github.com/ecosse3/nvim/commit/96797741338e78bbf8bca67ce6543176df43016b))
* **plugins:** fix colorizer.nvim config ([2fba6ea](https://github.com/ecosse3/nvim/commit/2fba6eaf8717d6135c71f410cee3cc8ed6c4cbac))
* **plugins:** update barbar to default branch cause wipeout-cmds was deleted ([9bbaac2](https://github.com/ecosse3/nvim/commit/9bbaac262ac8e4618dc8192a3bc07d431ed6c3c1))
* **plugins:** use recommended tag for git-conflict plugin ([16a101e](https://github.com/ecosse3/nvim/commit/16a101e934c1da7e84c357e39fe11a315fca0df9))

### [2.2.2](https://github.com/ecosse3/nvim/compare/v2.2.1...v2.2.2) (2022-09-07)


### Bug Fixes

* **colorscheme:** remove foreground from Nvim Tree Folder Icon after its update ([4655783](https://github.com/ecosse3/nvim/commit/4655783cc029996228d012620c3d0cf79c1630b7))
* **colorscheme:** update tokyonight.nvim theme api ([72ee898](https://github.com/ecosse3/nvim/commit/72ee89800594b9a71305e044d446affc4c5e74a4))

### [2.2.1](https://github.com/ecosse3/nvim/compare/v2.2.0...v2.2.1) (2022-08-28)


### Bug Fixes

* **#91:** correct save current session keymapping ([d896afc](https://github.com/ecosse3/nvim/commit/d896afc1e70f924177585c6244f4401e0b97c671)), closes [#91](https://github.com/ecosse3/nvim/issues/91)

## [2.2.0](https://github.com/ecosse3/nvim/compare/v2.1.1...v2.2.0) (2022-08-22)


### Features

* **colorscheme:** change hlargs highlight color to aka red & remove constant highlight link to boolean ([72ad079](https://github.com/ecosse3/nvim/commit/72ad0793ec7fdeca6d125d0c870194a0120936ce))
* **lsp:** enable formatting in css language server ([b6c4a48](https://github.com/ecosse3/nvim/commit/b6c4a48db5f289a1cf3a5faf9a410b6de00823d2)), closes [#89](https://github.com/ecosse3/nvim/issues/89)
* **plugins:** add visual multi leader key as ; ([f937231](https://github.com/ecosse3/nvim/commit/f9372311b1a600a5121a8be79d44db4a200fc06b))


### Bug Fixes

* **plugins:** add comment box name to which key actions menu ([068c793](https://github.com/ecosse3/nvim/commit/068c79304edc5d95c8b1b22badc05b26a9d092bf))
* **plugins:** fix going to prev/next git hunks by ]c and [c ([ee9b83b](https://github.com/ecosse3/nvim/commit/ee9b83bfb833937002d9ba4fb79509704f833fc6))
* **plugins:** pcall require on ufo & add openFoldsExceptKinds mapping ([d3b1cb5](https://github.com/ecosse3/nvim/commit/d3b1cb57062a752eb00060640efe83f8f634ca31))
* **plugins:** switch to maintained version of todo-comments.nvim ([30d6b03](https://github.com/ecosse3/nvim/commit/30d6b032f4fa3c6c180a6139ebed5e8017b2d8ab))


### Refactors

* **plugins:** move section in alpha config ([466d0ed](https://github.com/ecosse3/nvim/commit/466d0ed07df73d8443cc40c3dbee838f1ad5ec7b))

### [2.1.1](https://github.com/ecosse3/nvim/compare/v2.1.0...v2.1.1) (2022-08-21)


### Bug Fixes

* **ui:** fix flickering cursor by removing winwidth calculations in galaxyline ([307fa3b](https://github.com/ecosse3/nvim/commit/307fa3b40c92340c6badc51c38d66d77c627427b)), closes [#86](https://github.com/ecosse3/nvim/issues/86)

## [2.1.0](https://github.com/ecosse3/nvim/compare/v2.0.1...v2.1.0) (2022-08-15)


### Features

* **colorscheme:** change Constants highlights to link Booleans ([87a0d0b](https://github.com/ecosse3/nvim/commit/87a0d0bfdcf6de429d9c8e3df4db5be51c583e52))
* **lsp:** add prisma lsp ([eaddca7](https://github.com/ecosse3/nvim/commit/eaddca707c0e4e90f9253179299c61aa86f66b7d))
* **lsp:** detach nvim-colorizer from buffer where tailwind is attached so they doesn't conflict ([3782d5b](https://github.com/ecosse3/nvim/commit/3782d5b66d699366e779c37dd46c2702ad38e3e8))
* **plugins:** add internal cursorword plugin ([098db24](https://github.com/ecosse3/nvim/commit/098db2413e40e98727d0ad886b24d51ef9c346f9))
* **plugins:** add template-string.nvim plugin to automatically create tempalate literals from strings if JS variable is used ([b3124f3](https://github.com/ecosse3/nvim/commit/b3124f3745632f4d57d59e7e8a02b5119cf364fb))
* **plugins:** add ufo plugin for pretty and smart folding via LSP ([5ad0a49](https://github.com/ecosse3/nvim/commit/5ad0a4972c6c69b679684bd93d55598481a1ab0e))
* **plugins:** enable extended_mode in treesitter since it's fixed in JSX ([ef8ca21](https://github.com/ecosse3/nvim/commit/ef8ca212cab5b0ee21c4c6218604a244dcbe795f))
* **toggleterm:** use horizontal direction for toggleterm by default & add winbar support ([017e983](https://github.com/ecosse3/nvim/commit/017e9839c900ce48b7d8cf8dcaa6b3556d48c660))


### Bug Fixes

* **dressing:** update dressing config & use builtin backend for code action since nui breaks ([d91b249](https://github.com/ecosse3/nvim/commit/d91b2499755171ca65a221238a2355cd70bebe56))
* **fillchars:** append via vim.opt function ([e846c22](https://github.com/ecosse3/nvim/commit/e846c2200f38c1c349b3bb3255765ee82084ffdb))
* **plugins:** correctly require ufo config ([f7bc533](https://github.com/ecosse3/nvim/commit/f7bc533f37fe7c9419a6aeb43a434cf2c279539f))
* **plugins:** temporarily disable diffview.nvim cause it shows errors :( ([b45af78](https://github.com/ecosse3/nvim/commit/b45af786347ad97b3698729578a3597f78106fc6))
* **plugins:** update lightspeed to only 's' key & correctly require config ([316264b](https://github.com/ecosse3/nvim/commit/316264bbcc7d691401f7e5e0dca541346d21df4f))


### Refactors

* **blame:** change blame directory to internal ([da9b0ab](https://github.com/ecosse3/nvim/commit/da9b0ab5903423823d50d63f2060b24b0a6c71e9))
* **packer:** change packer commands directory to internal ([b051def](https://github.com/ecosse3/nvim/commit/b051defd5c23c2297e5d83aa60272dc8d702e60b))
* **utils:** move globals to utils ([8aba17a](https://github.com/ecosse3/nvim/commit/8aba17a417048e51f55d8b4320b891699799ebb8))
* **winbar:** move to internal & disable in toggleterm ([b7a9ab3](https://github.com/ecosse3/nvim/commit/b7a9ab3ea6eadbf23eecbbdbbb37e4913573875f))

### [2.0.1](https://github.com/ecosse3/nvim/compare/v2.0.0...v2.0.1) (2022-08-01)


### Bug Fixes

* **ui:** disable extended mode of rainbow to correctly highlight JSX via Treesitter ([bc890de](https://github.com/ecosse3/nvim/commit/bc890de8c4d0bb7b8a3831dfaa03c922230ac193))


### Refactors

* **lsp:** change installed lsp names in mason setup ([6c0febe](https://github.com/ecosse3/nvim/commit/6c0febe4cce870d26f184c55c5eb75aa2822e75d))

## [2.0.0](https://github.com/ecosse3/nvim/compare/v1.11.1...v2.0.0) (2022-07-27)


### ⚠ BREAKING CHANGES

* **lsp:** Uninstall lsp-installer servers by :LspUninstallAll
first

### Features

* **lsp:** move from lsp-installer to mason ([4f8f48e](https://github.com/ecosse3/nvim/commit/4f8f48e3545c4cf2025dde5c43eb5dc41e229046)), closes [#80](https://github.com/ecosse3/nvim/issues/80)
* **plugins:** add stay-in-place plugin ([a80aa23](https://github.com/ecosse3/nvim/commit/a80aa2377436b5ed46a0c36db2952d62dbf3b481))
* **plugins:** configure DAP and test with React.js ([de647d7](https://github.com/ecosse3/nvim/commit/de647d780c631feecc6bd3595ff9d7ab8d3a899a))


### Bug Fixes

* **install:** fix removing whole cache dir ([f951a95](https://github.com/ecosse3/nvim/commit/f951a9563783c4df8f70c74ec1d4095804350fae)), closes [#79](https://github.com/ecosse3/nvim/issues/79)

### [1.11.1](https://github.com/ecosse3/nvim/compare/v1.11.0...v1.11.1) (2022-07-17)


### Bug Fixes

* **#75:** fix issues with installation by pcalling which-key ([#76](https://github.com/ecosse3/nvim/issues/76)) ([0b93557](https://github.com/ecosse3/nvim/commit/0b935574c12485ee92264bc2ad11ac7b3acac661)), closes [#75](https://github.com/ecosse3/nvim/issues/75) [#75](https://github.com/ecosse3/nvim/issues/75) [#75](https://github.com/ecosse3/nvim/issues/75)

## [1.11.0](https://github.com/ecosse3/nvim/compare/v1.10.0...v1.11.0) (2022-07-16)


### Features

* **lsp:** create option to toggle inline messages ([69fb322](https://github.com/ecosse3/nvim/commit/69fb3224c958427771e8e578ca42f2aaedf15d88))
* **plugins:** use nvim-surround instead of tpope/vim-surround ([e23cef4](https://github.com/ecosse3/nvim/commit/e23cef4dd9aa082e484ee480eb264bcaa106f091))


### Bug Fixes

* **colorscheme:** use new nvim set_hl api in newest neovim nightly and keep vim.highlight.create in 0.7 ([648981c](https://github.com/ecosse3/nvim/commit/648981c3eff5d6aa591fd9e3924cd338b117c68b))
* **plugins:** do not attach zen in which-key in dashboard ([0a57006](https://github.com/ecosse3/nvim/commit/0a5700668459e4e0fe5922dece24f4a5b0019c59)), closes [#69](https://github.com/ecosse3/nvim/issues/69)
* **plugins:** limit colorizer.lua filetypes ([ed8bec4](https://github.com/ecosse3/nvim/commit/ed8bec4deb71673d067b3a326439a4f6b1522ebe)), closes [#64](https://github.com/ecosse3/nvim/issues/64)
* **settings:** set correct fillchars to not show ^ on newest nightly in statusbar ([d09c743](https://github.com/ecosse3/nvim/commit/d09c743ac16d83cd6f12c771e637fc57b67c7307))

## [1.10.0](https://github.com/ecosse3/nvim/compare/v1.9.1...v1.10.0) (2022-06-21)


### Features

* **git:** use lazygit for all & buffer commits view for default keymaps ([df72edb](https://github.com/ecosse3/nvim/commit/df72edb4b3db268bb94145b9a91f366f857d4541))
* **keymappings:** add mappings for case change in visual mode ([e546e3e](https://github.com/ecosse3/nvim/commit/e546e3ec45e9c1efbb224f843fda7d208521e44c))
* **keymappings:** add spectre lazy keymappings ([a8562b4](https://github.com/ecosse3/nvim/commit/a8562b41cfbb59836879ac3db134a15cfe67a2bd))
* **keymappings:** use cached list of telescope repo for speedup (needs additional config on macOS) ([6a9817b](https://github.com/ecosse3/nvim/commit/6a9817b8b1884176717e6e4bc1c13a84a8c1a47d))
* **plugins:** add git-worktree plugin ([95313ce](https://github.com/ecosse3/nvim/commit/95313cef07e177236520affbe4e53c3a2df9eb6e))
* **plugins:** add lazygit.nvim plugin because it works better with git worktree ([3b46c04](https://github.com/ecosse3/nvim/commit/3b46c042f6ad0a23297b7a66a054923f3064f8c9))
* **plugins:** add neotest and jest support via <Leader>j ([8b0965a](https://github.com/ecosse3/nvim/commit/8b0965a129977d1b8b0d27112cd74182fe7c4d5e))
* **plugins:** add notification after switching worktree ([f49a46e](https://github.com/ecosse3/nvim/commit/f49a46e8b69e6279d0cc1ec4379843c0f2d7b411))
* **plugins:** enable zen by default ([e78129e](https://github.com/ecosse3/nvim/commit/e78129ef78968843be31e9e98d27bd1edc200d28))
* **ui:** add rounded borders by default to LspInstallInfo floating window ([be3ef2d](https://github.com/ecosse3/nvim/commit/be3ef2da6626ebf573606468c1f28b39b4f43623))
* **ui:** dotfiles picker, command history & search history in dropdown ([bc09a24](https://github.com/ecosse3/nvim/commit/bc09a240a3f17b8ee3fce0fa989262b3a4326df3))


### Bug Fixes

* **#62:** update typescript.nvim & remove server capabilities settings for tsserver ([1399d87](https://github.com/ecosse3/nvim/commit/1399d872edd35d89216515ccbe40741eb5ea5f27)), closes [#62](https://github.com/ecosse3/nvim/issues/62)
* add missing comma ([359c58c](https://github.com/ecosse3/nvim/commit/359c58c85b1f4f96c6795d45e08144d486f16c35))
* **blame:** add custom winbar to Git Blame to fix matching between lines issue ([80da821](https://github.com/ecosse3/nvim/commit/80da821f2b6b14d2e4a2427228839fe39564dfd0))
* **colorscheme:** match quicklist border color to float border ([b0643f2](https://github.com/ecosse3/nvim/commit/b0643f23d6feb201a69583d1d4ced2b9e073ac89))
* **keymappings:** conflicting keymaps ([f13cc0b](https://github.com/ecosse3/nvim/commit/f13cc0bf67fb4a0dab98f616294a826344432e3f))
* **lsp:** limit tailwindcss filetypes ([d0d30c5](https://github.com/ecosse3/nvim/commit/d0d30c5fde70c34193a1d47735248b04a674bec3))
* **plugins:** correct refreshing current file & close all buffers on worktree switch ([c4aae38](https://github.com/ecosse3/nvim/commit/c4aae3842f7381c48c1ff492511e08fd9defc357))
* **plugins:** remove cinnamon animation on <C-o> & <C-i> ([2368acc](https://github.com/ecosse3/nvim/commit/2368acc34d447503efaed688f0ce168642e9cc06))
* **plugins:** remove unnecessary todo-comments plugin require ([639c6b9](https://github.com/ecosse3/nvim/commit/639c6b93f635d9d060e09c1e5a61d8483afc3c3d))
* **plugins:** toggleterm highlights & size ([c55c5e1](https://github.com/ecosse3/nvim/commit/c55c5e126fed5cedb4dda2da2f49d65dbe62255d))
* **telescope:** wrap results in workspace diagnostics ([7e20d99](https://github.com/ecosse3/nvim/commit/7e20d99f3317e7aa34c126f36074d4802ec333fd))
* **ui:** fix spacing between vertical pos and size in statusbar by shifting numbers ([23391ef](https://github.com/ecosse3/nvim/commit/23391ef3bfc51e887864be3b1aab11b0335eb761))
* **ui:** vim.ui.select & vim.ui.input error when using nui backend with LSP rename/code actions ([7d081ff](https://github.com/ecosse3/nvim/commit/7d081ff673ebaa1f4f60400898ac8480bd4f347a))


### Refactors

* **plugins:** move all git plugins to git subdirectory inside plugins ([fd86430](https://github.com/ecosse3/nvim/commit/fd86430ccf770737804dd0d0398692a94e581402))

## [1.9.1](https://github.com/ecosse3/nvim/compare/v1.9.0...v1.9.1) (2022-06-05)

### Bug Fixes

* **winbar:** pcall require winbar and check if loaded type is not boolean by first time ([#55](https://github.com/ecosse3/nvim/issues/55)) ([#58](https://github.com/ecosse3/nvim/issues/58)) ([edaca98](https://github.com/ecosse3/nvim/commit/edaca98290bd17707c35be163fe538bf3c9815e2))

## [1.9.0](https://github.com/ecosse3/nvim/compare/v1.8.2...v1.9.0) (2022-06-03)


### ⚠ BREAKING CHANGES

* **colorscheme:** please configure nightfly yourself if you use it

### Features

* **colorscheme:** add Ecovim colors & change telescope title & cursor line color ([31e01c2](https://github.com/ecosse3/nvim/commit/31e01c2897c7070a239b785d0a6fe4efed1531f1))
* **icons:** add exit & fileRecent icon ([7820842](https://github.com/ecosse3/nvim/commit/78208427dd678ddda9c23e421ee24db096a1030f))
* **mappings:** attach zen mapping to which-key if enabled ([aeba8ac](https://github.com/ecosse3/nvim/commit/aeba8ac1cbae54b6548482385ea0ebd7ee2f524e))
* **mappings:** refactor which key & add visual mode mappings ([156ed23](https://github.com/ecosse3/nvim/commit/156ed231c8ba4bf6b6f3581c7bddd6b9d1ba4b94))
* **plugins:** <ESC> to close telescope even in insert mode & <C-q> to smart send to qflist and open it ([585a10a](https://github.com/ecosse3/nvim/commit/585a10a66b978ef88e0a78a722345ca1432eccde))
* **plugins:** add comment box plugin ([184367a](https://github.com/ecosse3/nvim/commit/184367a9eb1297817446890a5fdf62c5bdb18b06))
* **plugins:** improve zen by disabling gitsigns, blanklines, relativenumber & hlards when is active ([cd62efe](https://github.com/ecosse3/nvim/commit/cd62efe2c06d26417dbb5dbc4e3f2f395da58d90))
* **plugins:** new alpha look & custom config ([3f1da4a](https://github.com/ecosse3/nvim/commit/3f1da4aacd6311fffe8617652a210ed7c94db7e7))
* **ui:** rounded borders in which key ([0ac8d2c](https://github.com/ecosse3/nvim/commit/0ac8d2c6b34bd142134537b31914c316c45db100))
* **ui:** use packer.nvim in float bordered window ([4aeb00d](https://github.com/ecosse3/nvim/commit/4aeb00d2e8e82c4c9bbf73c703b0a73929ae992c))


### Bug Fixes

* **barbar:** remove pcall of nvim_web_devicons ([c3412e0](https://github.com/ecosse3/nvim/commit/c3412e0105519b04224dcf18eef9ba69023e2160))
* **cmp:** limit item count for luasnip & buffer ([918ddc4](https://github.com/ecosse3/nvim/commit/918ddc46abbc8d70a705c96b12bad77fd120bb00))
* **lua:** add packer_plugins to globals ([ed470d0](https://github.com/ecosse3/nvim/commit/ed470d06edecde51f7510bd0d0dd425d98494682))
* **plugins:** autosave only in session ([256ba84](https://github.com/ecosse3/nvim/commit/256ba840a0832a6475947d2e94a179d18ef00a17))
* **plugins:** reorder fzf-native ([5473aa2](https://github.com/ecosse3/nvim/commit/5473aa2f37972fa7e4e20d0093ac11da0d65976d))
* **utils:** decrease relative path length ([e919dd9](https://github.com/ecosse3/nvim/commit/e919dd99824ca84559d4fc3c866b20372f6d95ad))
* **which-key:** use the right command to open Alpha ([#53](https://github.com/ecosse3/nvim/issues/53)) ([76fb267](https://github.com/ecosse3/nvim/commit/76fb267f30c419af71365e62e0108c583964eac0))


* **colorscheme:** drop support for nightfly colorscheme ([aa45d38](https://github.com/ecosse3/nvim/commit/aa45d38f501b55bd56722cd9ef2c1891510d6f5b))

### [1.8.2](https://github.com/ecosse3/nvim/compare/v1.8.1...v1.8.2) (2022-06-01)


### Bug Fixes

* **#51:** replace dashboard with alpha.nvim & fix installation script ([#52](https://github.com/ecosse3/nvim/issues/52)) ([847f38d](https://github.com/ecosse3/nvim/commit/847f38dec48c2091948fa0dafdecadf4cc913b97)), closes [#51](https://github.com/ecosse3/nvim/issues/51) [#51](https://github.com/ecosse3/nvim/issues/51) [#51](https://github.com/ecosse3/nvim/issues/51)
* **which-key:** mappings for alpha ([311537c](https://github.com/ecosse3/nvim/commit/311537cd25ed2550524fbc612ba5e594d1128c1b))

### [1.8.1](https://github.com/ecosse3/nvim/compare/v1.8.0...v1.8.1) (2022-05-31)


### Bug Fixes

* **gps:** fix spacing in react hook icons in gps ([cd1a5fd](https://github.com/ecosse3/nvim/commit/cd1a5fd60579f44e854a9ab634228f3c7e5ed9dd))
* **plugins:** set max_jobs to 50 to prevent freezing when syncing plugins ([f032bb3](https://github.com/ecosse3/nvim/commit/f032bb3c29cff97c849a7b1510a51a84bfb2e404))
* **plugins:** update nvim-tree config ([585bc06](https://github.com/ecosse3/nvim/commit/585bc062ab5af81e3ace76220744787404dfac4e))
* **snippets:** check if luasnip is loaded ([f023f4f](https://github.com/ecosse3/nvim/commit/f023f4fad57deb40a65a66786f3e9014bbec6241)), closes [#50](https://github.com/ecosse3/nvim/issues/50)
* **winbar:** enable winbar only for neovim 0.8+ ([6eb9eac](https://github.com/ecosse3/nvim/commit/6eb9eac8605fb7904877e4d9514e3e7887735ae2)), closes [#50](https://github.com/ecosse3/nvim/issues/50)


### Refactors

* **icons:** change ' to " ([2f10dde](https://github.com/ecosse3/nvim/commit/2f10dde13294fc33d6a34f3a715f96f977bea9fe))

## [1.8.0](https://github.com/ecosse3/nvim/compare/v1.7.2...v1.8.0) (2022-05-23)


### Features

* **autocmds:** enable LSP typescript mappings only in ts & tsx files ([1512000](https://github.com/ecosse3/nvim/commit/1512000accb14137403fa84a9bcf6925fe0aaa47))
* **icons:** provide new icons for winbar ([f314a9d](https://github.com/ecosse3/nvim/commit/f314a9d2770b39461d84d6fba37a446dfb286c13))
* **keymappings:** remap H to ^ ([946f137](https://github.com/ecosse3/nvim/commit/946f137de7453a035f273a8068e4ea706e41634a))
* **plugins:** add luasnip jumpable mapping as <C-h> and <C-l> ([308665b](https://github.com/ecosse3/nvim/commit/308665b60537855a3629b28e3a946ca84e67b41c))
* **plugins:** add nvim-bqf ([8993acf](https://github.com/ecosse3/nvim/commit/8993acf8c5fc8af9165eb14a78c77fc842d644e4))
* **plugins:** configure package-info with correct config, status in galaxyline & which-key mappings only in package.json ([5149189](https://github.com/ecosse3/nvim/commit/51491895fd2369acc86f4afcaf53b01d1de13098))
* **snippets:** add react component treesitter snippet as "comp" ([223bac6](https://github.com/ecosse3/nvim/commit/223bac6c2c7e08edb1b6c6fe1b76b45dd3b4155c))
* **ui:** change lsp virtual text rectangle icon to circle and add extra space ([c4515f3](https://github.com/ecosse3/nvim/commit/c4515f394765282e3bc0c4dda3878ff38c3db880))
* **winbar:** use new neovim feature of top winbar with nvim-gps reimplemented & drop from galaxyline ([01fcce9](https://github.com/ecosse3/nvim/commit/01fcce916a5bd64f00504c1f874f6f7e8aa21f61))


### Bug Fixes

* **bufferline:** exclude quickfix list from bufferline ([12a8c91](https://github.com/ecosse3/nvim/commit/12a8c9187160fc14623d60fc9e58f465eea3d77f))
* **bufferline:** fix moving between buffers ([747a2bd](https://github.com/ecosse3/nvim/commit/747a2bd98b8e7a1d6c470949439e30c5a4c32d5e))
* **keymappings:** fix line diagnostics mapping ([13ccc51](https://github.com/ecosse3/nvim/commit/13ccc51cf089b00e0d48c137a916815cfb16d9c6))
* **plugins:** reorder cmp source mapping ([858d0e0](https://github.com/ecosse3/nvim/commit/858d0e040dad072566f6b808340849c2d1b79f24))
* **plugins:** use nvim-colorizer maintaned fork from NvChad & update config ([007273a](https://github.com/ecosse3/nvim/commit/007273ae4556ce521a2670cbdc809cc215a8695d))
* **require:** require impatient by pcall ([16dca98](https://github.com/ecosse3/nvim/commit/16dca9848034c6c339a839c2f381b4fe1926ce09)), closes [#48](https://github.com/ecosse3/nvim/issues/48)
* **require:** safetely require specific plugins ([3b4ca9d](https://github.com/ecosse3/nvim/commit/3b4ca9d12ac286a2345c4fa06f9682f64b8a9262))
* **winbar:** add hl_group to caret ([69253b9](https://github.com/ecosse3/nvim/commit/69253b978d9b1357ae74ab12966fb3b94e199f7d))


### Refactors

* **plugins:** change style of displaying source mapping in cmp ([72d2a74](https://github.com/ecosse3/nvim/commit/72d2a747d4e9a7a5cf4687cbe88146f757e2600f))
* **plugins:** reorder ([9a715ac](https://github.com/ecosse3/nvim/commit/9a715acb06f7b619e9c6f37ef0e7dfd1d2a5da0a))

### [1.7.2](https://github.com/ecosse3/nvim/compare/v1.7.1...v1.7.2) (2022-05-14)


### Bug Fixes

* **lsp:** fix lsp installer loading issues ([d84b928](https://github.com/ecosse3/nvim/commit/d84b9285efa4498d7680cc000a5da42f3e4f287e)), closes [#47](https://github.com/ecosse3/nvim/issues/47)
* **lsp:** set max-width of diagnostic window to 100 to prevent issues on smaller and very large screens ([a67bc25](https://github.com/ecosse3/nvim/commit/a67bc2573da58cd29a6ac7f05c24f6a913809fcf))
* **plugins:** repair markdown-preview installation ([c83e7ce](https://github.com/ecosse3/nvim/commit/c83e7ce09851d33c3ed8e092d6e9a50214300a55))

### [1.7.1](https://github.com/ecosse3/nvim/compare/v1.7.0...v1.7.1) (2022-05-09)


### Bug Fixes

* **lsp:** make ESLint formatting work ([715bf11](https://github.com/ecosse3/nvim/commit/715bf1112f32890377d73a3dba47d1b45d8a530e))


### Refactors

* **plugins:** use nvim_tree events ([c186db7](https://github.com/ecosse3/nvim/commit/c186db74534fe47fb6c1b74bc800b2ee882a354b))

## [1.7.0](https://github.com/ecosse3/nvim/compare/v1.6.0...v1.7.0) (2022-05-08)


### Features

* **lsp:** add icon for no-unused-vars in tsserver lsp ([44bae0f](https://github.com/ecosse3/nvim/commit/44bae0f889fb3a50d2e7f00140086e6cc388dddb))
* **plugins:** add swap function argument functionality mapped to ~ in normal mode ([8239245](https://github.com/ecosse3/nvim/commit/82392456e2a62031e6aa3aeb48e030f33c9f8420))
* **settings:** reduce timeoutlen a bit ([2041982](https://github.com/ecosse3/nvim/commit/20419822d72de636d3000cdce06f24cf075248a1))
* **ui:** add borders to lspconfig ui windows (e.g. :LspInfo) ([b1265df](https://github.com/ecosse3/nvim/commit/b1265dff3fbc3b60a8899c2f374e9fa9ad50255d))
* **ui:** add offset to file explorer (nvim tree) ([f9b6e80](https://github.com/ecosse3/nvim/commit/f9b6e806c51b049938ca614a9e9991aeba81a902))
* **utils:** add new utility func for adding whitespaces & refactor get_relative_gitpath ([3685478](https://github.com/ecosse3/nvim/commit/3685478881c9f92529e52b9472eb41d8c5db4100))
* **which-key:** show markdown preview only for *.md filetypes via autocmd ([2507df7](https://github.com/ecosse3/nvim/commit/2507df76a5f85c10d33f30a792d2072a7e13f9f9))


### Bug Fixes

* **lsp:** make sure to check require of typescript plugin in lsp setup ([dd00198](https://github.com/ecosse3/nvim/commit/dd0019826201c4e613f614d213969475aac36944)), closes [#44](https://github.com/ecosse3/nvim/issues/44)
* **lsp:** move typescript.nvim to pack start instead of opt ([b569c76](https://github.com/ecosse3/nvim/commit/b569c76646a32c322a5f14323d0a2d6bfb66d00a)), closes [#44](https://github.com/ecosse3/nvim/issues/44)
* **pickers:** don't show tests when tsx picker filter is attached to live grep ([522674d](https://github.com/ecosse3/nvim/commit/522674d2ff1637ef1c4d9981109361e41bf43d26))

## [1.6.0](https://github.com/ecosse3/nvim/compare/v1.5.2...v1.6.0) (2022-05-08)


### Features

* **lsp:** add no_console code with icon ([bf497ff](https://github.com/ecosse3/nvim/commit/bf497ff27e2aa08949ea71c8070ec29facacf994))
* **plugins:** completely refactor packer.nvim & add typescript.nvim plugin ([3c58eee](https://github.com/ecosse3/nvim/commit/3c58eee575a02f4c35cf6d31e3edea7fb0184e0b))
* **which-key:** add telescope git_branches mapping ([85a7242](https://github.com/ecosse3/nvim/commit/85a7242809ea5139b2346eab87981e0b02809f85))


### Bug Fixes

* **lsp:** remove nvim-lsp-ts-utils from tsserver setup ([edd2dbd](https://github.com/ecosse3/nvim/commit/edd2dbd16bf76f1a56e57b870beaeba965ffc160))
* **plugins:** enable treesitter indent ([a7b14a6](https://github.com/ecosse3/nvim/commit/a7b14a669f3da919c237794611efe8557b542b4e)), closes [#43](https://github.com/ecosse3/nvim/issues/43)

### [1.5.2](https://github.com/ecosse3/nvim/compare/v1.5.1...v1.5.2) (2022-05-03)


### Bug Fixes

* **colorscheme:** change Boolean highlight color for better matching ([4fc9be4](https://github.com/ecosse3/nvim/commit/4fc9be46af00da13f93d7aade64eeb798282c9db))
* **galaxyline:** show correct relative path in specific git projects ([5c86cb2](https://github.com/ecosse3/nvim/commit/5c86cb25057333cf33dec3abd0f54450dabe7b0c))
* **lua:** update vim api functions of format & lsp server capabilities ([566d14a](https://github.com/ecosse3/nvim/commit/566d14a0a32baa434522c337339596b97a444694))
* **plugins:** enable <C-h> which_key mapping in telescope ([d515afa](https://github.com/ecosse3/nvim/commit/d515afa4074faca0f6c1ab45633c4f06bfcee758))

### [1.5.1](https://github.com/ecosse3/nvim/compare/v1.5.0...v1.5.1) (2022-04-29)


### Bug Fixes

* **keymappings:** change telescope project mappings ([60fc138](https://github.com/ecosse3/nvim/commit/60fc1380cdaa01ce9aaf667b95b3ef9775f71cdb))
* **keymappings:** do not include declaration of variable when looking for its references ([a4fcdd5](https://github.com/ecosse3/nvim/commit/a4fcdd5edde3706c24c5402ab09a5cc8db36f7f6))
* **keymappings:** pass opts to telescope project_files ([10e9a9b](https://github.com/ecosse3/nvim/commit/10e9a9b999d203a4eef96d041653e89a00a25108))
* **lsp:** completely refactor LSP Installer & how to manage lsp config due to lsp-installer changes ([93aad40](https://github.com/ecosse3/nvim/commit/93aad40d37d33af7519f831dace826794b0d132a))
* **lsp:** format on save function fix ([3e37ae9](https://github.com/ecosse3/nvim/commit/3e37ae96d4e9ec22753880905a1b1dea2a1f65db))

## [1.5.0](https://github.com/ecosse3/nvim/compare/v1.4.0...v1.5.0) (2022-04-24)


### Features

* **autocmds:** enable spell checking for certain file types (txt, md, tex) ([274a2d5](https://github.com/ecosse3/nvim/commit/274a2d5194997916c88f04ff5a4dd39a42b6cc1b))
* **autopairs:** use treesitter for auto-pairing ([85ec233](https://github.com/ecosse3/nvim/commit/85ec23395b625301f86d22cfa0d1be0aad9843ac))
* **lsp:** provide toggle format on save custom function and add to which-key ([e327ed8](https://github.com/ecosse3/nvim/commit/e327ed8d9151cf631b7b588e477db3e81156025a))
* **plugins:** add cmp cmdline & add buffer completion options ([597c8fc](https://github.com/ecosse3/nvim/commit/597c8fc10737ca4fc419e60320a2943b64bd9c8f))
* **plugins:** add nvim-spectre with <Leader>pr mapping to refactor ([fc5413d](https://github.com/ecosse3/nvim/commit/fc5413d228734fdd6c7b2ab6153788c3f9b0d3f5))
* **plugins:** add todo comments config and extra keywords ([a84fe78](https://github.com/ecosse3/nvim/commit/a84fe78f72fd78e296f94292d510c0b9b94d9c97))
* **plugins:** change nvim tree git icons & highlight ([8e7140b](https://github.com/ecosse3/nvim/commit/8e7140bed82a53ffd4504d14f07f44bd6dbb45f6))
* **settings:** use two signcolumns ([cfb8297](https://github.com/ecosse3/nvim/commit/cfb8297be0c8c4b24877956190634ef9a8fcaee8))


### Bug Fixes

* **colorscheme:** remove ui.float.highlight from EcoVim config & add manually for nightfly colorscheme ([0ff2843](https://github.com/ecosse3/nvim/commit/0ff28432b819995d7a4c3051c90148c46e82b3a9))
* **lsp:** add additional check of requiring nvim-lsp-installer.servers ([1bb6ceb](https://github.com/ecosse3/nvim/commit/1bb6ceb67c6b8db9b33ad84379d7135f370b4c77))
* **lsp:** make sure that cmp_nvim_lsp is loaded before updating capabilities for html ([cc78446](https://github.com/ecosse3/nvim/commit/cc784460908e9e3725c222f60806ac96e4b807ee))
* **plugins:** make telescope window default width & height ([9dc3051](https://github.com/ecosse3/nvim/commit/9dc30516b8ce689e92f817ffcc9f851c4f792a93))
* **plugins:** set cinnamon mappings manually ([2fa2a0f](https://github.com/ecosse3/nvim/commit/2fa2a0f7e4ceb163c662010d01a13f697c520690))
* **plugins:** use new cmp mapping api & window api ([6678703](https://github.com/ecosse3/nvim/commit/66787030d4e361b82e346a277e592346ba7d503c))
* **plugin:** use main branch instead of master for toggleterm ([c01b0f3](https://github.com/ecosse3/nvim/commit/c01b0f3c0d72506f78b1fa397749480767defa24))

## [1.4.0](https://github.com/ecosse3/nvim/compare/v1.3.0...v1.4.0) (2022-04-18)


### Features

* **cmp:** add config variable to select first item on enter in completion menu (false by default) ([44b0095](https://github.com/ecosse3/nvim/commit/44b00951a1a175cdc33103cc948d6fbc03c44988))
* **cmp:** update completion menu item colors ([2c099ed](https://github.com/ecosse3/nvim/commit/2c099ed06442b4f91e8e4bf374cd6d3303a1eb0f))
* **cmp:** use dev branch, new sorting options & popup decorations ([0220f99](https://github.com/ecosse3/nvim/commit/0220f99ef79d79f817b7039c42cafc955b289574))
* **colorscheme:** set great cmp highlights for tokyonight colorscheme ([349bccb](https://github.com/ecosse3/nvim/commit/349bccb4368261eb6dc1efc671afa0a092120b0e))
* **colorscheme:** use tokyonight as default EcoVim colorscheme ([55ad0e7](https://github.com/ecosse3/nvim/commit/55ad0e755154f7ace1bb318b002207e2227ecfae))
* **lsp:** add native autocmds support ([48fc971](https://github.com/ecosse3/nvim/commit/48fc97115e0f49ba351e66c2b55a1f16fdce0a9b))
* **lsp:** change error sign to filled for better visibility and consistency ([baf96c2](https://github.com/ecosse3/nvim/commit/baf96c2c0f826692c21053229b5e386087928e70))
* **lsp:** disable diagnostic inside node_modules file ([0f0f0d7](https://github.com/ecosse3/nvim/commit/0f0f0d7b814fde3d5d055a5f5000fb7b390416d3))
* **lsp:** use config to load lsp servers ([a079103](https://github.com/ecosse3/nvim/commit/a079103531d13da71077b74195141aec66fbcdc3))
* **plugins:** add cinnamon plugin for smooth scrolling ([e9a9fe5](https://github.com/ecosse3/nvim/commit/e9a9fe5ee314abcdab17fd5211d69e017c1049ef))
* **plugins:** add hlargs plugin ([60291c9](https://github.com/ecosse3/nvim/commit/60291c9aee9d53019f484dcfb11c1e856334b7c5))
* **plugins:** provide changeable patterns for rooter in EcoVim config ([b0c767f](https://github.com/ecosse3/nvim/commit/b0c767f5a4d5c26ea328f744da8740e5915d8c3b))
* **settings:** have a global statusline at the bottom instead of one for each window ([7152d7f](https://github.com/ecosse3/nvim/commit/7152d7fb8c1b50a2ae240e3ed3535576b9e0d698))
* **settings:** set max num of items in completion menu to 10 ([92de6d9](https://github.com/ecosse3/nvim/commit/92de6d98880f717b948ccb6112965c02d13a50a9))
* **telescope:** add multi-rg custom picker and use with default <S-P> mapping ([c48f74f](https://github.com/ecosse3/nvim/commit/c48f74fdb12ff58a37191cabdfd9d6e158d3eba5))
* **which-key:** increase resize value, remove balance windows map & rename code action ([3f4c4ac](https://github.com/ecosse3/nvim/commit/3f4c4ac513b91c496ac3a14ebebe3a1c1e9f6978))


### Bug Fixes

* **cmp:** add winhighlight for window completion menu ([21f1f64](https://github.com/ecosse3/nvim/commit/21f1f6451d0c262f4868079816599fe722d5dd34))
* **cmp:** provide better suggestions based on sources priorities & sorting ([10b55a7](https://github.com/ecosse3/nvim/commit/10b55a730f93163bc35841ab25e5f9c12a080cef))
* **cmp:** remove deprecated native_menu option from setup ([962b9b4](https://github.com/ecosse3/nvim/commit/962b9b4910c76b47d9e63a259020a7d320e6812c))
* **cmp:** use master branch of cmp ([8aed467](https://github.com/ecosse3/nvim/commit/8aed467949765d691a266e979f0f07c1b19c5bc8))
* **colorscheme:** change default red rainbow color of parenthesis to blue ([38a9f77](https://github.com/ecosse3/nvim/commit/38a9f778e9e0dfedb68ce8e33f26bde2dcff369b))
* **config:** wrap LSP servers with a `servers` key ([266a371](https://github.com/ecosse3/nvim/commit/266a3716c43c353402d9bcdaedd6e196d18f904f))
* **install:** do not update treesitter on plugins.lua run ([9006bb6](https://github.com/ecosse3/nvim/commit/9006bb6ddf75359418a27b1935cb7ae5828f2840))
* **lsp:** disable all lsp by default ([a16a9dd](https://github.com/ecosse3/nvim/commit/a16a9dd71f4005e8d5f970efa8ded68e7ab2b34b))
* **plugins:** do not hijack unnamed buffer (ex. dashboard) when opening ([993b344](https://github.com/ecosse3/nvim/commit/993b34412b746cc654c54376d3074fc6ef60c5c5))
* **plugins:** do not map <C-e> for editing in place inside nvim-tree ([6485cf2](https://github.com/ecosse3/nvim/commit/6485cf204f038a093c0c7191b281a8752d65e388))
* **plugins:** do not select first item in cmp menu automatically ([4e834de](https://github.com/ecosse3/nvim/commit/4e834de7b1c87bc82baafa2a86ab50c508cc0e35))
* **plugins:** do not use cached list for telescope repo ([745f52b](https://github.com/ecosse3/nvim/commit/745f52b4cac69112bf0da140ab4f0bbb58ce7cc4))
* **plugins:** remove default and deprecated config from dressing.lua ([035c9b4](https://github.com/ecosse3/nvim/commit/035c9b4e4e70da6651a6017ed9318ccf87edc00e))
* **plugins:** remove mpack rocks require from impatient.nvim ([f70ab85](https://github.com/ecosse3/nvim/commit/f70ab85ad54562cf5d4ded8e626ad0530cf188dd))
* **statusline:** change separator icons for line pos & fix spacing ([c4ffbe1](https://github.com/ecosse3/nvim/commit/c4ffbe1c295a53fd3f0108b11a26f977cd3a60f0))
* **telescope:** update multi-rg aliases ([b638c2c](https://github.com/ecosse3/nvim/commit/b638c2c5a43cbf0b9f1dda93cafcd4e3e0b4ef7b))
* **treesitter:** disable indent what fixes a lot of indentation issues in TSX ([028026c](https://github.com/ecosse3/nvim/commit/028026c226d76bc746a4c883a41a48f39ecfe394))

## [1.3.0](https://github.com/ecosse3/nvim/compare/v1.2.0...v1.3.0) (2022-03-09)


### Features

* **lsp:** add native autocmds support ([48fc971](https://github.com/ecosse3/nvim/commit/48fc97115e0f49ba351e66c2b55a1f16fdce0a9b))
* **lsp:** change error sign to filled for better visibility and consistency ([baf96c2](https://github.com/ecosse3/nvim/commit/baf96c2c0f826692c21053229b5e386087928e70))
* **lsp:** disable diagnostic inside node_modules file ([0f0f0d7](https://github.com/ecosse3/nvim/commit/0f0f0d7b814fde3d5d055a5f5000fb7b390416d3))
* **lsp:** use config to load lsp servers ([a079103](https://github.com/ecosse3/nvim/commit/a079103531d13da71077b74195141aec66fbcdc3))
* **plugins:** provide changeable patterns for rooter in EcoVim config ([b0c767f](https://github.com/ecosse3/nvim/commit/b0c767f5a4d5c26ea328f744da8740e5915d8c3b))


### Bug Fixes

* **config:** wrap LSP servers with a `servers` key ([266a371](https://github.com/ecosse3/nvim/commit/266a3716c43c353402d9bcdaedd6e196d18f904f))
* **install:** do not update treesitter on plugins.lua run ([9006bb6](https://github.com/ecosse3/nvim/commit/9006bb6ddf75359418a27b1935cb7ae5828f2840))
* **lsp:** disable all lsp by default ([a16a9dd](https://github.com/ecosse3/nvim/commit/a16a9dd71f4005e8d5f970efa8ded68e7ab2b34b))
* **plugins:** do not hijack unnamed buffer (ex. dashboard) when opening ([993b344](https://github.com/ecosse3/nvim/commit/993b34412b746cc654c54376d3074fc6ef60c5c5))
* **plugins:** do not map <C-e> for editing in place inside nvim-tree ([6485cf2](https://github.com/ecosse3/nvim/commit/6485cf204f038a093c0c7191b281a8752d65e388))
* **plugins:** remove default and deprecated config from dressing.lua ([035c9b4](https://github.com/ecosse3/nvim/commit/035c9b4e4e70da6651a6017ed9318ccf87edc00e))
* **plugins:** remove mpack rocks require from impatient.nvim ([f70ab85](https://github.com/ecosse3/nvim/commit/f70ab85ad54562cf5d4ded8e626ad0530cf188dd))

### [1.2.1](https://github.com/ecosse3/nvim/compare/v1.2.0...v1.2.1) (2022-02-15)


### Bug Fixes

* **install:** do not update treesitter on plugins.lua run ([8771105](https://github.com/ecosse3/nvim/commit/8771105ef9bc6bd2f9663f10307a56f903a5afe9))
* **plugins:** remove mpack rocks require from impatient.nvim ([4235ad7](https://github.com/ecosse3/nvim/commit/4235ad71c3ff3e32fd6edce062d1ba3f71254eea))

## [1.2.0](https://github.com/ecosse3/nvim/compare/v1.1.1...v1.2.0) (2022-02-10)


### Features

* **blame:** add custom git blame functionality of whole file with commit checking ([9841fe5](https://github.com/ecosse3/nvim/commit/9841fe59a30a04cf7a8d393900702a0e1639d7f7))
* **colorscheme:** clear StatusLine bg for Tokyonight ([60304dc](https://github.com/ecosse3/nvim/commit/60304dc43d64bded57618c77ddb55a041cc1f9dc))
* **keymappings:** add "gb" map for git blame open, q to close inside ([7aa40b4](https://github.com/ecosse3/nvim/commit/7aa40b40aeac314dcd4658350286960e0caac217))
* **keymappings:** add signature help mapping to <C-k> ([e2a5737](https://github.com/ecosse3/nvim/commit/e2a5737ee050db49d3eff565a4baeb4dee4b3125))
* **lsp:** add filetypes opts for Vue and set to vue, javascript by default ([2182853](https://github.com/ecosse3/nvim/commit/2182853773a9a9130e7e704f03cca1b479cd7526))
* **lsp:** add lsp codes & diagnostic source information formats to LSP ([c79e565](https://github.com/ecosse3/nvim/commit/c79e5658d99c84b787d343b9c3909c556fc94ccc))
* **lsp:** refactor vue -> vue2 ([7d573d7](https://github.com/ecosse3/nvim/commit/7d573d7c20af404b971304743b522e23e0c20060))
* **lsp:** use HTML syntax highlighting in template for Vue.js by Treesitter ([4e06266](https://github.com/ecosse3/nvim/commit/4e06266a60f605aa464cd62601b9d44f046548d0))
* **plugins:** add vim-rooter & do not update cwd by nvim-tree ([4a50259](https://github.com/ecosse3/nvim/commit/4a50259082b14b22ee223b65ffe08b894db5a7e6))
* **plugins:** enhancement in autopairs plugin config ([9d98b7c](https://github.com/ecosse3/nvim/commit/9d98b7cbc8e3f76a34ffa069386c43f6bb7a9c9c))
* **tree:** enable update_cwd option in Nvim Tree ([f79d667](https://github.com/ecosse3/nvim/commit/f79d6678ec8c5a775d398f78c3bd474556fa2a7b))
* **utils:** add git functions ([50095ae](https://github.com/ecosse3/nvim/commit/50095ae8c602710325fca32b41e34ff5fd910514))
* **utils:** add globals functions to debug ([5c15c11](https://github.com/ecosse3/nvim/commit/5c15c11bcb62ae04d7d5533b3937a2d30072c62f))
* **utils:** refactor utils to utils/init and add couple new functions ([6a6a341](https://github.com/ecosse3/nvim/commit/6a6a341c2eae276814838124eb30a20aee80eb77))


### Bug Fixes

* **colorscheme:** float colors for Tokyonight theme ([93a6c91](https://github.com/ecosse3/nvim/commit/93a6c9174c14e673c1f1e8cb6a880e01892277c2))
* **colorscheme:** link comment highlight to GitSignsCurrentLineBlame in Tokyonight theme ([6457cf6](https://github.com/ecosse3/nvim/commit/6457cf635a4a2e9631fbaa5e0db216b53543ded2))
* **keymappings:** change <C-k> map of signature help to L cause of conflicting mapping ([41ade5d](https://github.com/ecosse3/nvim/commit/41ade5db5cf5c0b10f41f6e867452994b0d83191))
* **lsp:** change signs icons and make them work ([4abe5bc](https://github.com/ecosse3/nvim/commit/4abe5bccf8e569b49cc01281f57b6d08457aeda1))

### [1.1.1](https://github.com/ecosse3/nvim/compare/v1.1.0...v1.1.1) (2022-02-02)


### Bug Fixes

* **colorscheme:** make telescope windows transparent in Tokyonight ([47843b0](https://github.com/ecosse3/nvim/commit/47843b01a42eedb88ecabe401bc1bc4a0064f511))
* **lsp:** require graphql settings in installer ([55f733b](https://github.com/ecosse3/nvim/commit/55f733b84e2735aeac422a3dd2e49d42a586b7b8))
* **plugins:** disable space and eol chars & sort indent_blankline options ([2476e93](https://github.com/ecosse3/nvim/commit/2476e932364a5c8824e229b77aff8f65f7e7eccf))
* **plugins:** indent_blankline uses default char symbol for now, so it doesn't break between macOS & Linux ([9c06bc6](https://github.com/ecosse3/nvim/commit/9c06bc6a7f067d0b0576c9644d80ba1b98b35d64))

## [1.1.0](https://github.com/ecosse3/nvim/compare/v1.0.0...v1.1.0) (2022-01-27)


### Features

* **colorscheme:** link line number color to comment in TOKYO NIGHT & VertSplit and Galaxyline background to same color as nvim tree ([fc03882](https://github.com/ecosse3/nvim/commit/fc03882cb516cd2d518a57dd4839f611515642be))
* **plugins:** switch glow.nvim to markdown-preview.nvim ([2a1cf2a](https://github.com/ecosse3/nvim/commit/2a1cf2a0f26acdea089f2dfc2aaeae5131899bde))


### Bug Fixes

* **keymaps:** diagnostics & code action mappings of trouble & telescope ([9b7bf6e](https://github.com/ecosse3/nvim/commit/9b7bf6ecf449b4ba6e0dbb928395a6c89e57f43a))
* remove use_internal_diff from gitsigns config since its deprecated ([c8c0ac8](https://github.com/ecosse3/nvim/commit/c8c0ac87b73f2bcae5ef5bdb3a52f5bd057481f9))
* update gitsigns config ([4833c42](https://github.com/ecosse3/nvim/commit/4833c4289aac5476528e4b9ba8565705989139e6))


### Others

* add configuration file for conventional changelog ([e0bd3ea](https://github.com/ecosse3/nvim/commit/e0bd3ea4a55eecdb031fda57b2e04611310d7cab))
* remove vim-codepainter plugin ([31e3277](https://github.com/ecosse3/nvim/commit/31e3277686cafcee44bef2b706999c108efe7829))
* **trouble:** fix toggle and config ([4f21bac](https://github.com/ecosse3/nvim/commit/4f21bac6f5ec486ffd5acdc0fbb71f98a544915c))
