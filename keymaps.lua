local opts = { noremap = true }
-- open trouble quickfix list/location list
vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>TroubleToggle<CR>", opts)
-- keeps the cursor in the middle
vim.api.nvim_set_keymap("n", "n", "nzzzv", opts)
vim.api.nvim_set_keymap("n", "N", "Nzzzv", opts)
vim.api.nvim_set_keymap("n", "J", "mzJ'z", opts)
-- escape insert mode with jj
vim.api.nvim_set_keymap("i", "jj", "<Esc>", opts)
---- move left and right in insert mode
vim.api.nvim_set_keymap("i", "<C-h>", "<left>", opts)
vim.api.nvim_set_keymap("i", "<C-l>", "<right>", opts)
-- Moving lines of text up and down
vim.api.nvim_set_keymap("i", "<C-j>", "<Esc>:m .+1<CR>==", opts)
vim.api.nvim_set_keymap("i", "<C-k>", "<Esc>:m .-2<CR>==", opts)
vim.api.nvim_set_keymap("n", "<C-j>", ":m .+1<CR>==", opts)
vim.api.nvim_set_keymap("n", "<C-k>", ":m .-2<CR>==", opts)
vim.api.nvim_set_keymap("v", "<C-j>", ":m '>+1<CR>gv=gv", opts)
vim.api.nvim_set_keymap("v", "<C-k>", ":m '<-2<CR>gv=gv", opts)

-- Buffer navigation
vim.api.nvim_set_keymap("n", "<c-l>", ":bn<CR>", opts)
vim.api.nvim_set_keymap("n", "<c-h>", ":bp<CR>", opts)

-- Inserting tabs
vim.api.nvim_set_keymap("n", "<tab>", ">>", opts)
vim.api.nvim_set_keymap("n", "<s-tab>", "<<", opts)
--after searching for words, press space to remove hilighting of words
vim.api.nvim_set_keymap("n", "<Space><Space>", ":nohlsearch<CR>", opts)

-- VISUAL MODE MAPS
vim.api.nvim_set_keymap("v", "<Space><Space>", "<Esc>", opts)
-- Inserting tabs, keeping selection
vim.api.nvim_set_keymap("v", "<Tab>", ">><ESC>gv", opts)
vim.api.nvim_set_keymap("v", "<S-Tab>", "<<<Esc>gv", opts)

-- quickfix list
vim.api.nvim_set_keymap("n", "<leader>q", ":copen<CR>", opts)
vim.api.nvim_set_keymap("n", "[q", ":cprevious<CR>", opts)
vim.api.nvim_set_keymap("n", "]q", ":cnext<CR>", opts)
vim.api.nvim_set_keymap("n", "]Q", ":clast<CR>", opts)
vim.api.nvim_set_keymap("n", "[Q", ":cfirst<CR>", opts)

-- trouble list (Problem: it doesn't show diagnostics anymore after using with telescope)
--vim.api.nvim_set_keymap("n", "]t", [[<cmd>lua require('trouble').next({skip_groups = true, jump = true})<CR>]], {noremap = true})
--vim.api.nvim_set_keymap("n", "[t", "<cmd>lua require('trouble').previous({skip_groups = true, jump = true})<CR>", {noremap = true})
