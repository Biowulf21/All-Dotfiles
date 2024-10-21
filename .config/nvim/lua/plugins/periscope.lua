return {
	"mlp1802/periscope.nvim",
	name = "periscope",
	dependencies = {
		{ "nvim-tree/nvim-tree.lua" },
		{ "nvim-telescope/telescope.nvim" },
	},
	config = function()
		require("periscope").setup(true) --set to false if you don't want Periscope to start on startup
		-- vim.api.nvim_set_keymap("n", "<leader>pt", ":PeriscopeToggle<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>pn", ":PeriscopeNewTask<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>pd", ":PeriscopeDeleteCurrentTask<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>pr", ":PeriscopeRenameCurrentTask<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>pf", ":PeriscopeEnableFilter<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>pu", ":PeriscopeDisableFilter<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>pst", ":PeriscopeShowTasks<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>psf", ":PeriscopeShowFiles<CR>", { noremap = true, silent = true })
	end,
}
