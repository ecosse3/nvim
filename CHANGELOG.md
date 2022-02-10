# Changelog

All notable changes to this project will be documented in this file. See [standard-version](https://github.com/conventional-changelog/standard-version) for commit guidelines.

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
