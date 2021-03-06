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
Plugin 'rbong/vim-flog'
Plugin 'Xuyuanp/nerdtree-git-plugin'

"" - Language Support -
Plugin 'neoclide/coc.nvim', {'branch': 'release'}   
    "" CoC Install instructions:
        " install nodejs, ccls, build projects with: -DCMAKE_EXPORT_COMPILE_COMMANDS=YES 
        " CocInstall coc-git coc-python coc-json coc-yank coc-calc coc-cmake coc-sh
        " curl --compressed -o- -L https://yarnpkg.com/install.sh | bash ??
        " :call coc#util#install() (om [coc.nvim] build/index.js not found, please compile the code by esbuild.)
Plugin 'bash-support.vim'
""Plugin 'Conque-GDB' "Obsolete with packadd Termdebug :Termdebug
Plugin 'cpiger/neodebug'
Plugin 'suan/vim-instant-markdown', {'rtp': 'after'}   " [sudo] npm -g install instant-markdown-d
Plugin 'xuqix/h2cppx'

"" - Visual -
Plugin 'flazz/vim-colorschemes'
Plugin 'yggdroot/indentline'
Plugin 'luochen1990/rainbow'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plugin 'sheerun/vim-polyglot'
Plugin 'jackguo380/vim-lsp-cxx-highlight'

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
function TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction

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


"*********************
" EXTERNAL CONFIGS
"*********************
"source ~/.vim/config/autoclose.vim

"*********************
" Settings
"*********************
syntax on

" Let's save undo info!
if !isdirectory($HOME."/.vim/undodir")
    call mkdir($HOME."/.vim/undodir", "p", 0700)
endif
set undofile " Maintaing undo history between sessions
set undodir=~/.vim/undodir
set undolevels=100         " How many undos
set undoreload=1000        " number of lines to save for undo

set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab

set backspace=indent,eol,start " backspace over everything in insert mode

set diffopt+=iwhite

"" Theme and Styling
set t_Co=256
set background=dark
""set guifont"Hack:h11"
set nowrap

set cursorline
set colorcolumn=120
set hlsearch

colorscheme deus

""""highlight Normal ctermbg=black
"highlight Normal ctermbg=235
""""highlight ColorColumn ctermbg=darkgray

"highlight ColorColumn ctermbg=234
"highlight CursorLine cterm=NONE ctermbg=234

"highlight Search term=reverse ctermfg=0 ctermbg=12 guifg=Black guibg=lightgray

highlight SignColumn guibg=bg ctermbg=235
highlight GitGutterAdd    guibg=bg ctermbg=235
highlight GitGutterChange guibg=bg ctermbg=235
highlight GitGutterDelete guibg=bg ctermbg=235
highlight GitGutterChangeDelete guibg=bg ctermbg=235

"highlight GitGutterAdd    guifg=#009900 guibg=bg ctermfg=2 ctermbg=235
"highlight GitGutterChange guifg=#bbbb00 guibg=bg ctermfg=3 ctermbg=235
"highlight GitGutterDelete guifg=#ff2222 guibg=bg ctermfg=1 ctermbg=235
"""highlight SignColumn guibg=bg ctermbg=black
"""highlight GitGutterAdd    guifg=#009900 guibg=bg ctermfg=2 ctermbg=black
"""highlight GitGutterChange guifg=#bbbb00 guibg=bg ctermfg=3 ctermbg=black
"""highlight GitGutterDelete guifg=#ff2222 guibg=bg ctermfg=1 ctermbg=black

set tags=tags,./tags,./.git/tags;$HOME

""STATUS LINE
set laststatus=2

"" LineNumbering
set number
set ruler


let &t_TI = ""
let &t_TE = ""

"#Enable Elite mode, No Arrow keys for movement
let g:elite_mode=1

""leader
let mapleader=","
if v:version > 703
    set number relativenumber
    highlight CursorLineNr    term=bold cterm=bold gui=bold
endif


"********************
" Plugin Settings
"********************

"" [ Vim-Airline Configuration ]
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'
"let g:hybrid_custom_term_colors = 1
"let g:hybrid_reduced_contrast = 1

"" [ NERDTree ]
let g:NERDTreeQuitOnOpen=1
""" ( NERDTree highlight )
let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
"let g:NERDTreeLimitedSyntax = 1
"let g:NERDTreeHighlightCursorline = 0

"" [ CtrlP ]
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

"" [ GitGutter ]
let g:gitgutter_sign_added = ''
let g:gitgutter_sign_modified = ''
let g:gitgutter_sign_removed = ''
let g:gitgutter_sign_removed_first_line = ''
let g:gitgutter_sign_modified_removed = ''

"" [ Gundo ]
let g:gundo_prefer_python3 = 1

"" [ indentline ]
let g:indentLine_color_term = 236
let g:indentLine_char_list = ['┊','┆','¦','|']
let g:indentLine_bgcolor_term = 235
let g:indentLine_bgcolor_gui = '#FF0000'

"" [ vim rainbow ]
let g:rainbow_active = 1
let g:rainbow_conf = {
    \	'separately': {
    \		'nerdtree': 0,
    \	}
    \}

"" [ cpp-enhanced-modern ]
"let g:cpp_no_function_highlight = 1
"let g:cpp_attributes_highlight = 1
"let g:cpp_member_highlight = 1
"let g:cpp_simple_highlight = 1

"  vim-lsp-cxx-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

"" [ coc ]
"" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" if hidden is not set, TextEdit might fail.
set hidden
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use `[d` and `]d` to navigate diagnostics
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
"
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Remap for refactor current symbol
nmap <leader>rf <Plug>(coc-refactor)
" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)
" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"" [[ coc-extensions ]]
"" [[[ coc-git ]]]
" navigate chunks of current buffer
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
" show commit contains current position
nmap gc <Plug>(coc-git-commit)
" create text object for git chunks
omap ic <Plug>(coc-text-object-inner)
xmap ic <Plug>(coc-text-object-inner)
omap ic <Plug>(coc-text-object-outer)
xmap ic <Plug>(coc-text-object-outer)

nnoremap <silent> <space>g  :<C-u>CocList --normal gstatus<CR>

"" [[[ coc-yank ]]]
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

"" [[[ coc-calc ]]]
" append result on current expression
nmap <Leader>ma <Plug>(coc-calc-result-append)
" replace result on current expression
nmap <Leader>mr <Plug>(coc-calc-result-replace)

"let g:coc_force_debug = 1
"" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

"*********************
" Custom Mappings
"*********************

" -- insert mode --
inoremap ii <Esc>

" -- normal mode --

" Navigate around splits with a single key combo.
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-j> <C-w><C-j>

" Prevent x from overriding what's in the clipboard.
noremap x "_x
noremap X "_X

"#Disable arrow movement, resize splits instead.
if get(g:, 'elite_mode')
    nnoremap <silent> <Up>    :resize -2<CR>
    nnoremap <silent> <Down>  :resize +2<CR>
    """nnoremap  <expr> <Left> HasWinToRight() == 0 ? ' :vertical resize -2<CR>' : 'vertical resize +2'
    nnoremap <silent> <Left> :vertical resize -2<CR>
    nnoremap <silent> <Right> :vertical resize +2<CR>
endif

" [ Ag ] Silver search word under cursor
nnoremap <leader>ag :Ag <C-R><C-W><CR>

" Removing trailing WS
nnoremap <leader>rt :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
" Indenting
nnoremap <leader>is [{v]}==<C-o><C-o><C-o>

nnoremap <leader>o o<Esc>k
nnoremap <leader>O O<Esc>

nnoremap <leader>h :set hlsearch!<CR>
nnoremap <leader>H :set cursorline! hlsearch!<CR>

nnoremap gln :lnext<CR>
nnoremap glp :lprevious<CR>
nnoremap glo :lopen<CR>
nnoremap glc :lclose<CR>
nnoremap <F4> :make<CR>
nnoremap <F5> :GundoToggle<CR>
nnoremap <F7> :call CtagsGitPath()<CR>
nnoremap <F8> :TagbarToggle<CR>

"" [ NERDTree ]
nnoremap <C-n> :NERDTreeToggle<CR>

"" [ CtrlP ]
nnoremap <leader>. :CtrlPTag<CR>
nnoremap <leader>b :CtrlPBuffer<CR>

"" [ SearchTasks ]
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

autocmd VimEnter * NERDTree
autocmd VimEnter * if (argc() != 0 && !isdirectory(argv()[0])) && !exists("s:std_in") | wincmd l | endif

autocmd Filetype cpp TagbarOpen
"autocmd FileType c,cpp,objc,objcpp call rainbow#load()

autocmd BufEnter *.launch :setlocal filetype=xml
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

autocmd BufWritePre *.c,*.cpp,*.cc,*.h,*.hpp,*.py,*.m,*.mm :%s/\s\+$//e

autocmd StdinReadPre * let s:std_in=1

