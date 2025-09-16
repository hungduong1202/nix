require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<S-l>", "<cmd>bn<cr>")

map("n", "<S-h>", "<cmd>bp<cr>")

map("n", "<leader>bb", "<C-^>")

map("n", "<leader>bd", "<cmd>bd<cr>")

map("n", "<leader>q", function()
  -- kiểm tra buffer chưa lưu
  local modified = vim.fn.getbufinfo { bufmodified = 1 }
  if #modified == 0 then
    vim.cmd "qa"
    return
  end

  -- nếu có buffer unsaved thì hiện popup
  local choices = {
    {
      label = "Save & Quit",
      action = function()
        vim.cmd "wa | qa"
      end,
    },
    {
      label = "Quit without Saving",
      action = function()
        vim.cmd "qa!"
      end,
    },
    { label = "Cancel", action = function() end },
  }

  vim.ui.select(choices, {
    prompt = "You have unsaved changes. What do you want to do?",
    format_item = function(item)
      return item.label
    end,
  }, function(choice)
    if choice then
      choice.action()
    end
  end)
end)

map("i", "jj", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")j
