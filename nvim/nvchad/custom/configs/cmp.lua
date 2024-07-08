local M = require "plugins.configs.cmp"
local cmp = require "cmp"
M.completion.completeopt = "menu,menuone,noselect"
M.preselect = cmp.PreselectMode.None

M.sources = {
  {
    name = "nvim_lsp",
    --get rid of snippets
    entry_filter = function(entry)
      return cmp.lsp.CompletionItemKind.Snippet ~= entry:get_kind()
    end,
  },
  { name = "path" },
}

return M
