-- :so to reload
--[[
Sources:
* Best video ever https://www.youtube.com/watch?v=w7i4amO_zaE
* Some cool stuff https://habr.com/ru/post/586808/
* Oh my rust https://github.com/simrat39/rust-tools.nvim
* Rabbit hole of plugins https://www.lunarvim.org/docs/plugins/core-plugins-list
* Vim cheatsheet https://vim.rtorr.com/
* Source of truth https://github.com/nanotee/nvim-lua-guide
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
