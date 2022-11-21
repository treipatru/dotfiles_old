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

-- Easier jump to start/end of line
map('n', 'H', '^')
map('n', 'L', '$')

-- Keep things centered when jumping to next
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- Keep cursor in place when joining lines
map('n', 'J', 'mzJ`z')

-- o/O adds empty line without insert mode
map('n', 'o', 'o<Esc>')
map('n', 'O', 'O<Esc>')

-- Exit insert mode
map('i', 'jj', '<Esc>')

-- Search for buffers
map('n', '<Tab>', ':Telescope buffers<CR>')

-- Harpoon mark mappings
map('n', '<M-1>', ':lua require("harpoon.ui").nav_file(1)<CR>')
map('n', '<M-2>', ':lua require("harpoon.ui").nav_file(2)<CR>')
map('n', '<M-3>', ':lua require("harpoon.ui").nav_file(3)<CR>')
map('n', '<M-4>', ':lua require("harpoon.ui").nav_file(4)<CR>')
map('n', '<M-5>', ':lua require("harpoon.ui").nav_file(5)<CR>')
map('n', '<M-6>', ':lua require("harpoon.ui").nav_file(6)<CR>')
map('n', '<M-7>', ':lua require("harpoon.ui").nav_file(7)<CR>')
map('n', '<M-8>', ':lua require("harpoon.ui").nav_file(8)<CR>')
map('n', '<M-9>', ':lua require("harpoon.ui").nav_file(9)<CR>')
map('n', '<M-0>', ':lua require("harpoon.mark").add_file()<CR>')

-- `cw` changes inside word
map('x', 'w', 'iw')
map('o', 'w', 'iw')

-----------------------------------------------------------------------------------------
-- Leader Keys
wk.register({
  b = {
    name = "Buffers",
    d = { ":lua require('bufdelete').bufdelete(0, true)<CR>", "Delete" },
    o = { ":execute '%bdelete|edit #|normal `\"'|bdelete#<CR>", "Delete all" },
  },
  c = {
    name = "Code",
    d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition of symbol" },
    f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format buffer" },
    g = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Show diagnosic" },
    o = { "<cmd>lua vim.lsp.buf.references()<CR>", "Occurences of symbol" },
    r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename symbol in buffer" },
  },
  f = {
    name = "Find",
    b = { ':Telescope buffers<CR>', "Buffers"},
    c = { ':Telescope commands<CR>', "Commands"},
    e = { ":FloatermNew --name=ranger --autoclose=2 --height=0.8 --width=0.8 ranger<CR>", "Explore"},
    f = { ':lua require("plugins.telescope-custom").project_files()<CR>', "Find files"},
    g = { ':Telescope live_grep<CR>', "Grep" },
    i = { ':lua require("telescope").extensions.neoclip.default()<CR>', "Register"},
    m = { ':lua require("harpoon.ui").toggle_quick_menu()<CR>', "Marked files" },
    p = { ':Telescope projects<CR>', "Projects"},
    r = { ':Telescope oldfiles<CR>', "Recent files"},
  },
  g = {
    name = "Git",
    b = { ":G blame<CR>", "Blame line" },
    c = { ":Telescope git_branches<CR>", "Checkout branch" },
    g = { ":0G <CR>", "Fugitive Status" },
    h = { ":0GcLog <CR>", "File history" },
    l = { ":GcLog <CR>", "Log" },
    r = { "<cmd>lua require'gitsigns'.reset_hunk()<CR>", "Reset hunk" },
    R = { "<cmd>lua require'gitsigns'.reset_buffer()<CR>", "Reset buffer" },
    s = { "<cmd>lua require'gitsigns'.stage_hunk()<CR>", "Stage hunk" },
    S = { "<cmd>lua require'gitsigns'.stage_buffer()<CR>", "Stage buffer" },
  },
  q = { "<cmd>QFToggle!<CR>", "QuickFix list"},
  s = { "<cmd>w<CR>", "Write buffer"},
  u = { "<cmd>UndotreeToggle<CR>", "Undotree"},
  w = {
    name = "Window",
    ["="] = { "<C-w>=", "Equalize splits" },
    d = { "<C-w>c", "Delete split" },
    h = { ":split<CR>", "Horizontal split" },
    m = { ":MaximizerToggle<CR>", "Maximize split" },
    o = { ":only<CR>", "Delete all" },
    v = { ":vsp<CR>", "Vertical split" },
  },
  ["*"] = { ':lua require("plugins.telescope-custom").grep_prompt()<CR>', "Grep word"},
  ["."] = { ':lua require("plugins.telescope-custom").browse_buffer_folder()<CR>', "File browser"},
  [","] = { ':Telescope buffers<CR>', "Buffers"},
  [";"] = { ":Telescope resume<CR>", "Resume Telescope"},
  ["<Space>"] = { ':Telescope git_files<CR>', "Find files"},
}, { prefix = "<leader>" })

-----------------------------------------------------------------------------------------
-- Next
wk.register({
    c = { "<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>zzzv", "Hunk" },
    d = { "<cmd>lua vim.diagnostic.get_next()<CR>zzzv", "Diagnostic" },
    q = { "<cmd>QNext<CR>zzzv", "QuickFix list item" },
}, { prefix = "]" })

-----------------------------------------------------------------------------------------
-- Previous
wk.register({
    c = { "<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>zzzv", "Hunk" },
    d = { "<cmd>lua vim.diagnostic.get_prev()<CR>zzzv", "Diagnostic" },
    q = { "<cmd>QPrev<CR>zzzv", "QuickFix list item" },
}, { prefix = "[" })
