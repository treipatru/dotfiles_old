local Alpha = require'alpha'
local Dashboard = require'alpha.themes.dashboard'
local Path = require'plenary.path'
local Session_Manager = require'session_manager'
local Telescope = require'telescope'

-- session manager
Session_Manager.setup({
  sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'), -- The directory where the session files will be saved.
  path_replacer = '__', -- The character to which the path separator will be replaced for session files.
  colon_replacer = '++', -- The character to which the colon symbol will be replaced for session files.
  autoload_last_session = false, -- Automatically load last session on startup is started without arguments.
  autosave_last_session = true, -- Automatically save last session on exit.
  autosave_ignore_not_normal = true, -- Plugin will not save a session when no writable and listed buffers are opened.
})
Telescope.load_extension('sessions')

-- startup screen
Dashboard.section.header.val = {
    "                                                 ",
    "                                     oo          ",
    "                                                 ",
    "88d888b. .d8888b. .d8888b. dP   .dP dP 88d8b.d8b.",
    "88'  `88 88ooood8 88'  `88 88   d8' 88 88'`88'`88",
    "88    88 88.  ... 88.  .88 88 .88'  88 88  88  88",
    "dP    dP `88888P' `88888P' 8888P'   dP dP  dP  dP",
    "                                                 ",
}

Dashboard.section.buttons.val = {
    Dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
    Dashboard.button( "f", "  > Find file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
    Dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
    Dashboard.button( "s", "  > Sessions" , ":Telescope sessions<CR>"),
    Dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
}

Alpha.setup(Dashboard.opts)
