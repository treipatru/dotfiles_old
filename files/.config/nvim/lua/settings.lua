local o = vim.o     -- global
local opt = vim.opt -- global/buffer/windows-scoped options

o.hlsearch = true
o.ignorecase = true
o.incsearch = true
o.wildmenu = false
o.completeopt = 'menu,menuone,noselect' -- completion
opt.clipboard = 'unnamedplus' -- copy/paste to system clipboard
opt.cursorline = true
opt.expandtab = true      -- use spaces instead of tabs
opt.foldmethod = 'marker'
opt.hidden = true         -- enable background buffers
opt.history = 100         -- remember n lines in history
opt.incsearch = true
opt.lazyredraw = true     -- faster scrolling
opt.mouse = 'a'
opt.number = true
opt.sidescrolloff = 8 -- columns of context
opt.scrolloff = 10
opt.shiftwidth = 4        -- shift 4 spaces when tab
opt.showmatch = true
opt.smartindent = true    -- autoindent new lines
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.tabstop = 4           -- 1 tab == 4 spaces
opt.timeoutlen = 500
opt.undofile = true
opt.updatetime = 50
opt.termguicolors = true      -- enable 24-bit RGB colors
opt.wrap = false -- disable line wrap
