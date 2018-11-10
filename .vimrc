set exrc
set secure

set encoding=UTF-8

" --- Vundle ---
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" -- Plugins --

"" - Utilities -
Plugin 'sjl/gundo.vim'

"" - Utility exploration/search -
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'gilsondev/searchtasks.vim'

"" - Formatting and autofill -
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/tpope-vim-abolish'
Plugin 'tpope/vim-surround'

"" - Git Support -
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'
Plugin 'airblade/vim-gitgutter'
Plugin 'kablamo/vim-git-log'

"" - Language Support -
Plugin 'valloric/youcompleteme'
Plugin 'taketwo/vim-ros'                    " sudo apt-get install vim-nox-py2
Plugin 'Conque-GDB'

"" - Themes -
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'             " https://github.com/ryanoasis/nerd-fonts#font-installation

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


"""function! HasWinToRight()
"""    let l:rightedge = win_screenpos(0)[1] + winwidth(0) - 1
"""    for l:win in range(1, winnr('$'))
"""        if l:win != winnr() && win_screenpos(l:win)[1] > l:rightedge
"""            return 1
"""        endif
"""    endfor
"""    return 0
"""endfunction


function! Refactor()
    call inputsave()
    let @z=input("What do you want to rename '" . @z . "' to? ")
    call inputrestore()
endfunction

" Assigning variables

"*********************
" SET
"*********************
syntax on

set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab

"" Theme and Styling
set t_Co=256
set background=dark
"set guifont"Hack:h11"
set nowrap

set cursorline
set colorcolumn=120
set hlsearch

highlight Normal ctermbg=black
highlight ColorColumn ctermbg=darkgray

highlight ColorColumn ctermbg=235
highlight CursorLine cterm=NONE ctermbg=235

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

""" ycm+vim-ros
let g:ycm_semantic_triggers = {
            \   'roslaunch' : ['="', '$(', '/'],
            \   'rosmsg,rossrv,rosaction' : ['re!^', '/'],
            \ }

""Gundo
"let g:gundo_prefer_python3 = 1


"*********************
" MAPPINGS
"*********************

" -- insert mode --
inoremap ii <Esc>

" -- normal mode --

"#Disable arrow movement, resize splits instead.
if get(g:, 'elite_mode')
    nnoremap <silent> <Up>    :resize -2<CR>
    nnoremap <silent> <Down>  :resize +2<CR>
    """nnoremap  <expr> <Left> HasWinToRight() == 0 ? ' :vertical resize -2<CR>' : 'vertical resize +2'
    nnoremap <silent> <Left> :vertical resize -2<CR>
    nnoremap <silent> <Right> :vertical resize +2<CR>
endif

" Silver search word under cursor
nnoremap <leader>ag :Ag <C-R><C-W><CR>

"#For local replace //does not work for function arguments
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>
nnoremap gR gD:%s/<C-R>///gc<left><left><left>
" Locally (local to block) rename a variable
nnoremap <leader>rf "zyiw:call Refactor()<CR>mx:silent! norm gd<CR>[{V%:s/<C-R>//<c-r>z/g<CR>`x}]'")
" Removing trailing WS
nnoremap <leader>rt :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
" Indenting
nnoremap <leader>is [{v]}==<C-o><C-o><C-o>

nnoremap <leader>h :set hlsearch!<CR>
nnoremap <leader>H :set cursorline! hlsearch!<CR>

nnoremap gln :lnext<CR>
nnoremap glp :lprevious<CR>
nnoremap glo :lopen<CR>
nnoremap glc :lclose<CR>
nnoremap <F4> :make<CR>
nnoremap <F5> :GundoToggle<CR>
nnoremap <F7> :call CtagsGitPath()<CR>
"# nnoremap <F8> :TagbarToggle<CR>
"# nnoremap <F9> :YcmCompleter FixIt<CR>
"# nnoremap <F12> :YcmCompleter GoToDefinition<CR>

"" - NERDTree -
nnoremap <C-n> :NERDTreeToggle<CR>

"" - CtrlP -
nnoremap <leader>. :CtrlPTag<CR>
nnoremap <C-b> :CtrlPBuffer<CR>

"" - TagBar -
nnoremap <F8> :TagbarToggle<CR>

"" - YCM -
nnoremap <F9> :YcmCompleter FixIt<CR>
nnoremap <F12> :YcmCompleter GoToDefinition<CR>

"" - fugitive - (@:Gdiff)
"""" nnoremap d2 :diffget //2<Bar>diffupdate<Bar>]c<CR>
"""" nnoremap d3 :diffget //3<Bar>diffupdate<Bar>]c<CR>

"" - SearchTasks -
nnoremap <leader>st :SearchTasks .<CR>

" -- visual mode --

"" - cu -

noremap <Leader>t=  :Tabularize /=<CR>
noremap <Leader>t:  :Tabularize /:\zs<CR>
noremap <Leader>t,  :Tabularize /,\zs<CR>
noremap <leader>t{  :Tabularize /{<CR>
noremap <leader>t"  :Tabularize /"<CR>
noremap <leader>t'  :Tabularize /'<CR>
noremap <leader>t[  :Tabularize /[<CR>
noremap <leader>t/  :Tabularize ///<CR>
noremap <leader>t\| :Tabularize /\|<CR>
noremap <leader>t/* :Tabularize //\*/l1c0l0<CR>


"*********************
" AUTOCOMMANDS
"*********************

""NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree
autocmd VimEnter * if (argc() != 0 && !isdirectory(argv()[0])) && !exists("s:std_in") | wincmd l | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

