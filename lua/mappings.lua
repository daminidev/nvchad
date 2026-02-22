require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

--map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("t", ",,", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
map("n", "<leader>a", "<cmd>AerialToggle!<CR>", { desc = "Toggle Aerial (Symbols Outline)" })
map("n", "<C-Left>", [[<C-w>5<]],  { desc = "Resize pane   "})
map("n", "<C-Right>", [[<C-w>5>]], { desc = "Resize pane   "})
map("n", "<C-Up>", [[<C-w>5+]],    { desc = "Resize pane   "})
map("n", "<C-Down>", [[<C-w>5-]],  { desc = "Resize pane   "})
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
