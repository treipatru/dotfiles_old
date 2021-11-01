-- Map helper
local function map(mode, lhs, rhs, opts)
  local options = {
      noremap = true,
      silent = true,
  }

  if opts then options = vim.tbl_extend('force', options, opts) end

  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-----------------------------------------------------------------------------------------
-- Git
map('n', '<Leader>gg', ':0G <CR>')

-----------------------------------------------------------------------------------------
-- Windows and splits

-- Move around splits with ctrl+arrows
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
-- Open new vertical split
map('n', '<Leader>wv', ':vsp<CR>')
-- Close active split
map('n', '<Leader>wd', '<C-w>c')
-- Close buffer without closing split
map('n', '<Leader>bd', ':lua require("bufdelete").bufdelete(0, true)<CR>')

-----------------------------------------------------------------------------------------
-- Hop - easymotion replacement
map('n', '<Leader>ef', ':HopChar1 <CR>')
map('n', '<Leader>es', ':HopChar2 <CR>')
map('n', '<Leader>el', ':HopLine <CR>')

-----------------------------------------------------------------------------------------
-- Finders and explorers

-- Open explorer
map('n', '<Leader>,', ':Explore <CR>')
-- Fuzzy file finder
map('n', '<Leader><Leader>', ':Telescope git_files<CR>')
-- Buffer switcher
map('n', '<Leader>.', ':Telescope buffers<CR>')
-- Commands
map('n', '<Leader>c', ':Telescope commands<CR>')
-- Live grep
map('n', '<Leader>f', ':Telescope live_grep<CR>')
-- Grep word under cursor
map('n', '<Leader>*', ':lua require("telescope.builtin").grep_string({ search = vim.fn.expand "<cword>" })<CR>')
-- Resume previous search
map('n', '<Leader>;', ':Telescope resume<CR>')

-----------------------------------------------------------------------------------------
-- QuickFix

-- Next item
map('n', ']q', '<cmd>QNext<CR>')
-- Prev item
map('n', '[q', '<cmd>QPrev<CR>')
-- Open list
map('n', '<Leader>q', '<cmd>QFToggle!<CR>')

-----------------------------------------------------------------------------------------
-- LSP
map('n', '<Leader>cr', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<Leader>cd', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', '<Leader>cu', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
map('n', '<Leader>cf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
