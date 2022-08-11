return require('packer').startup({function(use)

  -- Plugin manager
  use 'wbthomason/packer.nvim'

  -- Icons
  use 'kyazdani42/nvim-web-devicons'

  -- Theme
  use {
    'olimorris/onedarkpro.nvim',
    config = function() require('onedarkpro').load() end
  }

  -- Word cursor
  use 'yamatsum/nvim-cursorline'

  -- Multi cursor
  use 'mg979/vim-visual-multi'

  -- Buffer bar
  use 'romgrk/barbar.nvim'

  -- Status bar
  use {
    'nvim-lualine/lualine.nvim',
    config = function() require('lualine').setup {} end
  }

  -- Keymappings
  use 'b0o/mapx.nvim'

  -- Whichkey
  use "folke/which-key.nvim"

  -- Comments
  use {
    'terrortylor/nvim-comment',
    config = function() require('nvim_comment').setup() end
  }

  -- Auto bracket pairs
  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup() end
  }

  -- Side file tree view
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = function() require('user.tree') end
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require('user.treesitter') end
  }

  -- LSP
  use 'neovim/nvim-lspconfig'

  -- Completion ---------------------------------------------------------------
  -- Base
  use 'hrsh7th/nvim-cmp'

  -- LSP
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'

  -- Path
  use 'hrsh7th/cmp-path'

  -- Buffer
  use 'hrsh7th/cmp-buffer'

  -- Snippets
  use 'saadparwaiz1/cmp_luasnip'
  -----------------------------------------------------------------------------

  -- Snippets
  use 'rafamadriz/friendly-snippets'
  use {
    'L3MON4D3/LuaSnip',
    config = function() require('luasnip.loaders.from_vscode').lazy_load() end
  }

  -- Venn diagram
  use "jbyuki/venn.nvim"

  -- MD cooler preview
  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- Git integration
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  -- Lazygit
  use "kdheepak/lazygit.nvim"

  -- Pretty pop-ups
  use {
    'stevearc/dressing.nvim',
    config = function()
      require('dressing').setup()
    end
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function()
      require('telescope').setup{}
    end
  }

  use {
    'mizlan/iswap.nvim',
    config = function()
      require('iswap').setup()
    end
  }

end,
config = {
  display = {
    open_fn = function ()
      return require('packer.util').float({ border = 'single' })
    end
  }
}})
