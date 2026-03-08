require "nvchad.mappings"

local map = vim.keymap.set
local utils = require('utils')

map("i", "jk", "<ESC>")
map("t", ",,", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
map("n", "<leader>a", "<cmd>AerialToggle!<CR>", { desc = "Toggle Aerial (Symbols Outline)" })
map("n", "<C-Left>", [[<C-w>5<]],  { desc = "Resize pane   "})
map("n", "<C-Right>", [[<C-w>5>]], { desc = "Resize pane   "})
map("n", "<C-Up>", [[<C-w>5+]],    { desc = "Resize pane   "})
map("n", "<C-Down>", [[<C-w>5-]],  { desc = "Resize pane   "})

if utils.is_obsidian_available() then 

  -- to enable the group Obsidian :
  local wk = require("which-key")
  wk.add({
    { "<leader>o", group = "Obsidian", icon = "󰠮 " },
    { "<leader>on", desc = "New Note" }, -- Adding a placeholder here forces the wait
    { "<leader>os", desc = "Search Notes" },
  })

  -- Global Obsidian triggers (Normal mode)
  map("n", "<leader>on", "<cmd>Obsidian new<CR>", { desc = "󱘒  New Note" })
  map("n", "<leader>os", "<cmd>Obsidian search<CR>", { desc = "󰹕  Search" })
  map("n", "<leader>ot", "<cmd>Obsidian today<CR>", { desc = "󱓵 Today's note" })

  -- Global Obsidian triggers (Visual mode)
  map("v", "<leader>on", "<cmd>Obsidian link_new<CR>", { desc = "󱘒  Link Selection to New Note" })
  map("v", "<leader>oe", "<cmd>Obsidian extract_note<CR>", { desc = "󱘒  Extract Selection to New Note" })

end
