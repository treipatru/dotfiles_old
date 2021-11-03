require('transparent').setup({
  enable = true, -- boolean: enable transparent
  -- table/string: additional groups that should be clear
  -- In particular, when you set it to 'all', that means all avaliable groups
  extra_groups = 'all',
  -- table: groups you don't want to clear
  exclude = {
      'CursorLine',
      'IncSearch',
      'Visual',
  },
})
