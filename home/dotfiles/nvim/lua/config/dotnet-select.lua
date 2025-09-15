local Snacks = require("snacks")

local dotnet_cmds = {
  { label = "dotnet build", cmd = { "dotnet", "build" } },
  { label = "dotnet run", cmd = { "dotnet", "run" } },
  { label = "dotnet test", cmd = { "dotnet", "test" } },
  { label = "dotnet watch run", cmd = { "dotnet", "watch", "run" } },
}

local M = {}

M.DotnetSelect = function()
  vim.ui.select(dotnet_cmds, {
    prompt = ".NET commands:",
    format_item = function(item)
      return item.label
    end,
  }, function(choice)
    if choice and choice.cmd then
      Snacks.terminal(choice.cmd, { cwd = LazyVim.root() })
    else
      vim.notify("⚠️ Không chọn gì hoặc cmd nil", vim.log.levels.WARN)
    end
  end)
end

return M
