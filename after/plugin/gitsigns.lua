require('gitsigns').setup({
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    -- Navigation
    vim.keymap.set('n', ']c', gs.next_hunk, {buffer = bufnr})
    vim.keymap.set('n', '[c', gs.prev_hunk, {buffer = bufnr})

    -- Actions
    vim.keymap.set('n', '<leader>hp', gs.preview_hunk, {buffer = bufnr})
    vim.keymap.set('n', '<leader>hb', gs.blame_line, {buffer = bufnr})
    vim.keymap.set('n', '<leader>hs', gs.stage_hunk, {buffer = bufnr})
    vim.keymap.set('n', '<leader>hr', gs.reset_hunk, {buffer = bufnr})
    vim.keymap.set('n', '<leader>hd', gs.diffthis, {buffer = bufnr})
  end
})
