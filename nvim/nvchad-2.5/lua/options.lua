require "nvchad.options"

-- vim.g.dap_virtual_text = true
vim.opt.colorcolumn = "80"
-- in Rust the rule is 100 characters
vim.api.nvim_create_autocmd('Filetype', {
  pattern = 'rust', command = 'set colorcolumn=100'
})

-- don't go to the next line by h or l
vim.opt.whichwrap = "b,s<>[]"

vim.opt.scrolloff = 3 -- the minimal number of lines above and below the cursor

vim.opt.pumheight = 10 -- pop up menu height
-- Enable persistent undo
vim.opt.undofile = true

-- Enable spell checking
vim.opt.spelllang = 'en_us'
vim.opt.spell = true

-- this autocmd will restore cursor position on file open
-- TODO: find a better place for this code
local autocmd = vim.api.nvim_create_autocmd
autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local line = vim.fn.line "'\""
    if
      line > 1
      and line <= vim.fn.line "$"
      and vim.bo.filetype ~= "commit"
      and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
    then
      vim.cmd 'normal! g`"'
    end
  end,
})
