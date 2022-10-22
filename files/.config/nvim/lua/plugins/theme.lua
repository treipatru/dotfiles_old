vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

require('catppuccin').setup({
    transparent_background = false,
    term_colors = false,
    dim_inactive = {
        enabled = true,
        shade = "dark",
        percentage = 0.2,
    },
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    integrations = {
        gitsigns = true,
        gitgutter = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
        ts_rainbow = true,
        which_key = true,
        cmp = true,
        mason = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
    color_overrides = {},
    custom_highlights = {},
})

vim.cmd [[colorscheme catppuccin]]
