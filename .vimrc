set exrc
set secure

set encoding=UTF-8

"*********************************************************************************************************
" --- Vundle ---
"*********************************************************************************************************
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
Plugin 'liuchengxu/vim-which-key'
Plugin 'junegunn/vim-peekaboo'

"" - Utility exploration/search -
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'gilsondev/searchtasks.vim'

"" - Formatting and autofill -
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/tpope-vim-abolish'
Plugin 'tpope/vim-surround'

"" - Git Support -
Plugin 'tpope/vim-fugitive'
Plugin 'rbong/vim-flog'             " vim-fugitive extension

Plugin 'airblade/vim-gitgutter'
Plugin 'Xuyuanp/nerdtree-git-plugin'    " nerdtree extension
Plugin 'apzelos/blamer.nvim'        

"" - Language Support -
Plugin 'neoclide/coc.nvim', {'branch': 'release'}   
    "" CoC Install instructions:
        " * install 
        "        nodejs (https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions), 
        "        ccls (sudo apt install ccls),
        " * Enable yarnpkg:
        "        sudo corepack enable
        " * Install bash-language-server:
        "        npm i -g bash-language-server
        " * From vim: 
        "        Om [coc.nvim] build/index.js not found, please compile the code by esbuild.
        "            :call coc#util#install() 
        "        :CocInstall coc-git coc-python coc-json coc-yaml coc-yank coc-calc coc-cmake coc-sh
        " * note: build projects with: -DCMAKE_EXPORT_COMPILE_COMMANDS=YES 

"" - Visual -
Plugin 'flazz/vim-colorschemes'
Plugin 'yggdroot/indentline'
Plugin 'luochen1990/rainbow'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'     " nerdtree extension
Plugin 'jackguo380/vim-lsp-cxx-highlight'
Plugin 'unblevable/quick-scope'
Plugin 'ojroques/vim-scrollstatus'

"" - Themes -
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'             " https://github.com/ryanoasis/nerd-fonts#font-installation

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"*********************************************************************************************************
" Funcions
"*********************************************************************************************************
function ProfilingStart()
    :profile start profile.log
    :profile func *
    :profile file *
endfunction

function ProfilingStop()
    :profile pause
    :noautocmd qall!
endfunction


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


"*********************************************************************************************************
" EXTERNAL CONFIGS
"*********************************************************************************************************
"source ~/.vim/config/autoclose.vim

"*********************************************************************************************************
" Settings
"*********************************************************************************************************
syntax on

" Let's save undo info!
if !isdirectory($HOME."/.vim/undodir")
    call mkdir($HOME."/.vim/undodir", "p", 0700)
endif

set wildignore+=**/colcon_out/**
set wildignore+=**/build.log
set autoread

set vb t_vb=

set undofile " Maintaing undo history between sessions
set undodir=~/.vim/undodir
set undolevels=100         " How many undos
set undoreload=1000        " number of lines to save for undo

"" Filetype dependent setting in the autocommand section
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

" colorscheme deus
colorscheme gruvbox

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

" TODO comment this
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


"*********************************************************************************************************
" Plugin Settings
"*********************************************************************************************************

"" [ Vim-Airline Configuration ]
"" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'
let g:airline_section_x = '%{ScrollStatus()}'
"let g:hybrid_custom_term_colors = 1
"let g:hybrid_reduced_contrast = 1
"" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

"" [ NERDTree ]
"" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:NERDTreeQuitOnOpen=1
""" ( NERDTree highlight )
let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
"let g:NERDTreeLimitedSyntax = 1

"let g:NERDTreeHighlightCursorline = 0
"set lazyredraw
"" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

"" [ NERDCommenter ]
"" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1
"" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

"" [ GitGutter ]
"" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:gitgutter_sign_added = ''
let g:gitgutter_sign_modified = ''
let g:gitgutter_sign_removed = ''
let g:gitgutter_sign_removed_first_line = ''
let g:gitgutter_sign_modified_removed = ''
"" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

"" [ Blamer ]
"" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:blamer_enabled = 1
let g:blamer_delay = 2000
let g:blamer_show_in_visual_modes = 0
let g:blamer_show_in_insert_modes = 0
let g:blamer_prefix = ' > '
let g:blamer_template = '<committer>, <committer-time> • <summary>'
let g:blamer_date_format = '20%y%m%d %H:%M'
" let g:blamer_relative_time = 0
" highlight Blamer guifg=lightgrey


"" [ Gundo ]
"" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:gundo_prefer_python3 = 1
"" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

"" [ indentline ]
"" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:indentLine_color_term = 236
let g:indentLine_char_list = ['┊','┆','¦','|']
let g:indentLine_bgcolor_term = 235
let g:indentLine_bgcolor_gui = '#FF0000'
"" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

"" [ vim rainbow ]
"" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:rainbow_active = 1
let g:rainbow_conf = {
    \	'separately': {
    \		'nerdtree': 0,
    \	}
    \}
"" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

"" [ vim-lsp-cxx-highlight ]
"" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
"" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

"" [ quick-scope ]
"" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=159 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=193 cterm=underline

nmap <leader>q <plug>(QuickScopeToggle)
xmap <leader>q <plug>(QuickScopeToggle)
"" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

"" [ coc ]
"" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[d` and `]d` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

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

"" [[[ coc-prettier ]]]
"command! -nargs=0 Prettier :CocCommand prettier.formatFile

"let g:coc_force_debug = 1
"" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

"*********************************************************************************************************
" Custom Mappings
"*********************************************************************************************************

"#Disable arrow movement, resize splits instead.
if get(g:, 'elite_mode')
    nnoremap <silent> <Up>    :resize -2<CR>
    nnoremap <silent> <Down>  :resize +2<CR>
    """nnoremap  <expr> <Left> HasWinToRight() == 0 ? ' :vertical resize -2<CR>' : 'vertical resize +2'
    nnoremap <silent> <Left> :vertical resize -2<CR>
    nnoremap <silent> <Right> :vertical resize +2<CR>
endif

" Navigate around splits with a single key combo.
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-j> <C-w><C-j>

" Navigate around files in buffer.
nnoremap <C-L> :bnext<CR>
nnoremap <C-H> :bprevious<CR>

" Quick fix navigating
nnoremap gln :lnext<CR>
nnoremap glp :lprevious<CR>
nnoremap glo :lopen<CR>
nnoremap glc :lclose<CR>

" go to next capital letter or number
noremap <leader>C /[A-Z0-9]<CR>

" Leave insert mode
inoremap ii <Esc>

" Prevent x from overriding what's in the clipboard.
noremap x "_x
noremap X "_X

" Removing trailing WS
nnoremap <leader>rt :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" Indenting
nnoremap <leader>is [{v]}==<C-o><C-o><C-o>

" Add lines
nnoremap <leader>o o<Esc>k
nnoremap <leader>O O<Esc>

" Toggle highlightinh search
nnoremap <leader>h :set hlsearch!<CR>
nnoremap <leader>H :set cursorline! hlsearch!<CR>

" Copy to clipboard (requires sudo apt install xclip)
vnoremap <leader>y :w !xclip -selection clipboard<CR><CR>

" The FX keys
nnoremap <leader><F4> :make<CR>
nnoremap <leader><F5> :GundoToggle<CR>
nnoremap <leader><F7> :call CtagsGitPath()<CR>
nnoremap <leader><F8> :TagbarToggle<CR>

"" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" [ vim-which-key ] 
"" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Make maps visible in [ vim-which-key ]
nnoremap <silent> gg gg
nnoremap <silent> gv gv
nnoremap <silent> [{ [{
nnoremap <silent> ]} ]}
nnoremap <silent> [( [(
nnoremap <silent> ]) ])
nnoremap <silent> [m [m
nnoremap <silent> ]m ]m
nnoremap <silent> [M [M
nnoremap <silent> ]M ]M

"" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" vim abolish crs - snake, crm - mixed, crc - camel, cru - upper,
" cr- - dash, cr. - dot, cr<space> - space, crt - title
"" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" nnoremap <silent> crs crs
" nnoremap <silent> crm crm
" nnoremap <silent> crc crc
" nnoremap <silent> cru cru
" nnoremap <silent> cr- cr-
" nnoremap <silent> cr. cr.
" nnoremap <silent> cr<Space> cr<Space>
" nnoremap <silent> crt crt

nnoremap <silent> <leader> :<c-u>WhichKey ','<CR>
nnoremap <silent> <space> :WhichKey '<Space>'<CR>
nnoremap <silent> g :WhichKey 'g'<CR>
" nnoremap <silent> c :WhichKey 'c'<CR>
nnoremap <silent> ] :WhichKey ']'<CR>
nnoremap <silent> [ :WhichKey '['<CR>
" nnoremap <silent> } :WhichKey '}'<CR>
" nnoremap <silent> { :WhichKey '{'<CR>

let g:which_key_map = {}
"let g:which_key_map.g.g = 'top of file'
"let g:which_key_vertical = 1

set timeoutlen=500

"" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"" [ Ag ] Silver search word under cursor
"" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
nnoremap <leader>ag :Ag <C-R><C-W><CR>

"" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"" [ NERDTree ]
"" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
nnoremap <C-n> :NERDTreeToggle<CR>

"" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"" [ CtrlP ]
"" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
nnoremap <leader>. :CtrlPTag<CR>
nnoremap <leader>b :CtrlPBuffer<CR>

"" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"" [ SearchTasks ]
"" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
nnoremap <leader>st :SearchTasks .<CR>

"" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"" [ Tabularize ]
"" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
noremap <leader>t=  :Tabularize /=<CR>
noremap <leader>t:  :Tabularize /:\zs<CR>
noremap <leader>t,  :Tabularize /,\zs<CR>
noremap <leader>t{  :Tabularize /{<CR>
noremap <leader>t"  :Tabularize /"<CR>
noremap <leader>t'  :Tabularize /'<CR>
noremap <leader>t[  :Tabularize /[<CR>
noremap <leader>t/  :Tabularize ///<CR>
noremap <leader>t\| :Tabularize /\|<CR>
noremap <leader>t/* :Tabularize //\*/l1c0l0<CR>

"" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"" [ vim-surround ]
"" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
nnoremap <leader>sa' :execute "normal \<Plug>Ysurroundiw'"<cr>
nnoremap <leader>sa" :execute "normal \<Plug>Ysurroundiw\""<cr>
nnoremap <leader>sa) :execute "normal \<Plug>Ysurroundiw)"<cr>
nnoremap <leader>sa] :execute "normal \<Plug>Ysurroundiw]"<cr>
nnoremap <leader>sa} :execute "normal \<Plug>Ysurroundiw}"<cr>

"" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"" [ NERDCommenter ]
"" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" nnoremap <silent> <leader>c} V}:call NERDComment('x', 'toggle')<CR>
" nnoremap <silent> <leader>c{ V{:call NERDComment('x', 'toggle')<CR>
" map <leader>cw viw\<Plug>NERDCommenterAltDelims\<Plug>NERDCommenterComment
"<leader>cc <leader>ca

"*********************************************************************************************************
" AUTOCOMMANDS
"*********************************************************************************************************

autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType c,cpp,h,hpp set tabstop=2|set shiftwidth=2|set expandtab
autocmd Filetype c,cpp TagbarOpen
"autocmd FileType c,cpp,objc,objcpp call rainbow#load()

autocmd FocusGained,BufEnter * :checktime
autocmd VimEnter * NERDTree
autocmd VimEnter * if (argc() != 0 && !isdirectory(argv()[0])) && !exists("s:std_in") | wincmd l | endif

autocmd BufEnter *.launch :setlocal filetype=xml
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

autocmd BufWritePre *.c,*.cpp,*.cc,*.h,*.hpp,*.py,*.m,*.mm :%s/\s\+$//e

autocmd StdinReadPre * let s:std_in=1

