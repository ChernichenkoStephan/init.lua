-- switch tabs with arrows
vim.keymap.set('n', '<leader>.', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', '<leader>,', ':BufferLineCyclePrev<CR>')

-- go to bufer with number
for i = 0, 9 do
  lhs = string.format("<leader>%d",i)
  rhs = string.format(":BufferLineGoToBuffer %d<CR>",i)
  vim.keymap.set('n', lhs, rhs)
end
