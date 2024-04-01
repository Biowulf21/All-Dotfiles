return {
  "SmiteshP/nvim-navbuddy",
  dependencies = {
    "neovim/nvim-lspconfig",
    "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>nv", function() end, desc = "NavBuddy" },
    { "<leader>nv", "<cmd>Navbuddy<cr>", desc = "NavBuddy" },
  },
  lazy = false,
  enabled = true,
  config = function()
    local actions = require("nvim-navbuddy.actions")
    local navbuddy = require("nvim-navbuddy")
    navbuddy.setup({
      window = {
        border = "double",
      },
      mappings = {
        ["j"] = actions.next_sibling, -- down
        ["k"] = actions.previous_sibling, -- up

        ["h"] = actions.parent, -- Move to left panel
        ["l"] = actions.children, -- Move to right panel
      },
      lsp = { auto_attach = true, preference = "nvim_lsp" },
    })
  end,
}
