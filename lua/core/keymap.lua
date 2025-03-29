-- Setting leader key
 
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap


keymap.set({"n", "i"}, "<leader>w", "<cmd>update<CR>", {silent = true, desc = "save buffer"})
keymap.set("n", "<leader>q", "q<CR>", {desc = "Quit file"})
