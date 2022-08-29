require("other-nvim").setup({
  mappings = {
    {
      pattern = "/(.*)/(.*)/.*.tsx$",
      target = {
        {
          target = "/%1/%2/%2Styled.ts",
          context = "Styled"
        },
        {
          target = "/%1/%2/interfaces.ts",
          context = "interface"
        }
      }
    }, {
      pattern = "/(.*)/(.*)/.*Styled.ts$",
      target = {
        {
          target = "/%1/%2/%2.tsx",
          context = "Component"
        },
        {
          target = "/%1/%2/interfaces.ts",
          context = "interface"
        }
      }
    }, {
      pattern = "/(.*)/(.*)/interfaces.ts$",
      target = {
        {
          target = "/%1/%2/%2.tsx",
          context = "Component"
        },
        {
          target = "/%1/%2/%2Styled.ts",
          context = "interface"
        }
      }
    }
  },
})
