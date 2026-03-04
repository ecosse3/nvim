-- Main LSP configuration setup using the new vim.lsp.config API
local ufo_utils = require("utils._ufo")
local ufo_config_handler = ufo_utils.handler

-- Setup default configs for all LSP clients
vim.lsp.config('*', {
    capabilities = (function()
        local blink_ok, blink = pcall(require, 'blink.cmp')
        local capabilities = blink_ok and blink.get_lsp_capabilities() or vim.lsp.protocol.make_client_capabilities()

        -- Improved folding support
        capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true
        }

        -- Enhanced semantic tokens
        capabilities.textDocument.semanticTokens = {
            dynamicRegistration = false,
            formats = { "relative" },
            multilineTokenSupport = true,
            overlappingTokenSupport = true,
            requests = {
                range = true,
                full = { delta = true }
            },
            tokenModifiers = {},
            tokenTypes = {}
        }

        return capabilities
    end)(),
    on_attach = function(client, bufnr)
        if EcoVim.lsp.inlay_hints then
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end
    end,
})

-- Load all the LSP server configurations from individual files
require("config.lsp.servers.lua_ls")
require("config.lsp.servers.jsonls")
require("config.lsp.servers.cssls")
require("config.lsp.servers.eslint")
require("config.lsp.servers.tailwindcss")
require("config.lsp.servers.vue_ls")
require("config.lsp.servers.html")
require("config.lsp.servers.bashls")
require("config.lsp.servers.graphql")
require("config.lsp.servers.prismals")
require("config.lsp.servers.denols")
require("config.lsp.servers.yamlls")

-- Load TypeScript server config based on user preference
-- tsgo is the default (experimental, fast); ts_ls is the stable alternative
if EcoVim.lsp.typescript_server == "ts_ls" then
    require("config.lsp.servers.ts_ls")
end

-- Setup UFO for folding
local ufo_ok, ufo = pcall(require, "ufo")
if ufo_ok then
    ufo.setup({
        fold_virt_text_handler = ufo_config_handler,
        close_fold_kinds_for_ft = { default = { "imports" } },
    })
end

-- Note: Server enabling is now handled by mason-lspconfig's automatic_enable feature
return {}
