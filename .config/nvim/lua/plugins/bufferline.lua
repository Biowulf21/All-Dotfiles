-- Tabs for Neovim
return {
	"akinsho/nvim-bufferline.lua",
	requires = "kyazdani42/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				separator_style = "slant",
				always_show_bufferline = true,

				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						text_align = "center",
					},
				},
			},
		})
	end,
	lazy = false,
	keys = {
		{ "<A-1>", "<cmd>BufferLineGoToBuffer 1<CR>", desc = "Go to buffer 1" },
		{ "<A-2>", "<cmd>BufferLineGoToBuffer 2<CR>", desc = "Go to buffer 2" },
		{ "<A-3>", "<cmd>BufferLineGoToBuffer 3<CR>", desc = "Go to buffer 3" },
		{ "<A-4>", "<cmd>BufferLineGoToBuffer 4<CR>", desc = "Go to buffer 4" },
		{ "<C-S-L>", "<cmd>BufferLineCycleNext<CR>", desc = "Go to next buffer" },
		{ "<C-S-H>", "<cmd>BufferLineCyclePrev<CR>", desc = "Go to previous buffer" },
	},
}
