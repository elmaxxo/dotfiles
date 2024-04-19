local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
-- local util = require "lspconfig/util"

lspconfig.lua_ls.setup({
  on_attach = function(client, bufnr)
    -- disable semantic highlighting
    client.server_capabilities.semanticTokensProvider = nil
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
})

lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    client.server_capabilities.semanticTokensProvider = nil
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}
