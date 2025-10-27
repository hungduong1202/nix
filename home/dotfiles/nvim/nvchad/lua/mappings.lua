require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del

local function del(mode, keys)
  pcall(vim.keymap.del, mode, keys)
end

map("i", "jk", "<ESC>")

map("c", ";", "<ESC>")

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<S-l>", "<cmd>bnext<CR>")

map("n", "<S-h>", "<cmd>bprev<CR>")

map("n", "<leader>bb", "<C-^>")

map("n", "<leader>bd", "<cmd>bd<cr>")

map("n", "<C-a>", "ggVG")

-- map("n", "<leader>e", "<cmd>Neotree toggle<CR>")

map("n", "<leader><leader>", "<cmd>Telescope find_files<CR>")

map("n", "<leader>sk", "<cmd>Telescope keymaps<CR>")

map("n", "<leader>/", "<cmd>Telescope live_grep<CR>")

del("n", "<leader>ra")
nomap("n", "<leader>e")

local function floating_rename()
  local curr_name = vim.fn.expand "<cword>"

  vim.ui.input({ prompt = "Rename To: ", default = curr_name }, function(new_name)
    if new_name and #new_name > 0 and new_name ~= curr_name then
      vim.lsp.buf.rename(new_name)
    end
  end)
end

vim.keymap.set("n", "<leader>cr", floating_rename, { desc = "Floating LSP Rename" })
