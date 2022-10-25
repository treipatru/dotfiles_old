require('snippy').setup({
    snippet_dirs = '~/.config/nvim/lua/snippets',
    hl_group = 'Search',
    enable_auto = false,
    scopes = {
        _ = { 'ts', 'vue' },

        lua = function(scopes)
            if vim.api.nvim_buf_get_name(0):find('_spec.lua$') then
                table.insert(scopes, 'busted')
            end
            return scopes
        end,

        php = { '_', 'php', 'html', 'javascript' },
        ts  = { 'ts' },
        vue = { 'php', 'vue' },
    },
    mappings = {
        is = {
            ["<Tab>"] = "expand_or_advance",
            ["<S-Tab>"] = "previous",
        },
        nx = {
            ["<leader>x"] = "cut_text",
        },
    },
})
