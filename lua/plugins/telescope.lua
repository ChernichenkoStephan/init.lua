local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fp', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>ffg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fgl', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
