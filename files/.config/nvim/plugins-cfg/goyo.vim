let g:goyo_width = 100

function! s:goyo_enter()
  if exists(":SignifyDisableAll")
    set wrap
    SignifyDisableAll
    set background=dark
  endif

  set number
  set norelativenumber
endfunction

function! s:goyo_leave()
  if exists(":SignifyEnableAll")
    set nowrap
    SignifyEnableAll
    hi Normal guibg=NONE ctermbg=NONE
  endif

  set relativenumber
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
