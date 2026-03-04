return {
  "Wansmer/symbol-usage.nvim",
  event = "LspAttach",
  config = function()
    local SymbolKind = vim.lsp.protocol.SymbolKind

    local function text_format(symbol)
      local fragments = {}

      if symbol.references then
        local usage = symbol.references <= 1 and "usage" or "usages"
        local num = symbol.references == 0 and "no" or symbol.references
        table.insert(fragments, ("%s %s"):format(num, usage))
      end

      if symbol.definition then
        table.insert(fragments, symbol.definition .. " defs")
      end

      if symbol.implementation then
        table.insert(fragments, symbol.implementation .. " impls")
      end

      local stacked = symbol.stacked_count > 0
          and (" | +%s"):format(symbol.stacked_count)
          or ""

      return table.concat(fragments, ", ") .. stacked
    end

    require("symbol-usage").setup({
      hl = { link = "Comment" },
      vt_position = "above",
      kinds = {
        SymbolKind.Function,
        SymbolKind.Method,
        SymbolKind.Class,
        SymbolKind.Interface,
        SymbolKind.Module,
      },
      references = { enabled = true, include_declaration = false },
      definition = { enabled = false },
      implementation = { enabled = true },
      text_format = text_format,
      request_pending_text = false,
    })
  end,
  keys = {
    { "<leader>cu", function() require("symbol-usage").toggle() end, desc = "Toggle Symbol Usage" },
  },
}
