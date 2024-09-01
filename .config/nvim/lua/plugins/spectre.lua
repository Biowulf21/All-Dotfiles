return {
	"nvim-pack/nvim-spectre",
	build = false,
	cmd = "Spectre",
	opts = { open_cmd = "noswapfile vnew" },
    -- stylua: ignore
    keys = {
      { "<leader>St", function() require("spectre").toggle() end, desc = "[S]pectre [T]oggle" },
    },
}
