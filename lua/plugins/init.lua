local backend = "sixel" -- Default for WezTerm / others
if os.getenv("KITTY_PID") or os.getenv("TERM") == "xterm-kitty" then
  backend = "kitty"
end

return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", "javascript", "typescript", "tsx",
        "php", "phpdoc" -- Add these here
      },
    },
  },
  {
    "tpope/vim-fugitive",
    lazy = false
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },            -- if you use the mini.nvim suite
    ft = { 'markdown', 'norg', 'rmd', 'org' },
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  {
    "tpope/vim-fugitive",
    lazy = false,
  },
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
    dependencies = {
      -- include a picker of your choice, see picker section for more details
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    cmd = "Leet",
    opts = {
      lang = "php",
      image_support = true,
      injector = {
        ["php"] = {
          before = { "<?php", "" } -- Injects the tag and a blank line at the very top
        }
      },
    },
  },
  {
    "3rd/image.nvim",
    build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
    lazy = false,
    opts = {
      processor = "magick_cli",
      backend = backend,
      tmux_show_only_in_active_window = true,
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { "markdown", "rmd" }, 
        }
      }
    }
  },
  {
    'stevearc/aerial.nvim',
    -- This ensures the plugin stays completely unloaded until you trigger the command
    cmd = { "AerialToggle", "AerialNavToggle", "AerialInfo" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
    opts = {
      -- Optional: By default, aerial tries LSP first, then Treesitter.
      -- This is perfect for your PHP and JS stack.
      backends = { "lsp", "treesitter", "markdown", "man" },

      -- Optional: visually align the aerial window to the right
      layout = {
        default_direction = "right",
      },
    },
  }
}
