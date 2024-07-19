vim.keymap.set("n", "<leader>rl", vim.cmd.GoMetaLinter)
vim.keymap.set("n", "<leader>rt", vim.cmd.GoTestFunc)
vim.keymap.set("n", "gi", vim.cmd.GoImplements)

vim.g.go_addtags_transform = "camelcase"
