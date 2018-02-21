set exrc
set secure

"Should/Could be set in projec specific .vimrc
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

set colorcolumn=110
highlight ColorColumn ctermbg=darkgray

"2DO
"set makeprg=make\ -C\ ../build\ -j9
"nnoremap <F4> :make!<cr>
"nnoremap <F5> :!./my_great_program<cr>
"

"Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'valloric/youcompleteme'
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required



"LET
""leader
let mapleader=","

""CtrlP
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

""Syntastic
let g:syntastic_cpp_compiler = "g++"
let g:syntastic_cpp_compiler_options = "-std=c++11 -Wall -Wextra"

let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_python_checkers = ['pylint', 'pylint3']

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""youcompleteme
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/youcompleteme/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'


"MAPPINGS

""NERDTree
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

""CtrlP
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <C-b> :CtrlPBuffer<cr>
nnoremap <Tab> <Esc>

""TagBar
nnoremap <F8> :TagbarToggle<cr>


"SET
""STATUS LINE
set laststatus=2

"" LineNumbering
set number

if v:version < 703
    finish
endif

set number relativenumber

