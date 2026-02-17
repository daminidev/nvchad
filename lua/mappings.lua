require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

--map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("t", ",,", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
map("n", "<leader>a", "<cmd>AerialToggle!<CR>", { desc = "Toggle Aerial (Symbols Outline)" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
