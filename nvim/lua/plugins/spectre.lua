return {
	"nvim-pack/nvim-spectre",
	build = false,
	cmd = "Spectre",
	opts = { open_cmd = "noswapfile vnew" },
    -- stylua: ignore
    keys = {
      { "<leader>St", function() require("spectre").toggle() end, desc = "[S]pectre [T]oggle" },
      {"leader>Sf", function () require("spectre").open_file_search() end, desc = "[Spectre] open in [F]ile"}
    },
}
