-- Plugin manager: packer.nvim
-- https://github.com/wbthomason/packer.nvim
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

-- auto install packer if not available
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'                              -- packer can manage itself

  -- Global dependencies
  use ({
      'kyazdani42/nvim-web-devicons',                       -- patched fonts
      'nvim-lua/plenary.nvim',                              -- nvim UI utils
      'nvim-telescope/telescope-file-browser.nvim',         -- file browser extension
      'nvim-telescope/telescope.nvim',                      -- fuzzy finder
  })
  use {                                                     -- telescope native fzf
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make',
  }

  -- Treesitter and completion
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use({
      'RRethy/nvim-treesitter-textsubjects',                -- treesitter objects
      'neovim/nvim-lspconfig',                              -- config for LSP
      'p00f/nvim-ts-rainbow',                               -- rainbow brackets for Treesitter
      'williamboman/mason-lspconfig.nvim',                  -- mason interfact to lspconfig
      'williamboman/mason.nvim',                            -- manage lsp servers
  })
  use ({                                                    -- autocomplete engine
      'dcampos/cmp-snippy',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/nvim-cmp',
      'jose-elias-alvarez/null-ls.nvim',                    -- diagnostics, code action
  })

  -- Git
  use ({
      'lewis6991/gitsigns.nvim',
      'tpope/vim-fugitive',
  })

  -- Visual fluff
  use ({
      'catppuccin/nvim',                                    -- theme
      'folke/todo-comments.nvim',                           -- highlight TODO comments
      'karb94/neoscroll.nvim',                              -- smooth scrolling
      'norcalli/nvim-colorizer.lua',                        -- show colors in buffers
      'nvim-lualine/lualine.nvim',                          -- status line
      'szw/vim-maximizer',                                  -- maximize split
  })

  -- Text objects
  use({
      'kana/vim-textobj-user',
      'rhysd/vim-textobj-anyblock',
  })

  -- Rest of plugins
  use ({
      'AckslD/nvim-neoclip.lua',                            -- register management
      'AndrewRadev/splitjoin.vim',                          -- easy split/join statements
      'ThePrimeagen/harpoon',                               -- mark files
      'airblade/vim-rooter',                                -- set cwd root
      'dcampos/nvim-snippy',                                -- snippets manager
      'editorconfig/editorconfig-vim',                      -- make vim respect editorconfig defs
      'famiu/bufdelete.nvim',                               -- better buffer delete
      'folke/which-key.nvim',                               -- key shortcuts helper
      'ggandor/leap.nvim',                                  -- easymotion like jumper
      'mbbill/undotree',                                    -- git-like undo tree
      'pantharshit00/vim-prisma',                           -- prisma highlighting
      'rmagatti/auto-session',                              -- session manager
      'stevearc/qf_helper.nvim',                            -- better quickfix list
      'tpope/vim-commentary',                               -- better commenting
      'tpope/vim-surround',                                 -- easy change surrounding pairs
      'voldikss/vim-floaterm',                              -- floating terminal
      'windwp/nvim-autopairs',                              -- auto-add end symbols
      'windwp/nvim-ts-autotag',                             -- auto-add end tagsp
  })

  use { 'kkoomen/vim-doge', run = '-> doge#install()' }     -- generate doc comments

  -- automatically set up configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)
