" Airline
let g:airline_detect_modified=1
let g:airline_inactive_collapse=1
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline_stl_path_style = 'short'

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


let g:airline_section_z = "\u2261 %l/%L:%c"

" Airline Tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1

" Map buffers to Alt+#
nmap <m-1> <Plug>AirlineSelectTab1
nmap <m-2> <Plug>AirlineSelectTab2
nmap <m-3> <Plug>AirlineSelectTab3
nmap <m-4> <Plug>AirlineSelectTab4
nmap <m-5> <Plug>AirlineSelectTab5
nmap <m-6> <Plug>AirlineSelectTab6
nmap <m-7> <Plug>AirlineSelectTab7
nmap <m-8> <Plug>AirlineSelectTab8
nmap <m-9> <Plug>AirlineSelectTab9
nmap <m-0> <Plug>AirlineSelectTab0
nmap <m--> <Plug>AirlineSelectPrevTab
nmap <m-+> <Plug>AirlineSelectNextTab
