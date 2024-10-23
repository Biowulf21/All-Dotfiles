return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					auto_trigger = true,
				},
			})
		end,
	},
	{

		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		opts = {
			debug = true, -- Enable debugging

			window = {
				layout = "float",
				relative = "editor",
				width = 0.5,
				height = 0.8,
				border = "rounded",
			},
			mappings = {
				complete = {
					detail = "Use @<Tab> or /<Tab> for options.",
					insert = "<Tab>",
				},
				close = {
					normal = "q",
					insert = "<C-c>",
				},
				reset = {
					normal = "<leader>cr",
					insert = "<leader>cr",
				},
				submit_prompt = {
					normal = "<CR>",
					insert = "<C-s>",
				},
				accept_diff = {
					normal = "<C-y>",
					insert = "<C-y>",
				},
				yank_diff = {
					normal = "gy",
				},
				show_diff = {
					normal = "gd",
				},
				show_system_prompt = {
					normal = "gp",
				},
				show_user_selection = {
					normal = "gs",
				},
			},
			-- See Configuration section for rest
		},
		lazy = false,
		keys = {
			{ "<leader>cc", "<cmd>CopilotChatToggle<CR>", desc = "[C]opilot [C]hat" },
			-- 	{ "<leader>cr", "<cmd>CopilotChatReset<CR>", desc = "[C]opilot [R]eset" },
		},
	},
}
