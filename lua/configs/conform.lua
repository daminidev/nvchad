local options = {

  formatters_by_ft = {
    lua = { "stylua" },
    php = { "phpcbf", "php_cs_fixer" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  --
  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },

   formatters = {

    phpcbf = {
      -- Disabling stdin is still recommended for phpcbf reliability
      -- stdin = false, 
      -- Only run phpcbf if a Drupal/PHPCS config file is detected in the project
      condition = function(self, ctx)
        return vim.fs.find({ "phpcs.xml", "phpcs.xml.dist" }, { path = ctx.dirname, upward = true })[1] ~= nil
      end,
    },

    php_cs_fixer = {
      -- Only run php-cs-fixer if a Symfony/API Platform config file is detected
      condition = function(self, ctx)
        return vim.fs.find({ ".php-cs-fixer.php", ".php-cs-fixer.dist.php" }, { path = ctx.dirname, upward = true })[1] ~= nil
      end,
    },
  },

}

return options
