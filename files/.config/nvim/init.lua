vim.g.mapleader = ' '                       -- assign leader key
require'settings'                           -- base settings

require'plugins'                            -- packer plugins
vim.cmd [[packadd packer.nvim]]             -- init packer

-- plugin configs
require'colorizer'.setup()
require'plugins.autopairs'
require'plugins.editorconfig'
require'plugins.gitsigns'
require'plugins.lang-server-config'
require'plugins.neoclip'
require'plugins.neoscroll'
require'plugins.qf'
require'plugins.statusline'
require'plugins.telescope'
require'plugins.theme'
require'plugins.todo-comments'
require'plugins.treesitter'
require'plugins.webdev-icons'
require'plugins.snippy'
require'plugins.session-manager'
require('leap').add_default_mappings()
require('which-key').setup {}

require'utils'                              -- autocmds
require'keymaps'                            -- keys
