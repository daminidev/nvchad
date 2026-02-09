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
  --{
  --  "luukvbaal/statuscol.nvim",
  --  lazy = false,
  --  config = function()
  --    local builtin = require("statuscol.builtin")
  --    require("statuscol").setup({
  --      relculright = true, -- relative numbers on the right of absolute
  --      segments = {
  --        { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
  --        { text = { "%s" }, click = "v:lua.ScSa" },
  --        -- Segment 1: Relative
  --        {
  --          text = { builtin.lnumfunc, " " }, -- This will show relative distance
  --          click = "v:lua.ScLa",
  --        },
  --        -- Segment 2: Absolute (The fix)
  --        {
  --          text = { " %{v:lnum} " }, -- Explicitly request the absolute line number
  --          color = { fg = "#666666" }, 
  --          click = "v:lua.ScLa",
  --        },
  --      },        
  --    })
  --  end,
  --}
}





























