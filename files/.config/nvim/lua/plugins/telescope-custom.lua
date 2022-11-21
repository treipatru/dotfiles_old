local M = {}

-- Switch to find files if cwd is not repo
M.project_files = function()
    local opts = {}
    local ok = pcall(require'telescope.builtin'.git_files, opts)
    if not ok then require'telescope.builtin'.find_files(opts) end
end

-- File browser in current buffer directory
M.browse_buffer_folder  = function()
    local opts = {
        cwd = require("telescope.utils").buffer_dir()
    }

    require 'telescope'.extensions.file_browser.file_browser(opts)
end

-- Prompt for word to grep
function M.grep_prompt()
  require("telescope.builtin").grep_string {
    path_display = {
        "shorten",                     -- shorten paths to max 4 chars
        shorten = 4,
    },
    search = vim.fn.input "Rg ",
  }
end

return M
