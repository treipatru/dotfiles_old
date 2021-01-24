" File picker
nnoremap <silent> <leader>p :Files<CR>

let $FZF_DEFAULT_COMMAND = 'rg --files --ignore-case --hidden -g "!{.git,coverage,dist,node_modules,vendor}/*"'
command! -bang -nargs=? -complete=dir Files
     \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" File History
nnoremap <silent> <leader>h :History<CR>

let g:fzf_buffers_jump = 1

" Ripgrep finder
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number  --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

nnoremap <silent> <leader>f :RG!<CR>

let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
