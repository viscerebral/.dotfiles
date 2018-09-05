set exrc
set secure

"Should/Could be set in projec specific .vimrc
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

set colorcolumn=120
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
Plugin 'majutsushi/tagbar'
Plugin 'valloric/youcompleteme'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'sjl/gundo.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" Funcions
function! CtagsGitPath()
	let git_path = split(system('git rev-parse --show-toplevel'),"\n")
	if v:shell_error == 0 && len(git_path) == 1
		let tags_file = git_path[0] . '/.git/tags '
		let tmp = system('ctags -R --extra=f -f ' . tags_file . git_path[0])
		echo 'tags generated to ' . tags_file 
	else
		let tmp = system('ctags -R *')
		echo 'no git repo, tags generated locally'
	endif
endfunction


" Assigning variables
" SET
"set tags=./tags;,tags;
set tags=tags,./tags,./.git/tags;$HOME

""STATUS LINE
set laststatus=2

"" LineNumbering
set number

if v:version > 703
	set number relativenumber
endif


 
" LET 
""leader
let mapleader=","

""CtrlP
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

""youcompleteme
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

let g:ycm_always_populate_location_list = 1
let g:ycm_enable_diagnostic_signs = 1

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

let g:ycm_error_symbol = '✗'
let g:ycm_warning_symbol = '⚠'

""Gundo
let g:gundo_prefer_python3 = 1

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
nnoremap <S-Space> i
nnoremap ln :lnext<cr>
nnoremap lp :lprevious<cr>
nnoremap <f7> :call CtagsGitPath()<CR>
nnoremap <F5> :GundoToggle<CR>

""CtrlP
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <C-b> :CtrlPBuffer<cr>

""TagBar
nnoremap <F8> :TagbarToggle<cr>

" AUTOCOMMANDS
""NERDTree

autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

