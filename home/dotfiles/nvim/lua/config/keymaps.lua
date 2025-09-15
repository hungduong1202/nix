-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.keymap.set("i", "jj", "<Esc>")

-- PICK & SAVE COLORSCHEME --
vim.keymap.set("n", "<leader>uC", function()
  -- Run the colorscheme picker
  Snacks.picker.colorschemes()

  -- Set up a one-time autocmd to trigger AFTER the colorscheme is applied
  vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
      local new_scheme = vim.g.colors_name
      require("config.colorscheme").set(new_scheme)
    end,
  })
end, { desc = "Pick & Save Colorscheme" })

local dotnet = require("config.dotnet-select")

vim.keymap.set("n", "<leader>dn", function()
  dotnet.DotnetSelect()
end, { desc = "Dotnet: Select Command" })
