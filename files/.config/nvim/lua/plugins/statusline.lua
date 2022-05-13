require'lualine'.setup{
  options = {
    icons_enabled = true,
    theme = 'palenight',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {{ 'mode', fmt = function(str) return str:sub(1,1) end }},
    lualine_b = {'filename'},
    lualine_c = {'branch', 'diff',
                  {'diagnostics', sources={'nvim_diagnostic', 'coc'}}},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
