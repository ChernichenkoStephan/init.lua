-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- open close files tree
vim.keymap.set('n', '<leader>t', ':NvimTreeRefresh<CR>:NvimTreeToggle<CR>')

-- OR setup with some options
require("nvim-tree").setup({
  view = {
    adaptive_size = true,
  },

  filters = {
    dotfiles = false,
  },

  git = {
    ignore = false,
  },

  renderer = {
    highlight_git = true,
    highlight_opened_files = "icon",
    highlight_modified = "icon",
  },
})
