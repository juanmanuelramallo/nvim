vim.g.user_emmet_install_global = 0
vim.g.user_emmet_leader_key = '<C-e>' -- IDK why this line is not working

vim.api.nvim_create_autocmd("FileType", {
  pattern = "html,css,tsx,jsx",
  callback = function()
    vim.cmd('EmmetInstall')
  end
})
