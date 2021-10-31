vim.g.mapleader = ' '        -- assign leader key
require('settings')          -- base settings

require('plugins')           -- packer plugins
vim.cmd [[packadd packer.nvim]]  -- init packer

require('plugins.gitsigns')  -- git gutter
-- require('plugins.nvim-cmp')  -- autocomplete
require('plugins.telescope') -- telescope cfg
require('plugins.treesitter')  -- autocomplete
require('plugins.webdev-icons') -- icons
require('plugins.staline') -- status line
require('plugins.shade') -- dim inactive window

require('utils')             -- autocmds
require('keymaps')           -- keys

vim.cmd [[colorscheme nordfox]]  -- set theme

vim.g.coq_settings = {
  auto_start = 'shut-up',
}

local lsp = require('lspconfig')
local coq = require "coq"
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'tsserver' }
for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup(coq.lsp_ensure_capabilities(capabilities))
end

require'lspconfig'.tsserver.setup{}
require'colorizer'.setup()
