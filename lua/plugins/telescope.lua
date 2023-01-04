local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fp', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>ffg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>flg', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
