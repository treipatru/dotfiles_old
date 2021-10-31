local nvim_command = vim.api.nvim_command

-- autocommands
-------- This function is taken from https://github.com/norcalli/nvim_utils
function nvim_create_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        nvim_command('augroup '..group_name)
        nvim_command('autocmd!')
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
            nvim_command(command)
        end
        nvim_command('augroup END')
    end
end

local autocmds = {
    packer = {
        { "BufWritePost", "plugins.lua", "PackerCompile" };
    };
    netrw = {
        { "FileType", "netrw",
            [[
                setlocal bufhidden=wipe
                nmap <silent> <buffer> <Esc> :Rexplore<cr>
            ]]
        };
    };
    restore_cursor = {
        { 'BufRead', '*', [[call setpos(".", getpos("'\""))]] };
    };
    resize_windows_proportionally = {
        { "VimResized", "*", ":wincmd =" };
    };
    toggle_search_highlighting = {
        { "InsertEnter", "*", "setlocal nohlsearch" };
    };
    lua_highlight = {
        { "TextYankPost", "*", [[silent! lua vim.highlight.on_yank() {higroup="IncSearch", timeout=400}]] };
    };
    remove_whitespace_on_save = {
        { 'BufWritePre', '*', [[:%s/\s\+$//e]] };
    };
}

nvim_create_augroups(autocmds)
-- autocommands END
