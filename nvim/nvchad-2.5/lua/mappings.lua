require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

-- closer escapes
map("i", "jk", "<ESC>")
map("i", "<C-k>", "<ESC>")
map("i", "<C-j>", "<ESC>")

map({"n", "i", "v"}, "<C-s>", "<cmd> w <cr>")
map("n", "<leader>s", "<cmd>w<cr>", { desc = "Save" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<leader>s", "<cmd>w<cr>", { desc = "Save" })

-- some faster movement
map({"n", "v"}, "<C-l>", "$")
map({"n", "v"}, "<C-h>", "0")
map({"n", "v"}, "<C-j>", "8j")
map({"n", "v"}, "<C-k>", "8k")

-- telescope
local telescope = require("telescope.builtin")
map("n", "<leader>b", "<cmd> Telescope buffers <CR>", { desc = "Find buffers" })
map("n", "gr", function() telescope.lsp_references() end, { desc = "LSP references" })
map("n", "gd",function() telescope.lsp_definitions() end, { desc = "LSP definitions" })

map("n", "<leader>ls", "<leader>ld", { desc = "Show diagnostic" })

map("v", "<S-Tab>", "<gv", { desc = "Unindent line" })
map("v", "<Tab>", ">gv", { desc = "Indent line" })

