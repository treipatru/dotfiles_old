require('neoclip').setup({
    filter = nil,
    preview = true,
    default_register = '"',
    default_register_macros = 'q',
    content_spec_column = false,
    keys = {
        telescope = {
            i = {
                select = '<c-x>',
                paste = '<cr>',
                paste_behind = '<c-z>',
            },
        },
        fzf = {
            select = 'default',
            paste = 'ctrl-p',
            paste_behind = 'ctrl-k',
            custom = {},
        },
    },
})
