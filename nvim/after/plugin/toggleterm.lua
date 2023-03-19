require("toggleterm").setup({
    size = 20,
    direction="horizontal",
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    persist_size = true,
    close_on_exit = true,
    float_opts = {
        border = 'curved',
        width = 160,
        height = 35,
        winblend = 3,
        highlights = {
            border = "Normal",
            background = "Normal",
        }
    }
})
