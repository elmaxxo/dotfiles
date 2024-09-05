local M = {}

M.general = {
  n = {
    [";"] = { ":", "Enter command mode", opts = { nowait = true } },
    ["<leader>s"] = { "<cmd>w<cr>", "Save" },
    ["<leader>q"] = { "<cmd>q<cr>", "Quit" },

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
  v = {
    ["<S-Tab>"] = { "<gv", "Unindent line" },
    ["<Tab>"] = { ">gv", "Indent line" },

    -- some faster movement
    ["<C-l>"] = { "$" },
    ["<C-h>"] = { "0" },
    ["<C-j>"] = { "8j" },
    ["<C-k>"] = { "8k" },
  }
}

return M
