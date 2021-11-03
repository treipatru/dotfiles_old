vim.g.mapleader = ' '                       -- assign leader key
require'settings'                           -- base settings

require'plugins'                            -- packer plugins
vim.cmd [[packadd packer.nvim]]             -- init packer

-- plugin configs
require'colorizer'.setup()
require('feline').setup({
    preset = 'noicon'
})
require'plugins.autopairs'
require'plugins.editorconfig'
require'plugins.gitsigns'
require'plugins.lang-server-config'
require'plugins.qf'
require'plugins.telescope'
require'plugins.todo-comments'
require'plugins.transparency-settings'
require'plugins.treesitter'
require'plugins.webdev-icons'

require'utils'                              -- autocmds
require'keymaps'                            -- keys

vim.cmd [[colorscheme nordfox]]             -- set theme

