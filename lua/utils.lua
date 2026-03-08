local M = {}

local vault_path = vim.fn.expand("~/obsidian/dc-obsidian-personnal/")

M.is_obsidian_available = function ()
  return vim.fn.isdirectory(vault_path) == 1
end

return M
