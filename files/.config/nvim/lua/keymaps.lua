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

-----------------------------------------------------------------------------------------
-- Windows and splits

-- Move around splits with ctrl+arrows
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

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
  },
  g = {
    name = "Git",
    b = { "<cmd>lua require'gitsigns'.blame_line(true)<CR>", "Blame line" },
    c = { ":Telescope git_branches<CR>", "Checkout branch" },
    g = { ":0G <CR>", "Fugitive Status" },
    h = { ":0GcLog <CR>", "File history" },
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
    d = { "<C-w>c", "Delete split" },
    h = { ":split<CR>", "Horizontal split" },
    v = { ":vsp<CR>", "Vertical split" },
  },
  ["*"] = { ':lua require("telescope.builtin").grep_string({ search = vim.fn.expand "<cword>" })<CR>', "Grep word"},
  [","] = { ':Explore<CR>', "Explore"},
  ["."] = { ':Telescope buffers<CR>', "Buffers"},
  [";"] = { ":Telescope resume<CR>", "Resume Telescope"},
  ["<Space>"] = { ':Telescope git_files<CR>', "Find files"},
}, { prefix = "<leader>" })

-----------------------------------------------------------------------------------------
-- Next
wk.register({
    c = { "<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>", "Hunk" },
    d = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Diagnostic" },
    q = { "<cmd>QNext<CR>", "QuickFix list item" },
}, { prefix = "]" })


-----------------------------------------------------------------------------------------
-- Previous
wk.register({
    c = { "<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>", "Hunk" },
    d = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", "Diagnostic" },
    q = { "<cmd>QPrev<CR>", "QuickFix list item" },
}, { prefix = "[" })
