function! s:goyo_enter()
  if exists(":SignifyDisableAll")
    SignifyDisableAll
  endif

  set number
  set norelativenumber
endfunction

function! s:goyo_leave()
  if exists(":SignifyEnableAll")
    SignifyEnableAll
  endif

  set relativenumber
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
