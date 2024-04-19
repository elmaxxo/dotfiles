local M = {}

M.general = {
  n = {
    [";"] = { ":", "Enter command mode", opts = { nowait = true } },
    ["<leader>s"] = { "<cmd>w<cr>", "Save" },
    ["<leader>q"] = { "<cmd>q<cr>", "Quit" },
    ["<leader>Q"] = { "<cmd>qall<cr>", "Quit all" },
    -- no arrow keys --- force yourself to use the home row
    ["<up>"] = { '<nop>' },
    ["<down>"] = { '<nop>' },
    ["<left>"] = { '<nop>' },
    ["<right>"] = { '<nop>' },

    -- some faster movement
    ["<C-l>"] = { "$" },
    ["<C-h>"] = { "0" },
    ["<C-j>"] = { "8j" },
    ["<C-k>"] = { "8k" },

    -- telescope
    ["<leader>b"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["gr"] = {
      function()
        require("telescope.builtin").lsp_references()
      end,
      "LSP references",
    },
    ["gd"] = {
      function()
        require("telescope.builtin").lsp_definitions()
      end,
      "LSP definitions",
    },

    ["<leader>ls"] = { "<leader>ld", "Show diagnostic" },
  },
  i = {
    -- no arrow keys --- force yourself to use the home row
    ["<up>"] = { '<nop>' },
    ["<down>"] = { '<nop>' },
    ["<left>"] = { '<nop>' },
    ["<right>"] = { '<nop>' },
  },
  v = {
    ["<S-l>"] = { "$" },
    ["<S-h>"] = { "0" },

    ["<S-Tab>"] = { "<gv", "Unindent line" },
    ["<Tab>"] = { ">gv", "Indent line" },

    ["<C-l>"] = { "$" },
    ["<C-h>"] = { "0" },
  }
}

return M
