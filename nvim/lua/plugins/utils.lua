return {
	{ -- Split and Toggle lines of code
		"Wansmer/treesj",
		keys = {
			{ "<space>tst", "<cmd>TSJToggle<CR>", desc = "[T]ree [S]itter [T]oggle" },
			{ "<space>tss", "<cmd>TSJSplit<CR>", desc = "[T]ree [S]itter [S]plit" },
			{ "<space>tsj", "<cmd>TSJJoin<CR>", desc = "[T]ree [S]itter [J]oin" },
		},
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesj").setup({--[[ your config ]]
			})
		end,
	},
	-- Highlight todo, notes, etc in comments
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{ -- Statusline for Neovim
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({--[[ your config ]]
			})
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	{
		"voldikss/vim-floaterm",
		keys = {
			{ "<leader>ft", "<cmd>FloatermToggle<CR>", desc = "[F]loat [T]erm" },
		},
	},
}
