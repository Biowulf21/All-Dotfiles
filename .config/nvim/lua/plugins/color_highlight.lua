return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup({
			"*",
			dart = { RRGGBBAA = true },
		})
	end,
}
