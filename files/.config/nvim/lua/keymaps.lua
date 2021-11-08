local wk = require("which-key")

-- Map helper
local function map(mode, lhs, rhs, opts)
  local options = {
      noremap = true,
      silent = true,
  }

  if opts then options = vim.tbl_extend('force', options, opts) end

  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Helper to escape termcodes when dealing with expression keymaps
-- local function t(str)
--     return vim.api.nvim_replace_termcodes(str, true, true, true)
-- end


-----------------------------------------------------------------------------------------
-- Navigation and other improvements

-- Move around splits with ctrl+arrows
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Uppercase y yanks from cursor to last non-blank character of line
map('n', 'Y', 'yg_')

-- Change whatever is under cursor, use repeat for next/prev occurence
map('n', 'c*', '*``cgn')
map('n', 'c#', '#``cgN')

-- Easier jump to start/end of line
map('n', 'H', '^')
map('n', 'L', '$')

-- Keep things centered when jumping to next
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- Keep cursor in place when joining lines
map('n', 'J', 'mzJ`z')

-- Spaces in insert mode act as undo break points
map('i', ' ', ' <c-g>u')

-- o/O adds empty line without insert mode
map('n', 'o', 'o<Esc>')
map('n', 'O', 'O<Esc>')

-----------------------------------------------------------------------------------------
-- Leader Keys
wk.register({
  b = {
    name = "Buffers",
    d = { ":lua require('bufdelete').bufdelete(0, true)<CR>", "Delete" }
  },
  c = {
    name = "Code",
    d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition of symbol" },
    f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format buffer" },
    o = { "<cmd>lua vim.lsp.buf.references()<CR>", "Occurences of symbol" },
    r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename symbol in buffer" },
  },
  f = {
    name = "Find",
    b = { ':Telescope buffers<CR>', "Buffers"},
    c = { ':Telescope commands<CR>', "Commands"},
    e = { ':Explore<CR>', "Explore"},
    f = { ':Telescope git_files<CR>', "Find files"},
    g = { ':Telescope live_grep<CR>', "Grep" },
    r = { ':Telescope oldfiles<CR>', "Recent files"},
    s = { ":Telescope sessions<CR>", "Sessions"},
  },
  g = {
    name = "Git",
    b = { "<cmd>lua require'gitsigns'.blame_line(true)<CR>", "Blame line" },
    c = { ":Telescope git_branches<CR>", "Checkout branch" },
    g = { ":0G <CR>", "Fugitive Status" },
    h = { ":0GcLog <CR>", "File history" },
    l = { ":GcLog <CR>", "Log" },
    r = { "<cmd>lua require'gitsigns'.reset_hunk()<CR>", "Reset hunk" },
    R = { "<cmd>lua require'gitsigns'.reset_buffer()<CR>", "Reset buffer" },
    s = { "<cmd>lua require'gitsigns'.stage_hunk()<CR>", "Stage hunk" },
    S = { "<cmd>lua require'gitsigns'.stage_buffer()<CR>", "Stage buffer" },
  },
  j = {
    name = "Jump",
    c = { ":HopChar1 <CR>", "Character" },
    l = { ":HopLine <CR>", "Line" },
    w = { ":HopWord <CR>", "Word" },
  },
  q = { "<cmd>QFToggle!<CR>", "QuickFix list"},
  u = { "<cmd>UndotreeToggle<CR>", "Undotree"},
  w = {
    name = "Window",
    ["="] = { "<C-w>=", "Equalize splits" },
    d = { "<C-w>c", "Delete split" },
    h = { ":split<CR>", "Horizontal split" },
    m = { ":MaximizerToggle<CR>", "Maximize split" },
    v = { ":vsp<CR>", "Vertical split" },
  },
  ["*"] = { ':lua require("telescope.builtin").grep_string({ search = vim.fn.expand "<cword>" })<CR>', "Grep word"},
  ["."] = { ':Explore<CR>', "Explore"},
  [","] = { ':Telescope buffers<CR>', "Buffers"},
  [";"] = { ":Telescope resume<CR>", "Resume Telescope"},
  ["<Space>"] = { ':Telescope git_files<CR>', "Find files"},
}, { prefix = "<leader>" })

-----------------------------------------------------------------------------------------
-- Next
wk.register({
    c = { "<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>zzzv", "Hunk" },
    d = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>zzzv", "Diagnostic" },
    q = { "<cmd>QNext<CR>zzzv", "QuickFix list item" },
}, { prefix = "]" })

-----------------------------------------------------------------------------------------
-- Previous
wk.register({
    c = { "<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>zzzv", "Hunk" },
    d = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>zzzv", "Diagnostic" },
    q = { "<cmd>QPrev<CR>zzzv", "QuickFix list item" },
}, { prefix = "[" })
