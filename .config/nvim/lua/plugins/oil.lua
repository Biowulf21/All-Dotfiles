return { -- Edit your filesystem like a normal Neovim buffer.
	"stevearc/oil.nvim",
	opts = {
		columns = { "icon" },
	},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "<leader>-", ":Oil<CR>", desc = "[O]pen [I]nteractive [L]ist" },
	},
	config = function()
		require("oil").setup({
			view_options = {
				show_hidden = true,
			},
		})
	end,
}
