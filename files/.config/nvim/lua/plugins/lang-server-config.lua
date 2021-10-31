local lspcfg = require('lspconfig')

-- Coq setttings must be defined before require
vim.g.coq_settings = {
  ['auto_start'] = 'shut-up',
  ['keymap.jump_to_mark'] = '', -- just do override the annoying <c-h> default
}
local coq = require "coq"

-- Servers definitions
local capabilities = vim.lsp.protocol.make_client_capabilities()
local servers = {
    'tsserver',
    'sumneko_lua',
}
for _, lsp in ipairs(servers) do
  lspcfg[lsp].setup(coq.lsp_ensure_capabilities(capabilities))
end

-- TypeScript
lspcfg.tsserver.setup{}
-- LUA
require('plugins.lang-server-lua')
