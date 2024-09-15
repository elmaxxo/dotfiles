-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local nvlsp = require "nvchad.configs.lspconfig"
local on_attach = nvlsp.on_attach
local capabilities = nvlsp.capabilities

lspconfig.lua_ls.setup({
  on_attach = function(client, bufnr)
    -- disable semantic highlighting
    client.server_capabilities.semanticTokensProvider = nil
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
})

lspconfig.rust_analyzer.setup({
  on_attach = function(client, bufnr)
    -- disable semantic highlighting
    client.server_capabilities.semanticTokensProvider = nil
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      imports = {
        group = {
          enable = false,
        },
      },
      cargo = {
        features = "all",
      },
    },
  },
})

lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    client.server_capabilities.semanticTokensProvider = nil
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}

lspconfig.pyright.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.semanticTokensProvider = nil
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  -- root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}
