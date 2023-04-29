--[[
* Alt(Opt)+Up add coursor up
* Alt(Opt)+Down add coursor Down
* Ctrl+N to enter MC find mode

press n/N to get next/previous occurrence
press [/] to select next/previous cursor
press q to skip current and get next occurrence
press Q to remove current cursor/selection
start insert mode with i,a,I,  
--]]  

vim.keymap.set(
    "n",
    "<M-Up>",
    ":call vm#commands#add_cursor_up(0, v:count1)<cr>",
    { noremap = true, silent = true }
)
  

vim.keymap.set(
    "n",
    "<M-Down>",
    ":call vm#commands#add_cursor_down(0, v:count1)<cr>",
    { noremap = true, silent = true }
)

