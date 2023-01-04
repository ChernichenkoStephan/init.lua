local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  ------------------------------------------------------------------------
  -- Internals
  ------------------------------------------------------------------------

  -- lua plugins for async plugins
  use("nvim-lua/plenary.nvim")

  -- Debugging
  use({'mfussenegger/nvim-dap'})

  -- Treesitter for amazing code highlight
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('plugins.treesitter') 
    end
  }

  -- https://github.com/VonHeikemen/lsp-zero.nvim
  -- fast LSP config pack
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }

  ------------------------------------------------------------------------
  -- Visual
  ------------------------------------------------------------------------

  -- vs-code like icons
  use("kyazdani42/nvim-web-devicons")

  -- https://github.com/nyoom-engineering/oxocarbon.nvim
  use({
    'nyoom-engineering/oxocarbon.nvim',
    config = function()
      vim.cmd("colorscheme oxocarbon")
    end
  })

  ------------------------------------------------------------------------
  -- Code helpers
  ------------------------------------------------------------------------

  -- https://github.com/numToStr/Comment.nvim
  use({'numToStr/Comment.nvim'})
  require('Comment').setup()

  use({'simrat39/rust-tools.nvim'})
  ------------------------------------------------------------------------
  -- Golang
  ------------------------------------------------------------------------
  
  use({"fatih/vim-go",  run = ':GoUpdateBinaries'})

  ------------------------------------------------------------------------
  -- Function modules
  ------------------------------------------------------------------------
  
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  -- You dont need to set any of these options. These are the default ones. Only
  -- the loading is important
  require('telescope').setup {
    extensions = {
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      }
    }
  }

  -- To get fzf loaded and working with telescope, you need to call
  -- load_extension, somewhere after setup function:
  require('telescope').load_extension('fzf')

  -- statusline
  use { 'nvim-lualine/lualine.nvim',
     requires = {'kyazdani42/nvim-web-devicons', opt = true},
  }
  require('lualine').setup({
   options = {
     icons_enabled = true,
  }
  })

  -- https://github.com/lukas-reineke/indent-blankline.nvim
  -- lines that shows tabs and spaces
  use({"lukas-reineke/indent-blankline.nvim"})

  -- https://github.com/akinsho/bufferline.nvim
  -- Tabs for nvim
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'kyazdani42/nvim-web-devicons'}
  vim.opt.termguicolors = true
  require("bufferline").setup{}

  -- https://github.com/mbbill/undotree
  -- amazing undo with git style tree
  use({"mbbill/undotree"})

  -- https://github.com/tpope/vim-fugitive
  -- git plugin for vim
  use({'tpope/vim-fugitive'})


  -- https://github.com/nvim-tree/nvim-tree.lua
  use({
    'nvim-tree/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
  })
  require("nvim-tree").setup()

  -- nvim start screen
  use({
    "startup-nvim/startup.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("startup").setup({ theme = "Evil" })
    end,
  })

  ------------------------------------------------------------------------
  -- Packer default
  ------------------------------------------------------------------------
  
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
