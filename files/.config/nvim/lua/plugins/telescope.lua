require('telescope').setup{
  defaults = {
    file_ignore_patterns = {
        ".git",
        "build",
        "node_modules",
    },
    mappings = {
      i = {
        ["<esc>"] = "close",
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<C-s>"] = "toggle_selection",
        ["<C-q>"] = "smart_send_to_qflist",
      },
    },
  },
  pickers = {
      buffers = {
          theme = "ivy",
      },
      find_files = {
          previewer = false,
          theme = "ivy",
      },
      git_branches = {
          previewer = false,
          theme = "ivy",
          mappings = {
              i = {
                  ["<CR>"] = "git_create_branch",
              }
          },
      },
      git_files = {
          previewer = false,
          theme = "ivy",
      },
      grep_string = {
          theme = "ivy",
      },
      live_grep = {
          theme = "ivy",
      },
      oldfiles = {
          theme = "ivy",
      },
  },
}
