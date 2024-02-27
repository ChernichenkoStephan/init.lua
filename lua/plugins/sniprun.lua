vim.keymap.set('n', '<leader>r', ':SnipRun<CR>')
vim.keymap.set('n', '<leader>rr', ':SnipReset<CR>')
vim.keymap.set('n', '<leader>ri', ':SnipInfo<CR>')
vim.keymap.set('n', '<leader>rc', ':SnipClose<CR>')
vim.api.nvim_set_keymap('v', '<leader>r', '<Plug>SnipRun', {silent = true})

require'sniprun'.setup({
    display = { "Terminal" },
    display_options = {
        terminal_width = 75,
    },
    repl_enable = {'Python3_original'}
})
