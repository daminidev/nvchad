local dap = require("dap")

-- Configuration de l'adaptateur installé par Mason
dap.adapters.php = {
  type = "executable",
  command = "node",
  args = { os.getenv("HOME") .. "/.local/share/nvim/mason/packages/php-debug-adapter/extension/out/phpDebug.js" },
}

-- Configuration du profil de lancement
dap.configurations.php = {
  {
    type = "php",
    request = "launch",
    name = "Écouter Xdebug",
    port = 9003,
    -- Indique la racine de ton projet Drupal
    pathMappings = {
      ["/home/david/dev/drupal"] = "${workspaceFolder}",
    },
  },
}

