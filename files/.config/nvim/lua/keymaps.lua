local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}
local global = vim.g

-- Example map to lua function
-- vim.api.nvim_set_keymap('n', '$', "<cmd>lua require'hop'.hint_words()<cr>", {})

-- Move around splits with ctrl+arrows
map('n', '<C-h>', '<C-w>h', default_opts)
map('n', '<C-j>', '<C-w>j', default_opts)
map('n', '<C-k>', '<C-w>k', default_opts)
map('n', '<C-l>', '<C-w>l', default_opts)

-- Open new vertical split
map('n', '<Leader>wv', ':vsp<CR>', default_opts)
-- Close active split
map('n', '<Leader>wd', '<C-w>c', default_opts)
-- Close buffer without closing split
map('n', '<Leader>bd', '::b#|bd#<CR>', default_opts)

-- Finders
map('n', '<Leader><Leader>', ':LeaderfFile<CR>', default_opts)
map('n', '<Leader>.',        ':LeaderfBuffer<CR>', default_opts)

-- Hop (easymotion replacement)
map('n', '<Leader>ef', ':HopChar1 <CR>', default_opts)
map('n', '<Leader>es', ':HopChar2 <CR>', default_opts)
map('n', '<Leader>el', ':HopLine <CR>', default_opts)

-- Netrw
map('n', '<Leader>,', ':Explore <CR>', default_opts)

-- Fugitive
map('n', '<Leader>gg', ':vertical G <CR>', default_opts)
