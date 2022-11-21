local g = vim.g
local o = vim.o
local opt = vim.opt

g.netrw_special_syntax = true
o.completeopt = 'menu,menuone,noselect'             -- completion
o.hlsearch = true
o.ignorecase = true
o.incsearch = true
o.wildmenu = false
opt.clipboard = 'unnamedplus'                       -- copy/paste to system clipboard
opt.cursorline = true
opt.expandtab = true                                -- use spaces instead of tabs
-- o.foldtext = [[substitute(getline(v:foldstart),'\\\\t',repeat('\\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]
-- opt.foldexpr='nvim_treesitter#foldexpr()'
-- opt.foldlevel = 4
-- opt.foldlevelstart = 3
-- opt.foldmethod = 'expr'
opt.hidden = true                                   -- enable background buffers
opt.history = 100                                   -- remember n lines in history
opt.incsearch = true
opt.mouse = 'a'
opt.number = true
opt.scrolloff = 15
opt.shiftwidth = 4                                  -- shift 4 spaces when tabbing
opt.showmatch = true
opt.sidescrolloff = 8                               -- columns of context
opt.smartindent = true                              -- autoindent new lines
opt.splitbelow = true                               -- prefer splitting below in horizontal
opt.splitright = true                               -- prefer splitting right in vertical
opt.swapfile = false                                -- don't create vim swap files
opt.tabstop = 4                                     -- 1 tab = 4 spaces
opt.termguicolors = true                            -- enable 24-bit RGB colors
opt.timeoutlen = 500                                -- leader key timeout
opt.undofile = true                                 -- store undo history in files
opt.updatetime = 50
opt.wrap = false                                    -- disable line wrap
opt.laststatus = 3                                    -- use single status line for all windows

vim.cmd [[set noshowmode]]                          -- hide mode from command
vim.cmd [[set relativenumber]]                      -- hide mode from command
vim.cmd [[set completeopt=menu,menuone,noselect]]   -- hide mode from command
vim.cmd [[let g:textobj#anyblock#blocks=[ '(', '{', '[', '<'] ]]

