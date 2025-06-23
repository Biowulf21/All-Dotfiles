return {
	"yetone/avante.nvim",
	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	-- ⚠️ must add this setting! ! !
	build = function()
		-- conditionally use the correct build system for the current OS
		if vim.fn.has("win32") == 1 then
			return "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
		else
			return "make"
		end
	end,
	event = "VeryLazy",
	version = false, -- Never set this value to "*"! Never!
	---@module 'avante'
	---@type avante.Config
	opts = {
		provider = "copilot",
		auto_suggestions_provider = "copilot",
		copilot = {
			model = "claude-4-sonnet",
		},
		openai = {
			endpoint = "https://api.githubcopilot.com",
			model = "", -- your desired model (or use gpt-4o, etc.)
			timeout = 30000, -- timeout in milliseconds
			temperature = 0, -- adjust if needed
			max_tokens = 4096,
			-- reasoning_effort = "high" -- only supported for reasoning models (o1, etc.)
		},
	},
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional,
		"echasnovski/mini.pick", -- for file_selector provider mini.pick
		"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
		"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
		"ibhagwan/fzf-lua", -- for file_selector provider fzf
		"stevearc/dressing.nvim", -- for input provider dressing
		"folke/snacks.nvim", -- for input provider snacks
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		"zbirenbaum/copilot.lua", -- for providers='copilot'
		{
			-- support for image pasting
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				-- recommended settings
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					-- required for Windows users
					use_absolute_path = true,
				},
			},
		},
		{
			-- Make sure to set this up properly if you have lazy=true
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
-- return {
-- 	{
--
-- 		"CopilotC-Nvim/CopilotChat.nvim",
-- 		branch = "canary",
-- 		dependencies = {
-- 			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
-- 			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
-- 		},
-- 		opts = {
-- 			debug = true, -- Enable debugging
--
-- 			window = {
-- 				layout = "float",
-- 				relative = "editor",
-- 				width = 0.5,
-- 				height = 0.8,
-- 				border = "rounded",
-- 			},
-- 			mappings = {
-- 				complete = {
-- 					detail = "Use @<Tab> or /<Tab> for options.",
-- 					insert = "<Tab>",
-- 				},
-- 				close = {
-- 					normal = "q",
-- 					insert = "<C-c>",
-- 				},
-- 				reset = {
-- 					normal = "<leader>cr",
-- 					insert = "<leader>cr",
-- 				},
-- 				submit_prompt = {
-- 					normal = "<CR>",
-- 					insert = "<C-s>",
-- 				},
-- 				accept_diff = {
-- 					normal = "<C-y>",
-- 					insert = "<C-y>",
-- 				},
-- 				yank_diff = {
-- 					normal = "gy",
-- 				},
-- 				show_diff = {
-- 					normal = "gd",
-- 				},
-- 				show_system_prompt = {
-- 					normal = "gp",
-- 				},
-- 				show_user_selection = {
-- 					normal = "gs",
-- 				},
-- 			},
-- 			-- See Configuration section for rest
-- 		},
-- 		lazy = false,
-- 		keys = {
-- 			{ "<leader>cc", "<cmd>CopilotChatToggle<CR>", desc = "[C]opilot [C]hat" },
-- 			-- 	{ "<leader>cr", "<cmd>CopilotChatReset<CR>", desc = "[C]opilot [R]eset" },
-- 		},
-- 	},
-- }
