-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

local map = vim.keymap.set

map("i", "jj", "<ESC>")

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<S-l>", "<cmd>bn<cr>")

map("n", "<S-h>", "<cmd>bp<cr>")

map("n", "<leader>bb", "<C-^>")

map("n", "<leader>bd", "<cmd>bd<cr>")

-- PICK & SAVE COLORSCHEME --
