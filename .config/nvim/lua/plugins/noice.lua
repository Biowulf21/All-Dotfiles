return {

	{

		"rcarriga/nvim-notify",
		opts = {
			background_colour = "#000000",
		},
	},
	{

		"folke/noice.nvim",
		-- event = "VeryLazy",
		-- enabled = false,
		config = function()
			require("noice").setup({
				lsp = {
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = false, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
				},
				routes = {
					{
						view = "notify",
						filter = { event = "msg_show", kind = "", find = "written" },
						opts = {

							skip = true,
						},
					},
				},

				notify = {
					enabled = true,
				},
				views = {
					cmdline_popup = {
						position = {
							row = 5,
							col = "50%",
						},
						size = {
							width = 60,
							height = "auto",
						},
					},
					popupmenu = {
						relative = "editor",
						position = {
							row = 8,
							col = "50%",
						},
						size = {
							width = 60,
							height = 10,
						},
						border = {
							style = "rounded",
							padding = { 0, 1 },
						},
						win_options = {
							winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
						},
					},
				},
			})
		end,
		opts = {
			-- add any options here
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},
}
