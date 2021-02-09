set statusline=

set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ Normal\ ':''}
set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ Insert\ ':''}
set statusline+=%#DiffChange#%{(mode()=='c')?'\ \ Command\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ Replace\ ':''}
set statusline+=%#Cursor#%{(mode()=='v')?'\ \ V\ ':''}

set statusline+=%#Visual#
set statusline+=\ %{nerdfont#find()}
set statusline+=\ %(%{b:shortpath}%)

set statusline+=\ %(%{b:gitbranch}%)
set statusline+=\ %(%{b:gitstatus}%)

set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}
set statusline+=%R

set statusline+=%=
set statusline+=\%{coc#status()}
set statusline+=\[%3l:%-2c]
