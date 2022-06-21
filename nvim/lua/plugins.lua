
return require('packer').startup(function()
  use 'wbthomason/packer.nvim'        -- Plugin manager


  -- Appearence
  --
  use 'kyazdani42/nvim-web-devicons'  -- Icons
  use {
    'olimorris/onedarkpro.nvim',      -- Color theme
    config = function()
      require'onedarkpro'.load()
    end
  }
  use 'yamatsum/nvim-cursorline'      -- Underline word
  use 'romgrk/barbar.nvim'            -- Status bar
  use {                               
    'nvim-lualine/lualine.nvim',      -- Bottom bar
    config = function()
      require'lualine'.setup()
    end
  }

  -- Utils
  --
  use 'b0o/mapx.nvim'                 -- Keymapping

  use 'ellisonleao/glow.nvim'
  use 'junegunn/vim-easy-align'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'honza/vim-snippets'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'glepnir/dashboard-nvim'
  use 'ray-x/lsp_signature.nvim'
  use {
      'windwp/nvim-autopairs',
      config = function() require'nvim-autopairs'.setup{} end
  }
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }
  use {
      'kyazdani42/nvim-tree.lua',
      requires = {'kyazdani42/nvim-web-devicons'},
      config = function() require'tree' end
  }
  use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
  }
end)
