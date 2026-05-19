local lsp_zero = require('lsp-zero')

local lsp_attach = function(_, bufnr)
	lsp_zero.default_keymaps({buffer = bufnr})

	local opts = {buffer = bufnr}

	vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
	vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
	vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
	vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
	vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
	vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
	vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
	vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
	vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
	vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  vim.keymap.set('n', 'of', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
end

lsp_zero.extend_lspconfig({
	sign_text = true,
	lsp_attach = lsp_attach,
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

local handlers = {
  function (server_name)
    vim.lsp.enable(server_name)
  end,
  ["ruby_lsp"] = function ()
    vim.lsp.config.ruby_lsp = {
      cmd = { 'ruby-lsp' },
      filetypes = { 'ruby' },
      root_markers = { 'Gemfile', '.git' },
      settings = {
        init_options = {
          formatter = 'none',
          linters = {},
        }
      }
    }
    vim.lsp.enable('ruby_lsp')
  end,
  ["sqlls"] = function ()
    vim.lsp.config.sqlls = {
      cmd = { 'sql-language-server', 'up', '--method', 'stdio' },
      filetypes = { 'sql', 'mysql' },
      root_markers = { '.git' },
      settings = {
        sqlls = {
          upperCaseKeywords = false
        }
      }
    }
    vim.lsp.enable('sqlls')
  end,
}

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "ruby_lsp", "lua_ls", "sqlls", "ts_ls", "html", "tailwindcss" },
  handlers = handlers,
})
