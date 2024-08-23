return {
  {
    "zbirenbaum/copilot.lua",
    cond = EcoVim.plugins.ai.copilot.enabled,
    lazy = false,
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    }
  },
}
