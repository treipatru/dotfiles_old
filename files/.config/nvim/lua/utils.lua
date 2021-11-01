local nvim_command = vim.api.nvim_command

-- helper to create autocommand groups
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
    git_commit = {
        { "FileType", "gitcommit", [[silent! let b:EditorConfig_disable = 1 ]] };
    };
    lua_highlight = {
        { "TextYankPost", "*", [[silent! lua vim.highlight.on_yank() {higroup="IncSearch", timeout=400}]] };
    };
    netrw = {
        { "FileType", "netrw",
            [[
                setlocal bufhidden=wipe
                nmap <silent> <buffer> <Esc>        :Rexplore<cr>
                nmap <silent> <buffer> q            :Rexplore<cr>
                nmap <silent> <buffer> <Backspace>  -
                nmap <silent> <buffer> <Tab>        <CR>
            ]]
        };
    };
    packer = {
        { "BufWritePost", "plugins.lua", "PackerCompile" };
    };
    remove_whitespace_on_save = {
        { 'BufWritePre', '*', [[:%s/\s\+$//e]] };
    };
    resize_windows_proportionally = {
        { "VimResized", "*", ":wincmd =" };
    };
    restore_cursor = {
        { 'BufRead', '*', [[call setpos(".", getpos("'\""))]] };
    };
    toggle_search_highlighting = {
        { "InsertEnter", "*", "setlocal nohlsearch" };
    };
}

nvim_create_augroups(autocmds)
