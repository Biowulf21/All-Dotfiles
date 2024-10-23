return {
	"cbochs/grapple.nvim",
	opts = {
		scope = "git", -- also try out "git_branch"
		icons = true, -- setting to "true" requires "nvim-web-devicons"
		status = true,
	},
	keys = {
		{ "<leader>A", "<cmd>Grapple toggle<cr>", desc = "Tag a file" },
		{ "<leader>ha", "<cmd>Grapple toggle_tags<cr>", desc = "Toggle tags menu" },

		{ "<leader>1", "<cmd>Grapple select index=1<cr>", desc = "Select first tag" },
		{ "<leader>2", "<cmd>Grapple select index=2<cr>", desc = "Select second tag" },
		{ "<leader>3", "<cmd>Grapple select index=3<cr>", desc = "Select third tag" },
		{ "<leader>4", "<cmd>Grapple select index=4<cr>", desc = "Select fourth tag" },
		{ "<leader>5", "<cmd>Grapple select index=5<cr>", desc = "Select fifth tag" },

		{ "<leader>hn", "<cmd>Grapple cycle_tags next<cr>", desc = "Go to next tag" },
		{ "<leader>hb", "<cmd>Grapple cycle_tags prev<cr>", desc = "Go to previous tag" },
	},
}
