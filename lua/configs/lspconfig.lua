require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- Corrected paths for modern NvChad
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local servers = { "html", "cssls" }

-- Loop through standard servers
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- Specific configuration for Intelephense
lspconfig.intelephense.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    intelephense = {
--      environment = {
--        phpVersion = "5.6.0" 
--      },
      files = {
        maxSize = 5000000; -- Useful for large legacy codebases
      }
    }
  }
}
