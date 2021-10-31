local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
    file_ignore_patterns = {
        ".git",
        "build",
        "node_modules",
    },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-s>"] = actions.toggle_selection,
        ["<C-q>"] = actions.smart_send_to_qflist,
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
  },
}
