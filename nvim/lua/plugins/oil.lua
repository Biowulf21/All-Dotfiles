return { -- Edit your filesystem like a normal Neovim buffer.
	"stevearc/oil.nvim",
	opts = {
		columns = { "permissions", "size", "mtime" },
	},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "<leader>-", ":Oil<CR>", desc = "[O]pen [I]nteractive [L]ist" },
	},
}
