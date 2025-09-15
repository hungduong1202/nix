-- ~/.config/nvim/lua/config/colorscheme.lua
local M = {}

local path = vim.fn.stdpath("data") .. "/colorscheme.txt"
M.current = "tokyonight-moon" -- fallback

function M.set(scheme)
  print(path)
  local ok = pcall(vim.cmd.colorscheme, scheme)

  print(path)
  if ok then
    M.current = scheme
    local f = io.open(path, "w")
    if f then
      f:write(scheme)
      f:close()
    end
  else
    vim.notify("Invalid colorscheme: " .. scheme, vim.log.levels.ERROR)
  end
end

function M.load()
  local f = io.open(path, "r")
  if f then
    local name = f:read("*l")
    f:close()
    if name then
      M.set(name)
    end
  end
end

return M
