vim.g.mapleader = ' '                       -- assign leader key
require'settings'                           -- base settings

require'plugins'                            -- packer plugins
vim.cmd [[packadd packer.nvim]]             -- init packer

require'colorizer'.setup()                  -- colorize color strings
require'plugins.autopairs'                  -- autopairs config
require'plugins.gitsigns'                   -- git gutter
require'plugins.lang-server-config'         -- lsp settings
require'plugins.qf'                         -- quick fix helper
require'plugins.shade'                      -- dim inactive window
require'plugins.staline'                    -- status line
require'plugins.telescope'                  -- telescope cfg
require'plugins.treesitter'                 -- autocomplete
require'plugins.webdev-icons'               -- icons

require'utils'                              -- autocmds
require'keymaps'                            -- keys

vim.cmd [[colorscheme nordfox]]             -- set theme
