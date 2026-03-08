local backend = "sixel" -- Default for WezTerm / others
local utils = require('utils')

if os.getenv("KITTY_PID") or os.getenv("TERM") == "xterm-kitty" then
  backend = "kitty"
end

return {

  {
    "nvim-tree/nvim-tree.lua",
    opts = function()
      return require "configs.nvimtree"
    end
  },

  {
    "rmagatti/auto-session",
    lazy = false,
    opts = function ()
      return require "configs/autosession"
    end
  },

  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function()
      return require "configs.cmp"
    end
  },

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
    build = false,
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
    cmd = { "AerialToggle", "AerialNavToggle", "AerialInfo" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
    opts = {
      backends = { "lsp", "treesitter", "markdown", "man" },
      layout = {
        default_direction = "right",
      },
    },
  },

  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<F7>",       function() require('dap').step_into() end, desc = "DAP| 󰆹 | Step into" },
      { "<F8>",       function() require('dap').continue() end,  desc = "DAP|  | Continue" },
      { "<F9>",       function() require('dap').step_over() end, desc = "DAP| 󰆷 | Step over" },
      { "<F10>",      function() require('dap').step_out() end,  desc = "DAP| 󰆸 | Step out" },
      { "<Leader>db", function() require('dap').toggle_breakpoint() end,  desc = "DAP|  | Toggle breakpoint" },
    },
    config = function()
      require "configs.dap"
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    keys = {
      { "<Leader>du", function() require('dapui').toggle() end, desc = "DAPUI|   Toggle UI" },
      { "<Leader>dh", function() require('dap.ui.widgets').hover() end, desc = "DAPUI|   Hover variable" },
    },
    config = function()
      require 'configs.dapui'
    end,
  },

  {
    "obsidian-nvim/obsidian.nvim",
    enabled = utils.is_obsidian_available(),
    version = "*",
    cmd = { "Obsidian" },
    ft = "markdown",
    opts = require 'configs.obsidian',
  }
}
