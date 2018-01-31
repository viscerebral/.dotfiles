"Useful plugins 
"https://github.com/ctrlpvim/ctrlp.vim
"https://github.com/scrooloose/nerdtree
"https://github.com/rking/ag.vim
"https://github.com/xolox/vim-easytags

"RUNTIMEPATHS
set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath^=~/.vim/bundle/nerdtree
set runtimepath^=~/.vim/bundle/ag
set runtimepath^=~/.vim/bundle/misc
set runtimepath^=~/.vim/bundle/easytags

"LET
""leader
let mapleader=","

""CtrlP
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

"MAPPINGS
""
"NERDTree
map <C-n> :NERDTreeToggle<cr>

""-insert mode
inoremap jw <Esc>
inoremap wj <Esc>
inoremap ii <Esc>
inoremap <C-L> <Esc>
inoremap <S-Space> <Esc>

inoremap <C-d> <Esc>ddi

""-normal mode
nnoremap <Tab> <Esc>
nnoremap <S-Space> i
"CtrlP
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <C-b> :CtrlPBuffer<cr>
nnoremap <Tab> <Esc>

"SET
"set tags=tags,./tags,./.git/tags;$HOME
"set tags+=./.git/tags
set laststatus=2
set statusline=%F

set number

if v:version < 703
    finish
endif

set number relativenumber


