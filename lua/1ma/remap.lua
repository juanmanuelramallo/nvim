vim.g.mapleader = " "

vim.keymap.set("n", "<leader>n", vim.cmd.Ex)

vim.keymap.set("n", "<leader><leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader><leader>q", vim.cmd.q)

-- Move blocks
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in the middle while hoping through search results
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Keep clipboard when pasting on top of a visual block
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Yank to system
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Delete but not yank
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Maintain visual block selection after indentation
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Indent with single < > key press
vim.keymap.set("n", ">", ">>")
vim.keymap.set("n", "<", "<<")

-- Move lines with CTRL + Arrow keys
vim.api.nvim_set_keymap('n', '<C-Down>', ':m .+1<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Up>', ':m .-2<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-Down>', '<Esc>:m .+1<CR>==gi', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-Up>', '<Esc>:m .-2<CR>==gi', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-Down>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-Up>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
