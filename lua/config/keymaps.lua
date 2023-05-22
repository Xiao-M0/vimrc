vim.g.mapleader = " "
vim.g.maplocalleader = " "
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }
local keymap = vim.keymap.set
map("", "q", "<Nop>", opt)
map("", "K", "<Nop>", opt)
map("", "<f1>", "<Nop>", opt)
map("n", "<Tab>", "za", opt)
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)
map("n", "Q", "qq", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
map("i", "<C-a>", "<Home>", opt)
map("i", "<C-e>", "<End>", opt)
map("i", "<C-f>", "<Right>", opt)
map("i", "<C-b>", "<Left>", opt)
map("i", "<M-m>", "<esc>", opt)
map('v', '<', '<gv', opt)
map('v', '>', '>gv', opt)
map('n', '<', '<<', opt)
map('n', '>', '>>', opt)
map('x', 'p', 'P', opt)
map('x', 'P', 'p', opt)
map('n', '<C-up>',    ':resize +1<cr>', opt)
map('n', '<C-down>',  ':resize -1<cr>', opt)
map('n', '<C-left>',  ':vertical resize +1<cr>', opt)
map('n', '<C-right>', ':vertical resize -1<cr>', opt)
map('n', '.', ':noh<cr>', opt)
keymap("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "  Lazy" })
