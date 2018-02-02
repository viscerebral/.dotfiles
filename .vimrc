"Useful plugins 
"https://github.com/ctrlpvim/ctrlp.vim
"https://github.com/scrooloose/nerdtree
"https://github.com/rking/ag.vim
"https://github.com/xolox/vim-easytags
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

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'valloric/youcompleteme'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
""Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'

" Git plugin not hosted on GitHub
""Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
""Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.

" Pass the path to set the runtimepath properly.
""Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line




"RUNTIMEPATHS
"  set runtimepath^=~/.vim/bundle/ctrlp.vim
"  set runtimepath^=~/.vim/bundle/nerdtree
"  set runtimepath^=~/.vim/bundle/ag
"  set runtimepath^=~/.vim/bundle/misc
"  set runtimepath^=~/.vim/bundle/easytags

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

""YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/youcompleteme/cpp/ycm/.ycm_extra_conf.py'

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


""STATUS LINE
set laststatus=2
"set statusline=%F

"function! GitBranch()
"  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
"endfunction
"
"function! StatuslineGit()
"  let l:branchname = GitBranch()
"  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
"endfunction

"set statusline=
"set statusline+=%#PmenuSel#
"set statusline+=%{StatuslineGit()}
"set statusline+=%#LineNr#
"set statusline+=\ %f
"set statusline+=%m\
"set statusline+=%=
"set statusline+=%#CursorColumn#
"set statusline+=\ %y
"set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
"set statusline+=\[%{&fileformat}\]
"set statusline+=\ %p%%
"set statusline+=\ %l:%c
"set statusline+=\ 

"" LineNumbering
set number

if v:version < 703
    finish
endif

set number relativenumber

