return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<Leader>H", function() require("harpoon"):list():add() end, desc = "Harpoon add" },
      { "<Leader>h", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Harpoon menu" },
      { "<Leader>1", function() require("harpoon"):list():select(1) end, desc = "Harpoon 1" },
      { "<Leader>2", function() require("harpoon"):list():select(2) end, desc = "Harpoon 2" },
      { "<Leader>3", function() require("harpoon"):list():select(3) end, desc = "Harpoon 3" },
      { "<Leader>4", function() require("harpoon"):list():select(4) end, desc = "Harpoon 4" },
      { "<Leader>[", function() require("harpoon"):list():prev() end, desc = "Harpoon prev" },
      { "<Leader>]", function() require("harpoon"):list():next() end, desc = "Harpoon next" },
    },
    config = function()
      require("harpoon"):setup()
    end
  },
}
