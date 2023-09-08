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

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<A-h>", "<C-w>h", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<A-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<A-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
vim.keymap.set("n", "<A-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Reload config
vim.keymap.set("n", "<leader>sv", ":luafile $MYVIMRC", { desc = "Reload lua config file" })

-- Run DBUI
vim.keymap.set("n", "<leader>vb", ":DBUIToggle", { desc = "Toggle DBUI" })

vim.keymap.set("n", "<leader>fl", function()
  require("telescope").extensions.flutter.commands()
end)
