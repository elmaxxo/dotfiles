return {
  -- set the colorscheme
  colorscheme = "base16-gruvbox-dark-hard",

  options = {
    opt = {
      scrolloff = 3, -- the mimnal number of lines above and below the cursor
      termguicolors = true, -- colors for color hexes (f.e. #282828)
      colorcolumn = '80',
    },
  },

  plugins = {
    -- base16 themes
    {
      "RRethy/base16-nvim",
      lazy = false, -- load at start
      priority = 1000, -- load first
    },

    {
      "hrsh7th/nvim-cmp",
      -- load cmp on InsertEnter
      event = "InsertEnter",
      -- these dependencies will only be loaded when cmp loads
      -- dependencies are always lazy-loaded unless specified otherwise
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
      },
      config = function()
        local cmp = require'cmp'
        cmp.setup({

          preselect = cmp.PreselectMode.None,

          snippet = {
            -- REQUIRED by nvim-cmp. get rid of it once we can
            expand = function(args)
              require("luasnip").lsp_expand(args.body)
            end,
          },

          -- mappings from NvChad
          mapping = {
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.close(),
            ["<CR>"] = cmp.mapping.confirm {
              behavior = cmp.ConfirmBehavior.Insert,
              select = true,
            },
            ["<Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif require("luasnip").expand_or_jumpable() then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
              else
                fallback()
              end
            end, {
              "i",
              "s",
            }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif require("luasnip").jumpable(-1) then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
              else
                fallback()
              end
            end, {
              "i",
              "s",
            }),
          },

          sources = cmp.config.sources(
          {
            {
              name = 'nvim_lsp',
              --get rid of snippets
              entry_filter = function(entry) return require("cmp").lsp.CompletionItemKind.Snippet ~= entry:get_kind() end,
            },
          },
          {
            { name = 'path' },
          }),
          experimental = {
            ghost_text = true,
          },
        })

        -- Enable completing paths in :
        cmp.setup.cmdline(':', {
          sources = cmp.config.sources({
            { name = 'path' }
          })
        })
      end
    },

    -- inline function signatures
    {
      "ray-x/lsp_signature.nvim",
      lazy = false,
      event = "VeryLazy",
      opts = {},
      config = function(_, opts)
          -- Get signatures (and _only_ signatures) when in argument lists.
          require "lsp_signature".setup({
              -- doc_lines = 0,
              -- handler_opts = {
              --     border = "none"
              -- },
          })
      end
    },

    -- auto-cd to root of git project
    -- 'airblade/vim-rooter'
    {
      'notjedi/nvim-rooter.lua',
      lazy = false, -- NOTE: avoid lazy loading as the autocmds may not be caught by nvim-rooter.lua.
      config = function() require('nvim-rooter').setup() end
    },

    { 
      "nvim-treesitter/nvim-treesitter",
      opts = {
        ensure_installed = {
          "bash",
          "c",
          "markdown",
          "lua",
          "python",
          "rust",
        },

        highlight = {
          enable = false,
        },
      }
    },
  },


  mappings = {
    n = {
      ["<leader><leader>"] = {
        function() require("astronvim.utils.buffer").prev() end,
        desc = "Previous buffer"
      },
      -- no arrow keys --- force yourself to use the home row
      ["<up>"] = { '<nop>' },
      ["<down>"] = { '<nop>' },
      ["<left>"] = { '<nop>' },
      ["<right>"] = { '<nop>' },

      ["<Tab>"] = {
        function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
        desc = "Next buffer"
      },
      ["<S-Tab>"] = {
        function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
        desc = "Previous buffer"
      },

      [";"] = { ":" },

      ["<S-l>"] = { "$" },
      ["<S-h>"] = { "0" },
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
    }
  },

  polish = function()

    --- in Rust the rule is 100 characters
    vim.api.nvim_create_autocmd('Filetype', { pattern = 'rust', command = 'set colorcolumn=100' })

    ---------------------------------------------------------------------------
    -- colorscheme settings that must be set after applying the scheme
    ---------------------------------------------------------------------------
    -- Make comments more prominent -- they are important.
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

    for _, group in ipairs(vim.fn.getcompletion("@variable", "highlight")) do
      update_hl(group, { link = "@variable" })
    end

    local bools = vim.api.nvim_get_hl(0, { name = 'Boolean' })
 	  vim.api.nvim_set_hl(0, 'TSComment', bools)
    -- -- Hide all semantic highlights
    -- for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
    --   vim.api.nvim_set_hl(0, group, {})
    -- end

    -- disable semantic highlighting, not sure if this is the right way to do it.
    -- https://www.reddit.com/r/neovim/comments/zjqquc/how_do_i_turn_off_semantic_tokens/
    local servesrs_with_disabled_semantic_highlighting = {
      ["lua_ls"] = true,
      ["lua-language-server"] = true,
      ["rust_analyzer"] = true,
    }
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if servesrs_with_disabled_semantic_highlighting[client.name] == true then
          client.server_capabilities.semanticTokensProvider = nil
        end
      end,
    })

    -- better highlighting in rust K-comments
    vim.api.nvim_set_hl(0, "TSNamespace", { link = "Include" })

    -- TODO: move to mappings
    vim.keymap.set('n', '<C-j>', '<Esc>')
    vim.keymap.set('i', '<C-j>', '<Esc>')
    vim.keymap.set('v', '<C-j>', '<Esc>')
    vim.keymap.set('s', '<C-j>', '<Esc>')
    vim.keymap.set('x', '<C-j>', '<Esc>')
    vim.keymap.set('c', '<C-j>', '<Esc>')
    vim.keymap.set('o', '<C-j>', '<Esc>')
    vim.keymap.set('l', '<C-j>', '<Esc>')
    vim.keymap.set('t', '<C-j>', '<Esc>')
  	-- -- use cmp colors for lspsignature.
		-- local cmp = vim.api.nvim_get_hl(0, { name = 'CmpItemAbbr' })
		-- vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter', { fg = cmp.guifg, bg = cmp.guibg, ctermfg = cmp.ctermfg, ctermbg = cmp.ctermbg, bold = true })
  end,
}
