set exrc
set secure

set encoding=UTF-8

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

"" Utilities
Plugin 'sjl/gundo.vim'
Plugin 'jeetsukumaran/vim-buffergator'

"" Utility exploration/search
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'gilsondev/searchtasks.vim'

"" Formatting and autofill
Plugin 'godlygeek/tabular'
Plugin 'townk/vim-autoclose'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/tpope-vim-abolish'

"" Git Support
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'
Plugin 'airblade/vim-gitgutter'
Plugin 'kablamo/vim-git-log'

"" Language Support
Plugin 'valloric/youcompleteme'
Plugin 'taketwo/vim-ros'

"" Themes
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"*********************
" Funcions
"*********************

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

"*********************
" SET
"*********************
syntax on

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
" set smarttab  ??
" set expandtab ??

"" Theme and Styling 
set t_Co=256
set background=dark
"set guifont"Hack:h11"
set nowrap

set cursorline
set colorcolumn=120

hi Normal ctermbg=black
highlight ColorColumn ctermbg=darkgray

set tags=tags,./tags,./.git/tags;$HOME

""STATUS LINE
set laststatus=2

"" LineNumbering
set number
set ruler

if v:version > 703
	set number relativenumber
endif


"********************
" LET 
"********************

"#Enable Elite mode, No Arrow keys for movement
let g:elite_mode=1

""leader
let mapleader=","

" Vim-Airline Configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1 
let g:airline_theme='luna'
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1

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

""" vim-ros
let g:ycm_semantic_triggers = {
			\   'roslaunch' : ['="', '$(', '/'],
			\   'rosmsg,rossrv,rosaction' : ['re!^', '/'],
			\ }

""Gundo
"let g:gundo_prefer_python3 = 1


"*********************
" MAPPINGS
"*********************

"#Disable arrow movement, resize splits instead.
if get(g:, 'elite_mode')
	nnoremap <Up>    :resize +2<CR>
	nnoremap <Down>  :resize -2<CR>
	nnoremap <Left>  :vertical resize +2<CR>
	nnoremap <Right> :vertical resize -2<CR>
endif

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

"*********************
" AUTOCOMMANDS
"*********************

""NERDTree

autocmd vimenter * NERDTree
autocmd vimenter * wincmd l
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

