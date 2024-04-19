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
  -- cmp themeing
  cmp = {
    icons = true,
    lspkind_text = false,
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
    border_color = "grey_fg", -- only applicable for "default" style, use color names from base30 variables
    selected_item_bg = "colored", -- colored / simple
  },
}
return M
