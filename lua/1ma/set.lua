vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Let's see what you got nvim
vim.opt.smartindent = true

-- Line wrapping?
vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false

-- Undo things from days and days ago
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Highlight search as I type
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- Leave some space at the bottom
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- In order to use chruby from the !sh shell, you need to change vim's shell:
vim.o.shell = os.getenv("SHELL")

vim.opt.ignorecase = true
