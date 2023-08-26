vim.g.mapleader = ' '                       -- assign leader key
require'settings'                           -- base settings

require'plugins'                            -- packer plugins
vim.cmd [[packadd packer.nvim]]             -- init packer

-- plugin custom configs
require'plugins.autopairs'
require'plugins.editorconfig'
require'plugins.gitsigns'
require'plugins.lang-server-config'
require'plugins.neoclip'
require'plugins.neoscroll'
require'plugins.qf'
require'plugins.snippy'
require'plugins.statusline'
require'plugins.telescope'
require'plugins.theme'
require'plugins.todo-comments'
require'plugins.treesitter'
require'plugins.webdev-icons'
require'plugins.transparency-settings'
-- plugins defaults
require'colorizer'.setup()
require('project_nvim').setup {}
require('Comment').setup()
require('leap').add_default_mappings()
require('neogen').setup {}
require('nvim-surround').setup({})
require('which-key').setup {}
-- other configs
require'utils'                              -- autocmds
require'keymaps'                            -- keys
