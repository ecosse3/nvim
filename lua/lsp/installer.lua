local lsp_installer = require("nvim-lsp-installer")

local on_attach = function(client, bufnr)
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end

lsp_installer.on_server_ready(function(server)
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

    local opts = {
        on_attach = on_attach,
        capabilities = capabilities,
    }

    if server.name == "eslint" then
        opts.on_attach = function (client, bufnr)
            -- neovim's LSP client does not currently support dynamic capabilities registration, so we need to set
            -- the resolved capabilities of the eslint server ourselves!
            client.resolved_capabilities.document_formatting = true
            on_attach(client, bufnr)
        end
        opts.settings = {
            format = { enable = true },
        }
    end

    if server.name == "tailwindcss" then
        opts.on_attach = function (client, bufnr)
            if client.server_capabilities.colorProvider then
                require"lsp/documentcolors".buf_attach(bufnr)
            end
            capabilities.textDocument.completion.completionItem.snippetSupport = true
            capabilities.textDocument.colorProvider = { dynamicRegistration = false }
            on_attach(client, bufnr)
        end
        opts.settings = {
            format = { enable = true }, -- this will enable formatting
        }
    end
    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
end)
