require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

-- closer escapes
map("i", "jk", "<ESC>")
map("v", "fd", "<ESC>")
map("i", "<C-k>", "<ESC>")
map("i", "<C-j>", "<ESC>")

map({"n", "i", "v"}, "<C-s>", "<cmd> w <cr>")
map("n", "<leader>s", "<cmd>w<cr>", { desc = "Save" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<leader>s", "<cmd>w<cr>", { desc = "Save" })
map("n", "<C-s>", "<cmd>w<cr>", { desc = "Save" })

-- some faster movement
map({"n", "v"}, "<C-l>", "$")
map({"n", "v"}, "<C-h>", "0")
map({"n", "v"}, "<C-j>", "8j")
map({"n", "v"}, "<C-k>", "8k")

-- remap K
map('n', '<S-t>', vim.lsp.buf.hover)

-- telescope
local telescope = require("telescope.builtin")
map("n", "<leader>b", "<cmd> Telescope buffers <CR>", { desc = "Find buffers" })
map("n", "<leader>gr", function() telescope.lsp_references() end, { desc = "LSP references", remap=true })
map("n", "<leader>lds", function() telescope.lsp_document_symbols() end, { desc = "Show symbols in the cucrent buffer", remap=true })
map("n", "<leader>gi", function() telescope.lsp_implementations() end, { desc = "Go to symbol implementations"})
map("n", "<leader>gd", function() telescope.lsp_definition() end, { desc = "Go to symbol definition"})

map("n", "<leader>ls", "<leader>ld", { desc = "Show diagnostic" })

map("v", "<S-Tab>", "<gv", { desc = "Unindent line" })
map("v", "<Tab>", ">gv", { desc = "Indent line" })

map('n', '<space>L', '<cmd>lua vim.diagnostic.open_float()<CR>', { desc = "Show diagnostic in a floating window", remap=true })
