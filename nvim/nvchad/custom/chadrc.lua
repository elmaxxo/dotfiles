---@type ChadrcConfig
local M = {}
M.plugins = 'custom.plugins'
M.mappings = require 'custom.mappings'
M.ui = {
  theme = 'gruvbox',
  hl_override = {
    -- less aggressive Constant
    Constant = { fg = "orange" },
    Comment = { link = "Special" },
    rustIdentifier = { fg = "white" },
  },
}
return M
