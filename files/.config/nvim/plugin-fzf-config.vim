let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'down': '50%' }

"Use RG instead of FZF because it's faster but let's pretend it's FZF.
let $FZF_DEFAULT_COMMAND = 'rg --files --ignore-case --hidden -g "!{.git,coverage,dist,node_modules,vendor}/*"'
command! -bang -nargs=? -complete=dir Files
     \ call fzf#vim#files(<q-args>, <bang>0)

" Ripgrep finder
" function! RipgrepFzf(query, fullscreen)
"   let command_fmt = 'rg --line-number  --context 1 --heading --hidden --color=always --smart-case -- %s || true'
"   let initial_command = printf(command_fmt, shellescape(a:query))
"   let reload_command = printf(command_fmt, '{q}')
"   let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
"   call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
" endfunction

" command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
