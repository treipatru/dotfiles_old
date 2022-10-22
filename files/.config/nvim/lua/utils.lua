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
        { 'FileType', 'gitcommit', [[silent! let b:EditorConfig_disable = 1 ]] };
    };
    lua_highlight = {
        { 'TextYankPost', '*', [[silent! lua vim.highlight.on_yank() {higroup="IncSearch", timeout=100}]] };
    };
    netrw = {
        { 'FileType', 'netrw',
            [[
                setlocal bufhidden=wipe
                hi! link netrwMarkFile IncSearch

                nmap <silent> <buffer> <Esc>        :Rexplore<cr>
                nmap <silent> <buffer> q            :Rexplore<cr>
                nmap <silent> <buffer> <c-j>        j
                nmap <silent> <buffer> <c-k>        k
                nmap <silent> <buffer> h            -
                nmap <silent> <buffer> l            <CR>
                nmap <silent> <buffer> <Tab>        mf
                nmap <silent> <buffer> <S-Tab>      mF
            ]]
        };
    };
    packer = {
        { 'BufWritePost', 'plugins.lua', 'PackerCompile' };
    };
    remove_whitespace_on_save = {
        { 'BufWritePre', '*', [[:%s/\s\+$//e]] };
    };
    resize_windows_proportionally = {
        { 'VimResized', '*', ':wincmd =' };
    };
    restore_cursor = {
        { 'BufRead', '*', [[call setpos(".", getpos("'\""))]] };
    };
    toggle_search_highlighting = {
        { 'InsertEnter', '*', 'setlocal nohlsearch' };
    };
    eslint_fix = {
        { 'BufWritePre', '*', [[ if exists(":EslintFixAll") | exe "EslintFixAll" | endif ]] };
    };
}

nvim_create_augroups(autocmds)
