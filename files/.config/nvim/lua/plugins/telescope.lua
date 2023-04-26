require('telescope').setup{
  defaults = {
    path_display = {
        "shorten",                     -- shorten paths to max 4 chars
        shorten = 4,
    },
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
    prompt_prefix = '$ ',
    vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--hidden",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    },
    file_browser = {
        theme = "ivy",
    },
  },
  pickers = {
      buffers = {
          previewer = false,
          theme = "cursor",
          mappings = {
              i = {
                  ["<tab>"] = "close",
              },
        },
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
          previewer = false,
          theme = "cursor",
      },
  },
}

-- use fzf sorting
require('telescope').load_extension('file_browser')
require('telescope').load_extension('fzf')
require('telescope').load_extension('projects')
