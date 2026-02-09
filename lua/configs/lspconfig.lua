-- 1. Load nvChad's default LSP configuration logic
require("nvchad.configs.lspconfig").defaults()

-- 2. Extract nvChad's helper functions
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- 3. Configure standard servers (HTML, CSS)
local servers = { "html", "cssls" }

for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    install = true, -- Automatically handles installation via Mason if integrated
    options = {
      on_attach = on_attach,
      on_init = on_init,
      capabilities = capabilities,
    }
  })
  -- Start the server for the current buffer
  vim.lsp.enable(lsp)
end

-- 4. Specific configuration for Intelephense (PHP 5.6)
vim.lsp.config("intelephense", {
  options = {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    settings = {
      intelephense = {
--        environment = {
--          phpVersion = "5.6.0" 
--        },
        files = {
          maxSize = 5000000;
        }
      }
    }
  }
})

-- Enable it globally for PHP files
vim.lsp.enable("intelephense")
