local function update_hl(group, tbl)
  local old_hl = vim.api.nvim_get_hl_by_name(group, true)
  local new_hl = vim.tbl_extend('force', old_hl, tbl)
  vim.api.nvim_set_hl(0, group, new_hl)
end

update_hl("@module", { link = "Include" })

for _, group in ipairs(vim.fn.getcompletion("@keyword", "highlight")) do
  update_hl(group, {link = "@keyword"})
end

update_hl("@comment", { link = "Special" })
update_hl("@constant", { link = "@boolean"})

update_hl("@property", { link = "@variable" })
update_hl("@constructor", { link = "@function.call" })

for _, group in ipairs(vim.fn.getcompletion("@variable", "highlight")) do
  update_hl(group, { link = "@variable" })
end
