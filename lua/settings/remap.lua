-- key-notatio
-- https://neovim.io/doc/user/intro.html#<>
--
-- vim.keymap.set({mode}, {lhs}, {rhs}, {opts})
--     {mode} mode where the keybinding should execute. It can be a list of modes. We need to specify the mode's short name. Here are some of the most common.
--         n: Normal mode.
--         i: Insert mode.
--         x: Visual mode.
--         s: Selection mode.
--         v: Visual + Selection.
--         t: Terminal mode.
--         o: Operator-pending.
--         '': Yes, an empty string. Is the equivalent of n + v + o.
--     {lhs} is the key we want to bind.
--     {rhs} is the action we want to execute. It can be a string with a command or an expression. You can also provide a lua function.
--     {opts} this must be a lua table. If you don't know what is a "lua table" just think is a way of storing several values in one place. Anyway, it can have these properties.

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set('n', '<leader>w', vim.cmd.write)
vim.keymap.set('n', '<leader>q', vim.cmd.bdelete)

-- <F11> spell check for eng and rus
vim.keymap.set('n', '<F11>', ':set spell!<CR>')
vim.keymap.set('i', '<F11>', '<C-O>:set spell!<CR>')

-- Clear search highlight with <F1>
vim.keymap.set('n', '<F1>', ':nohl<CR>')

-- greatest remap ever. Force paste (paste without change of buffer)
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland. Copy to global buffer
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- moving highlighted text with J and K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- i don't know, but cleaver man said, that Q is bad
vim.keymap.set("n", "Q", "<nop>")

-- replace from word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- chmod +x current file
vim.keymap.set("n", "<leader>cmx", "<cmd>!chmod +x %<CR>", { silent = true })

--[[
-- windows movement, very handy with nvim-tree
Ctrl+ww cycle though all windows
Ctrl+wh takes you left a window
Ctrl+wj takes you down a window
Ctrl+wk takes you up a window
Ctrl+wl takes you right a window
--]]

vim.keymap.set('n', '<leader><Left>',  '<C-w>h')
vim.keymap.set('n', '<leader><Up>',    '<C-w>k')
vim.keymap.set('n', '<leader><Right>', '<C-w>l')
vim.keymap.set('n', '<leader><Down>',  '<C-w>j')
