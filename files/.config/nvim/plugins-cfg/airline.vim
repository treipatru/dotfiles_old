" Airline
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline_detect_modified=1
let g:airline_inactive_collapse=1
let g:airline_left_alt_sep=''
let g:airline_right_alt_sep=''
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_stl_path_style = 'short'

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <A-1> <Plug>AirlineSelectTab1
nmap <A-2> <Plug>AirlineSelectTab2
nmap <A-3> <Plug>AirlineSelectTab3
nmap <A-4> <Plug>AirlineSelectTab4
nmap <A-5> <Plug>AirlineSelectTab5
nmap <A-6> <Plug>AirlineSelectTab6
nmap <A-7> <Plug>AirlineSelectTab7
nmap <A-8> <Plug>AirlineSelectTab8
nmap <A-9> <Plug>AirlineSelectTab9
nmap <A-0> <Plug>AirlineSelectTab0

" let g:airline#extensions#tabline#fnamecollapse = 0

" let g:airline#extensions#branch#format = 'TrimBranchName'
" function! TrimBranchName(name)
"     let l:endPos = strchars(a:name)

"     if (l:endPos < 10)
"         return a:name
"     else
"         let l:startPos = endPos - 10
"         let l:trimmedName = strpart(a:name, startPos, endPos)
"         return '…' . trimmedName
" endfunction

let g:airline_filetype_overrides = {
    \ 'defx':  ['defx', '%{b:defx.paths[0]}'],
    \ 'fugitive': ['fugitive', '%{airline#util#wrap(airline#extensions#branch#get_head(),80)}'],
    \ 'gundo': [ 'Gundo', '' ],
    \ 'help':  [ 'Help', '%f' ],
    \ 'minibufexpl': [ 'MiniBufExplorer', '' ],
    \ 'startify': [ 'startify', '' ],
    \ 'vim-plug': [ 'Plugins', '' ],
    \ 'vimfiler': [ 'vimfiler', '%{vimfiler#get_status_string()}' ],
    \ 'vimshell': ['vimshell','%{vimshell#get_status_string()}'],
    \ 'vaffle' : [ 'Vaffle', '%{b:vaffle.dir}' ],
    \ }

let g:airline_mode_map = {
    \ '__'     : '-',
    \ 'c'      : 'C',
    \ 'i'      : 'I',
    \ 'ic'     : 'I',
    \ 'ix'     : 'I',
    \ 'n'      : 'N',
    \ 'multi'  : 'M',
    \ 'ni'     : 'N',
    \ 'no'     : 'N',
    \ 'R'      : 'R',
    \ 'Rv'     : 'R',
    \ 's'      : 'S',
    \ 'S'      : 'S',
    \ ''     : 'S',
    \ 't'      : 'T',
    \ 'v'      : 'V',
    \ 'V'      : 'V',
    \ ''     : 'V',
    \ }

let g:airline_section_z = "%l/%L:%c"
let g:airline_theme= "onedark"

let g:airline_powerline_fonts = 1
