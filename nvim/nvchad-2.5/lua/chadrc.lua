-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :( 

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

M.base46 = {
	theme = "gruvbox",

	hl_override = {
		Comment = { link = "Special" },
    Constant = { fg = "orange" },
		["@comment"] = { italic = true },
	},
}

return M
