vim.opt.smartcase = true
vim.opt.mouse = 'a'
vim.opt.colorcolumn = '90'              -- Line in the right
vim.opt.cursorline = true               
vim.opt.spelllang= { 'en_us', 'ru' }    
vim.opt.spell= true
vim.opt.number = true                   
vim.opt.relativenumber = true           
vim.api.nvim_exec('language en_US', true)

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.updatetime = 50

-----------------------------------------------------------------
-- Tabs and spaces
-----------------------------------------------------------------

vim.cmd([[
    filetype indent plugin on
    syntax enable
]])
vim.opt.expandtab = true      -- use spaces instead of tabs
vim.opt.shiftwidth = 2        -- shift 2 spaces when tab
vim.opt.tabstop = 2           -- 1 tab == 2 spaces
vim.opt.smartindent = true    -- autoindent new lines
vim.cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]
vim.opt.breakindent = true
vim.cmd[[ autocmd BufNewFile,BufRead *.html set filetype=htmldjango ]]
