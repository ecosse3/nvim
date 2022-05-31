local present, ls = pcall(require, "luasnip")
if not present then
  return
end

local fmt = require("luasnip.extras.fmt").fmt
local snippet = ls.snippet
local insert_node = ls.insert_node
local function_node = ls.function_node
local dynamic_node = ls.dynamic_node
local snippet_node = ls.snippet_node
local rep = require("luasnip.extras").rep

-- Get a list of  the property names given an `interface_declaration`
-- treesitter *tsx* node.
-- Ie, if the treesitter node represents:
--   interface {
--     prop1: string;
--     prop2: number;
--   }
-- Then this function would return `{"prop1", "prop2"}
---@param id_node {} Stands for "interface declaration node"
---@return string[]
local function get_prop_names(id_node)
  local object_type_node = id_node:child(2)
  if object_type_node:type() ~= "object_type" then
    return {}
  end

  local prop_names = {}

  for prop_signature in object_type_node:iter_children() do
    if prop_signature:type() == "property_signature" then
      local prop_iden = prop_signature:child(0)
      local prop_name = vim.treesitter.query.get_node_text(prop_iden, 0)
      prop_names[#prop_names + 1] = prop_name
    end
  end

  return prop_names
end

ls.add_snippets("typescriptreact", {
  snippet(
    "comp",
    fmt(
      [[
{}interface {}Props {{
  {}
}}

export const {} = ({{ {} }}: {}Props) => {{
  return {};
}};
]]     ,
      {
      insert_node(1, "export "),

      -- Initialize component name to file name
      dynamic_node(2, function(_, snip)
        local dirname = vim.fn.expand("%"):match "([^/]+)/[^/]+$"
        local filename = vim.fn.expand("%:t")
        if filename == 'index.tsx' then
          return snippet_node(nil, {
            insert_node(1, dirname),
          })
        end

        return snippet_node(nil, {
          insert_node(1, vim.fn.substitute(snip.env.TM_FILENAME, "\\..*$", "", "g")),
        })
      end, { 1 }),
      insert_node(3, "// Props"),
      dynamic_node(4, function(_, snip)
        local dirname = vim.fn.expand("%"):match "([^/]+)/[^/]+$"
        local filename = vim.fn.expand("%:t")
        if filename == 'index.tsx' then
          return snippet_node(nil, {
            insert_node(1, dirname),
          })
        end

        return snippet_node(nil, {
          insert_node(1, vim.fn.substitute(snip.env.TM_FILENAME, "\\..*$", "", "g")),
        })
      end, { 1 }),
      function_node(function(_, snip, _)
        local pos_begin = snip.nodes[6].mark:pos_begin()
        local pos_end = snip.nodes[6].mark:pos_end()
        local parser = vim.treesitter.get_parser(0, "tsx")
        local tstree = parser:parse()

        local node = tstree[1]
            :root()
            :named_descendant_for_range(pos_begin[1], pos_begin[2], pos_end[1], pos_end[2])

        while node ~= nil and node:type() ~= "interface_declaration" do
          node = node:parent()
        end

        if node == nil then
          return ""
        end

        -- `node` is now surely of type "interface_declaration"
        local prop_names = get_prop_names(node)

        -- Does this lua->vimscript->lua thing cause a slow down? Dunno.
        return vim.fn.join(prop_names, ", ")
      end, { 3 }),
      rep(2),
      insert_node(5, "null"),
    }
    )
  ),
})
