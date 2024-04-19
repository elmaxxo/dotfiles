
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

vim.g.rustaceanvim = {
  server = {
    on_attach = function(client, bufnr)
      -- disable semantic highlighting
      client.server_capabilities.semanticTokensProvider = nil
      on_attach(client, bufnr)
    end,
    capabilities = capabilities,
  },
}

