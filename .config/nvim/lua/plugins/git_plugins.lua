return {
	{
		"petertriho/nvim-scrollbar",
		config = function()
			require("scrollbar").setup({
				handle = {
					color = "grey",
				},
			})
		end,
	},
	{ -- Git Blame in Neovim
		"f-person/git-blame.nvim",
		opts = {
			message_template = "<author> • <summary> • <date>",
			date_format = "%r",
			message_when_not_committed = "Not committed yet",
			git_blame_delay = 500,
		},
	},
	{
		"kdheepak/lazygit.nvim", -- Lazygit for Neovim
		requires = {
			"nvim-lua/plenary.nvim",
		},
		-- config = function()
		-- 	require("lazygit").setup({})
		-- end,
		keys = {
			{ "<leader>lg", ":LazyGit<CR>", desc = "[L]azy[G]it" },
		},
	},
	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
}
