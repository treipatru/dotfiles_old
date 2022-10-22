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
  use 'kyazdani42/nvim-web-devicons'                        -- patched fonts
  use 'nvim-lua/plenary.nvim'                               -- nvim UI utils
  --

  use 'AndrewRadev/splitjoin.vim'                           -- easy split/join statements
  use 'RRethy/nvim-treesitter-textsubjects'                 -- treesitter objects
  use 'Shatur/neovim-session-manager'                       -- session manager
  use 'ThePrimeagen/harpoon'                                -- mark files
  use 'airblade/vim-rooter'                                 -- set cwd root
  use 'catppuccin/nvim'                                     -- theme
  use 'dcampos/nvim-snippy'
  use 'editorconfig/editorconfig-vim'                       -- make vim respect editorconfig defs
  use 'famiu/bufdelete.nvim'                                -- better buffer delete
  use 'folke/todo-comments.nvim'                            -- highlight TODO comments
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'karb94/neoscroll.nvim'                               -- smooth scrolling
  use 'lewis6991/gitsigns.nvim'                               -- smooth scrolling
  use 'mbbill/undotree'                                     -- git-like undo tree
  use 'neovim/nvim-lspconfig'                               -- config for LSP
  use 'norcalli/nvim-colorizer.lua'                         -- show colors in buffers
  use 'nvim-lualine/lualine.nvim'                           -- status line
  use 'nvim-telescope/telescope-file-browser.nvim'          -- file browser extension
  use 'nvim-telescope/telescope.nvim'                       -- fuzzy finder
  use 'p00f/nvim-ts-rainbow'                                -- rainboq brackets for Treesitter
  use 'pantharshit00/vim-prisma'                            -- prisma highlighting
  use 'stevearc/qf_helper.nvim'                             -- better quickfix list
  use 'szw/vim-maximizer'                                   -- maximize split
  use 'tpope/vim-commentary'                                -- better commenting
  use 'tpope/vim-fugitive'                                  -- git interface
  use 'tpope/vim-surround'                                  -- easy change surrounding pairs
  use 'voldikss/vim-floaterm'                               -- floating terminal
  use 'williamboman/mason-lspconfig.nvim'
  use 'williamboman/mason.nvim'                             -- LSP server manager
  use 'windwp/nvim-autopairs'                               -- auto-add end symbols
  use 'windwp/nvim-ts-autotag'                              -- auto-add end tags

  use {
      'goolord/alpha-nvim',
      config = function ()
          require'alpha'.setup(require'alpha.themes.startify'.config)
      end
  }

  use {                                        -- treesitter
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }

  use {                                        -- telescope native fzf
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make',
  }

  use {                                        -- code documentation generation
      'kkoomen/vim-doge',
      run = '-> doge#install()'                -- :call doge#install()
  }

  use({                                        -- autocomplete
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'dcampos/cmp-snippy'
  })

  use({                                        -- custom text objects
      'kana/vim-textobj-user',
      'rhysd/vim-textobj-anyblock',
  })

  use {                                        -- easymotion replacement
      'ggandor/leap.nvim',
      config = function()
          require('leap').add_default_mappings()
      end
  }

  use {
      'folke/which-key.nvim',
      config = function()
          require('which-key').setup {}
      end
  }

  -- automatically set up configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)
