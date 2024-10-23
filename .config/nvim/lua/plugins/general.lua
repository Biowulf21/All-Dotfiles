return {
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
	{
		"echasnovski/mini.ai",
		version = false,
		config = function()
			require("mini.ai").setup({ n_lines = 500 })
		end,
	},

	{
		"echasnovski/mini.surround",
		version = false,
		opts = {
			mappings = {
				add = "gza", -- Add surrounding in Normal and Visual modes
				delete = "gzd", -- Delete surrounding
				find = "gzf", -- Find surrounding (to the right)
				find_left = "gzF", -- Find surrounding (to the left)
				highlight = "gzh", -- Highlight surrounding
				replace = "gzr", -- Replace surrounding
				update_n_lines = "gzn", -- Update `n_lines`
			},
		},
	},
	{ "echasnovski/mini.cursorword", version = false },
	{ "echasnovski/mini.move", version = false },

	{ -- Useful plugin to show you pending keybinds.
		"folke/which-key.nvim",
		event = "VimEnter", -- Sets the loading event to 'VimEnter'
		keys = {
			{ "<leader>c", group = "[C]ode" },
			{ "<leader>c_", hidden = true },
			{ "<leader>d", group = "[D]ocument" },
			{ "<leader>d_", hidden = true },
			{ "<leader>r", group = "[R]ename" },
			{ "<leader>r_", hidden = true },
			{ "<leader>s", group = "[S]earch" },
			{ "<leader>s_", hidden = true },
			{ "<leader>w", group = "[W]orkspace" },
			{ "<leader>w_", hidden = true },
		},
	},

	{ "moll/vim-bbye" }, -- Better closing of buffers
}
