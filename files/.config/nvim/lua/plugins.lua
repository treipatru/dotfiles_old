-- Plugin manager: packer.nvim
-- https://github.com/wbthomason/packer.nvim
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
  use {
      'ms-jpq/coq_nvim',
      branch  ='coq',
  }
  use {
      'ms-jpq/coq.artifacts',
      branch  ='artifacts',
  }
  use 'p00f/nvim-ts-rainbow'

  -- Easymotion replacement
  use {
      'phaazon/hop.nvim',
      as = 'hop',
      config = function()
          require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
      end
  }

  -- Various interface
  use 'sunjon/shade.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'tamton-aquib/staline.nvim'
  use {
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
  }

  -- Others
  use 'airblade/vim-rooter'
  use 'mbbill/undotree'
  use 'norcalli/nvim-colorizer.lua'
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use 'windwp/nvim-autopairs'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
