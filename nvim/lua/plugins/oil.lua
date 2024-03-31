return { -- Edit your filesystem like a normal Neovim buffer.
	"stevearc/oil.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "<leader>-", ":Oil<CR>", desc = "[O]pen [I]nteractive [L]ist" },
	},
}
