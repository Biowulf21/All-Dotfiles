return {
  "SmiteshP/nvim-navbuddy",
  dependencies = {
    "neovim/nvim-lspconfig",
    "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>nn", "<cmd>Navbuddy<cr>", desc = "NavBuddy" },
  },
  config = function()
    local actions = require("nvim-navbuddy.actions")
    local navbuddy = require("nvim-navbuddy")
    navbuddy.setup({
      window = {
        border = "double",
      },
      mappings = {
        ["k"] = actions.next_sibling,
        ["i"] = actions.previous_sibling,
        ["j"] = actions.parent,
        ["l"] = actions.children,
      },
      lsp = { auto_attach = true },
    })
  end,
}
