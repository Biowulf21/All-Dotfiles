return {
	-- "catppuccin/nvim",
	"rebelot/kanagawa.nvim",
	priority = 1000,
	init = function()
		vim.cmd.colorscheme("kanagawa-dragon")
		vim.cmd.hi("Comment gui=none")
	end,
}
