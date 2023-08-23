-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {
  desc = "Go to cwd",
})

vim.keymap.set(
  "n",
  "<leader>sx",
  require("telescope.builtin").resume,
  { noremap = true, silent = true, desc = "Opens last telescope" }
)

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

--Navigating to half of page and centering
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move down half page centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move down half page centered" })
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- -- Map Control + U to switch to the left window
vim.api.nvim_set_keymap("n", "<C-g>", "<C-w>h", { noremap = true, silent = true })
-- -- Map Control + P to switch to the right window
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>l", { noremap = true, silent = true })

-- Reload config
vim.keymap.set("n", "<leader>sv", ":luafile $MYVIMRC", { desc = "Reload lua config file" })

vim.keymap.set("n", "<leader>fl", function()
  require("telescope").extensions.flutter.commands()
end)
