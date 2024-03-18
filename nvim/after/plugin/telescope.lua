local builtin = require('telescope.builtin')
--vim.keymap.set('n', '<C-l>', builtin.find_files, {})
vim.keymap.set('n', '<C-l>', function()
	builtin.find_files({ hidden=true })
end)
vim.keymap.set('n', '<leader>gs', builtin.git_files, {})
vim.keymap.set('n', '<leader>g', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)