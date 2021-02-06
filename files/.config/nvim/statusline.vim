set statusline=

set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ N\ ':''}
set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ I\ ':''}
set statusline+=%#DiffChange#%{(mode()=='c')?'\ \ C\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ R\ ':''}
set statusline+=%#Cursor#%{(mode()=='v')?'\ \ V\ ':''}

set statusline+=%#Visual#
set statusline+=┆\ %(%{b:gitbranch}%)┆
set statusline+=\%(%{b:gitstatus}%)┆

set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}
set statusline+=%R

set statusline+=%#CursorIM#
set statusline+=\ %(%{b:shortpath}%)

set statusline+=%=
set statusline+=\%{coc#status()}\ ┆
set statusline+=\ %(%{b:fileicon}%)\ ┆
set statusline+=\%3l:%-2c\┆
set statusline+=\%3p%%
