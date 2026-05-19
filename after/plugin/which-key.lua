local ok, which_key = pcall(require, "which-key")
if not ok then
  return
end

which_key.add({
  { "<leader><leader>", group = "quick actions" },
  { "<leader>f", group = "find" },
  { "<leader>g", group = "git" },
  { "<leader>h", group = "harpoon / hunks" },
  { "<leader>n", group = "neo-tree" },
  { "<leader>t", group = "tests" },
  { "<leader>w", group = "windows" },
})
