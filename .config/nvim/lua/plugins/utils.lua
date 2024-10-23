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
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{ -- Statusline for Neovim
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					globalstatus = true,
				},
			})
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	{
		"numToStr/FTerm.nvim",
		keys = {
			{ "<leader>ft", "<cmd>lua require('FTerm').toggle()<CR>", mode = { "n", "t" }, desc = "[F]loat [T]erm" },
		},
	},
	-- "gc" to comment visual regions/lines
	{ "numToStr/Comment.nvim", opts = {} },

	{
		"nvimtools/none-ls.nvim",
		config = function()
			require("null-ls").setup({})
		end,
	},
}
