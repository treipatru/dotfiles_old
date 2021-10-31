-- Plugin manager: packer.nvim
-- https://github.com/wbthomason/packer.nvim

local cmd = vim.cmd
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

-- Auto install packer if not available
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Color scheme
  use 'EdenEast/nightfox.nvim'

  -- Fuzzy finders
  use {
      'nvim-telescope/telescope.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
  }
  use {
      'Yggdroot/LeaderF',
      run = ':LeaderfInstallCExtension'
  }

  -- LSP
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }
  use 'neovim/nvim-lspconfig'

  -- Autocomplete
  -- use { 'hrsh7th/nvim-cmp',
  --   requires = {
  --     'hrsh7th/cmp-buffer',
  --     'hrsh7th/cmp-cmdline',
  --     'hrsh7th/cmp-nvim-lsp',
  --     'hrsh7th/cmp-path',
  --     'saadparwaiz1/cmp_luasnip',
  --   },
  -- }

  use {
      'ms-jpq/coq_nvim',
      branch  ='coq',
  }

  -- Easymotion replacement
  use {
      'phaazon/hop.nvim',
      as = 'hop',
      config = function()
          require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
      end
  }

  -- Various interface
  use 'kyazdani42/nvim-web-devicons'
  use {
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
  }

  -- Others
  use 'p00f/nvim-ts-rainbow'
  use 'airblade/vim-rooter'
  use 'mbbill/undotree'
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use 'windwp/nvim-autopairs'
  use 'norcalli/nvim-colorizer.lua'
  use 'tamton-aquib/staline.nvim'
  use 'sunjon/shade.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
