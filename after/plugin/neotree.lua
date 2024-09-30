-- Open tree with nn
vim.keymap.set("n", "<leader>nn", ":Neotree source=filesystem reveal=true position=left toggle=true<CR>", { desc = "Neotree reveal" })

-- Reveal file
vim.keymap.set("n", "<leader>nr", ":Neotree reveal=true<CR>", { desc = "Neotree reveal" })

-- Open git status in tree
vim.keymap.set("n", "<leader>ng", ":Neotree git_status<CR>", { desc = "Neotree git status" })

-- Start vim with neotree open
vim.cmd(":Neotree left")
