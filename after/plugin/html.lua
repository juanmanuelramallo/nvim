vim.keymap.set("n", "<leader><leader>fhtml", function()
  local buf_contents = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local input = table.concat(buf_contents, "\n")

  local formatted = vim.fn.system({
    "python3",
    "-c",
    [[
import sys
from bs4 import BeautifulSoup, formatter
html = sys.stdin.read()
custom_formatter = formatter.HTMLFormatter(indent=2)
soup = BeautifulSoup(html, 'html.parser')
print(soup.prettify(formatter=custom_formatter))
    ]]
  }, input)

  if vim.v.shell_error == 0 then
    local lines = vim.split(formatted, "\n", { plain = true })
    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  else
    vim.notify("HTML formatting failed", vim.log.levels.ERROR)
  end
end, { desc = "Format current buffer as HTML using BeautifulSoup" })
