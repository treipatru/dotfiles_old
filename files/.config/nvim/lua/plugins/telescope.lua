require('telescope').setup{
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  },
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

-- use fzf sorting
require('telescope').load_extension('fzf')
