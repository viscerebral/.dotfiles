"Useful plugins 
"https://github.com/kien/ctrlp.vim
"https://github.com/scrooloose/nerdtree
"https://github.com/rking/ag.vim

"RUNTIMEPATHS
set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath^=~/.vim/bundle/nerdtree
set runtimepath^=~/.vim/bundle/ag

"MAPPINGS
"-insert mode
inoremap jw <Esc>
inoremap <c-d> <Esc>ddi

"SET
set number

if v:version < 703
    finish
endif

set number relativenumber


