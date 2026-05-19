local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    error("Failed to clone lazy.nvim:\n" .. out)
  end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "nvim-telescope/telescope.nvim", tag = "0.1.8", dependencies = { "nvim-lua/plenary.nvim" } },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      vim.cmd("colorscheme rose-pine")
    end,
  },
  { "nvim-treesitter/nvim-treesitter", branch = "master", build = ":TSUpdate" },
  { "theprimeagen/harpoon", dependencies = { "nvim-lua/plenary.nvim" } },
  { "mbbill/undotree" },
  { "tpope/vim-fugitive" },
  { "VonHeikemen/lsp-zero.nvim", branch = "v4.x" },
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "bronson/vim-trailing-whitespace" },
  { "mattn/emmet-vim" },
  { "tpope/vim-commentary" },
  { "tpope/vim-surround" },
  { "nvim-tree/nvim-web-devicons" },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  },
  { "vim-test/vim-test" },
  { "lewis6991/gitsigns.nvim" },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
  },
  { "lowitea/aw-watcher.nvim" },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },
}, {
  checker = { enabled = true, notify = false },
})
