-- vim.cmd("highlight Normal guibg=#00000070")

return {
  {
    "mcchrish/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = { "rktjmp/lush.nvim" },
    name = "zenbones",
  },

  { "catppuccin/nvim", name = "catppuccin", lazy = false },
  { "ful1e5/onedark.nvim", name = "onedark" },
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    opts = {
      tranparent = true,
    },
    config = function()
      require("kanagawa").setup({
        transparent = true,
        theme = "dragon",
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa-dragon",
    },
  },
}
