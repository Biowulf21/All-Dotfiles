local builtin = require('telescope.builtin')
require("telescope").load_extension("flutter")

require("flutter-tools").setup {} -- use defaults

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.live_grep, {})
vim.keymap.set('n', '<leader>pf', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ")});
vim.keymap.set('n', '<leader>bb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fl', builtin.help_tags, {})

end)


