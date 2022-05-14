# Changelog

All notable changes to this project will be documented in this file. See [standard-version](https://github.com/conventional-changelog/standard-version) for commit guidelines.

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
