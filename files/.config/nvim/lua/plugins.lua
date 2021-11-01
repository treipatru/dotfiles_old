-- Plugin manager: packer.nvim
-- https://github.com/wbthomason/packer.nvim
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

-- Auto install packer if not available
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'                 -- packer can manage itself

  -- Global dependencies
  use 'kyazdani42/nvim-web-devicons'           -- patched fonts
  use 'nvim-lua/plenary.nvim'                  -- nvim UI utils
  --

  use 'AndrewRadev/splitjoin.vim'              -- easy split/join statements
  use 'EdenEast/nightfox.nvim'                 -- color scheme
  use 'airblade/vim-rooter'                    -- set cwd root
  use 'famiu/bufdelete.nvim'                   -- better buffer delete
  use 'lewis6991/gitsigns.nvim'                -- git sidebar
  use 'mbbill/undotree'                        -- git-like undo tree
  use 'neovim/nvim-lspconfig'                  -- config for LSP
  use 'norcalli/nvim-colorizer.lua'            -- show colors in buffers
  use 'nvim-telescope/telescope.nvim'          -- fuzzy finder
  use 'p00f/nvim-ts-rainbow'                   -- rainboq brackets for Treesitter
  use 'stevearc/qf_helper.nvim'                -- better quickfix list
  use 'sunjon/shade.nvim'                      -- dim inactive splits
  use 'tamton-aquib/staline.nvim'              -- status line
  use 'tpope/vim-commentary'                   -- better commenting
  use 'tpope/vim-fugitive'                     -- git interface
  use 'tpope/vim-surround'                     -- easy change surrounding pairs
  use 'windwp/nvim-autopairs'                  -- auto-add end symbols
  use 'windwp/nvim-ts-autotag'                 -- auto-add end tags

  use {                                        -- treesitter
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }

  use {                                        -- code documentation generation
      'kkoomen/vim-doge',
      run = '-> doge#install()'
  }

  use {                                        -- autocompletion engine
      'ms-jpq/coq_nvim',
      branch  ='coq',
  }

  use {                                        -- snippets for COQ
      'ms-jpq/coq.artifacts',
      branch  ='artifacts',
  }

  use {                                        -- easyMotion replacement
      'phaazon/hop.nvim',
      as = 'hop',
      config = function()
          require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
      end
  }

  use {                                        -- Highlight TODO comments
      "folke/todo-comments.nvim",
      config = function()
          require("todo-comments").setup {
          }
      end
  }


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
