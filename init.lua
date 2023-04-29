-- :so to reload
--[[
Sources:
* Best video ever https://www.youtube.com/watch?v=w7i4amO_zaE
* Some cool stuff https://habr.com/ru/post/586808/
* Oh my rust https://github.com/simrat39/rust-tools.nvim
* Rabbit hole of plugins https://www.lunarvim.org/docs/plugins/core-plugins-list
* Vim cheatsheet https://vim.rtorr.com/
* Source of truth https://github.com/nanotee/nvim-lua-guide
* Remap doc https://neovim.io/doc/user/intro.html#<>
--]]

require('settings.remap')
require('settings.set')
require('settings.colors')

require('plugins.packer')
require('plugins.telescope')
require('plugins.undotree')
require('plugins.lsp')
require('plugins.fugitive')
require("plugins.treesitter")
require("plugins.bufferline")
require("plugins.nvimtree")
require("plugins.multicur")
require("plugins.tagbar")
require("plugins.whichkey")
require("plugins.trouble")
require("plugins.sniprun")
require("plugins.diffview")
require("plugins.vimgo")

