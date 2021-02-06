let g:goyo_width = 100

function! s:goyo_enter()
  if exists(":SignifyDisableAll")
    set wrap
    set showtabline=0
    SignifyDisableAll
  endif

  set number
  set norelativenumber
endfunction

function! s:goyo_leave()
  if exists(":SignifyEnableAll")
    set nowrap
    set showtabline=2
    SignifyEnableAll
  endif

  set relativenumber
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
