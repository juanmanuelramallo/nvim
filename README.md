# nvim

Personal Neovim configuration.

## Requirements

- Neovim 0.11+
- Git
- ripgrep (`rg`)
- Node.js, Ruby, and Python for language servers/tools used by projects

Recommended macOS setup:

```bash
brew install neovim ripgrep fd jq stylua
```

Project language tooling currently expected by the config:

```bash
npm install -g prettier sql-language-server
gem install ruby-lsp
```

## Install On A New Machine

```bash
git clone git@github.com:juanmanuelramallo/nvim.git ~/.config/nvim
nvim
```

The first Neovim launch bootstraps `lazy.nvim` automatically and installs plugins.

To sync/update plugins manually:

```vim
:Lazy sync
```

## Structure

- `init.lua` loads `lua/1ma`.
- `lua/1ma/options.lua` does not exist yet; editor options currently live in `lua/1ma/set.lua`.
- `lua/1ma/remap.lua` contains global keymaps.
- `lua/1ma/lazy.lua` bootstraps and configures plugins with `lazy.nvim`.
- `after/plugin/*.lua` contains per-plugin configuration loaded after plugins are available.

## Useful Keymaps

- `<leader><leader>w` save
- `<leader><leader>q` quit
- `<C-p>` git files
- `<leader>ff` find files
- `<leader>lg` live grep
- `<leader>fb` buffers
- `<leader>nn` toggle Neo-tree
- `<leader>gs` Fugitive git status
- `<leader>u` Undotree
- `<leader>tl` nearest test
- `<leader>tf` test file

## Health Check

```bash
nvim --headless "+Lazy! sync" "+qa"
nvim --headless "+checkhealth" "+qa"
```
