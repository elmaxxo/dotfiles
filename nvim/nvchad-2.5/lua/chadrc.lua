-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'gruvbox',
  hl_override = {
    -- less aggressive Constant
    Constant = { fg = "orange" },
    Comment = { link = "Special" },
    rustIdentifier = { fg = "white" },
  },
  statusline = {
    theme = "vscode_colored",
  },
}

return M
