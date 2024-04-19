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

-- fancy completion with adoption width
-- https://github.com/hrsh7th/nvim-cmp/discussions/609
M.formatting = {
  fields = { "abbr", "menu", "kind" },
  format = function(entry, item)
    -- Define menu shorthand for different completion sources.
    local menu_icon = {
      nvim_lsp = "NLSP",
      nvim_lua = "NLUA",
      luasnip  = "LSNP",
      buffer   = "BUFF",
      path     = "PATH",
    }
    -- Set the menu "icon" to the shorthand for each completion source.
    item.menu = menu_icon[entry.source.name]

    -- Set the fixed width of the completion menu to 60 characters.
    -- fixed_width = 20

    -- Set 'fixed_width' to false if not provided.
    fixed_width = fixed_width or false

    -- Get the completion entry text shown in the completion window.
    local content = item.abbr

    -- Set the fixed completion window width.
    if fixed_width then
      vim.o.pumwidth = fixed_width
    end

    -- Get the width of the current window.
    local win_width = vim.api.nvim_win_get_width(0)

    -- Set the max content width based on either: 'fixed_width'
    -- or a percentage of the window width, in this case 20%.
    -- We subtract 10 from 'fixed_width' to leave room for 'kind' fields.
    local max_content_width = fixed_width and fixed_width - 10 or math.floor(win_width * 0.2)

    -- Truncate the completion entry text if it's longer than the
    -- max content width. We subtract 3 from the max content width
    -- to account for the "..." that will be appended to it.
    if #content > max_content_width then
      item.abbr = vim.fn.strcharpart(content, 0, max_content_width - 3) .. "..."
    else
      item.abbr = content .. (" "):rep(max_content_width - #content)
    end
    return item
  end,
}
return M
