-- Delete empty lines at the end of a file when saving it
function DeleteEndLines()
  local current_pos = vim.fn.getpos('.')  -- Save current position
  vim.cmd([[silent! %s#\($\n\s*\)\+\%$##]])  -- Remove trailing empty lines at the end of the file
  vim.fn.setpos('.', current_pos)  -- Restore cursor position
end

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = DeleteEndLines,
})
