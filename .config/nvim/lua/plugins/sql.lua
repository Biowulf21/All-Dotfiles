return {
	{ "tpope/vim-dadbod" },
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod", lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", lazy = true, ft = { "sql", "mysql", "plsql" } },
		},
		lazy = false,
	},
}
