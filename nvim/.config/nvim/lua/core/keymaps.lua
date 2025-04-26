----------------------------------------------------------------------------
-- KEYMAPS

vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- exit insert mode map
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

---------------------
-- Plugins Keymaps -------------------

-- OIL
keymap.set("n", "-", "<cmd>Oil --float<CR>", { desc = "Open Oil in main buffer" })
keymap.set("n", "q", "<cmd>close<CR>", { desc = "Close Oil" })
