local telescope = require("telescope")
local builtin = require("telescope.builtin")
local telescopeConfig = require("telescope.config")

local find_files_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" }
local find_files_with_ignored_command = { "rg", "--files", "--hidden", "--no-ignore-vcs", "--glob", "!**/.git/*" }

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")

telescope.setup({
	defaults = {
		-- `hidden = true` is not supported in text grep commands.
		vimgrep_arguments = vimgrep_arguments,
	},
	pickers = {
		find_files = {
			-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
			find_command = find_files_command,
		},
	},
})

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fF', function()
	builtin.find_files({ find_command = find_files_with_ignored_command })
end, { desc = 'Telescope find files including gitignored' })
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Git find files' })
vim.keymap.set('n', '<leader>lg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader><leader>r', builtin.resume, { desc = 'Telescope resume' })
