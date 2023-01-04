-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- open close files tree
vim.keymap.set('n', '<leader>t', ':NvimTreeRefresh<CR>:NvimTreeToggle<CR>')
