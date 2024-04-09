return {
	"mistricky/codesnap.nvim",
	build = "make",
	config = function()
		require("codesnap").setup({
			has_breadcrumbs = true,
			bg_theme = "bamboo",
		})
	end,

	keys = {
		{ "<leader>CC", "<cmd>CodeSnap<CR>", desc = "[C]opy [C]ode" },
	},
	lazy = false,
}
