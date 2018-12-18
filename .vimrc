"Daniel's .vimrc 
"for Vim 8
"""""""""""""""""""""""""
" VUNDLE PACKAGES       "
"""""""""""""""""""""""""

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"https://github.com/skywind3000/asyncrun.vim
Plugin 'skywind3000/asyncrun.vim'

"Tmux seamless navigation
Plugin 'christoomey/vim-tmux-navigator'
"Ctag Tagbar plugin
Plugin 'majutsushi/tagbar'

Plugin 'kien/ctrlp.vim'

"Nerd Tree
Plugin 'scrooloose/nerdtree'
"Nerd Tree Git Plugin
Plugin 'Xuyuanp/nerdtree-git-plugin'
"NerdCommenter
"https://github.com/scrooloose/nerdcommenter
Plugin 'scrooloose/nerdcommenter'

"Airline Plugin
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"Code Beautifyer
Plugin 'Chiel92/vim-autoformat'

"Code Completion
"Plugin 'Valloric/YouCompleteMe'

" Vim 8 Syntax Validation (similar to Syntastic)
Plugin 'maralla/validator.vim'

Plugin 'jiangmiao/auto-pairs'

Plugin 'marijnh/tern_for_vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'jaxbot/browserlink.vim'

Plugin 'gorodinskiy/vim-coloresque'

Plugin 'editorconfig/editorconfig-vim'

Plugin 'lervag/vimtex'
Plugin 'xuhdev/vim-latex-live-preview'

"Python
Plugin 'klen/python-mode' 
Plugin 'jmcomets/vim-pony'
"Jedi-vim autocomplete plugin
Plugin 'davidhalter/jedi-vim'               

Plugin 'hynek/vim-python-pep8-indent' 
"Combined Python 2/3 for Vim
Plugin 'mitsuhiko/vim-python-combined'      
Plugin 'jmcantrell/vim-virtualenv' 

"http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
Plugin 'godlygeek/tabular'

"Emmet
Plugin 'mattn/emmet-vim'

"smooth scroll
Plugin 'terryma/vim-smooth-scroll'

"https://github.com/beloglazov/vim-online-thesaurus
Plugin 'beloglazov/vim-online-thesaurus'

"https://github.com/christoomey/vim-quicklink
" gx - Open link under cursor;
" gl - Go to link defintion under cursor.
Plugin 'mattn/webapi-vim'
Plugin 'christoomey/vim-quicklink'

"vim vertical move
Plugin 'bruno-/vim-vertical-move'

Plugin 'tmhedberg/SimpylFold'

"Typescript and Angular 2
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/vim-js-pretty-template'
Plugin 'Shougo/vimproc.vim'
Plugin 'Quramy/tsuquyomi'

"All of your Plugins must be added before the following line
call vundle#end()

"""""""""""""""""""""""""
" GENERAL CONFIGURATION "
"""""""""""""""""""""""""

"Make Vim more useful
set nocompatible    
filetype off 

set encoding=UTF8
set autoread

set clipboard=unnamed

set hidden
set history=100

syntax on

" Search down into subfolders
set path+=**

" Display all matching files when we tab complete
set wildmenu

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

"Set Zenburn color scheme
color zenburn

"Don't redraw while exec macros
set lazyredraw

"regex magic
set magic

filetype plugin indent on 

"Show matching brackets
set showmatch
set mat=2

"Show line numbers
set number
"Find as you type search"
set incsearch                   
"Show matching brackets/parenthesis"
set showmatch                   
"Case insensitive search"
set ignorecase                  
" show a visual line under the cursor's current line
set cursorline

"Enable spellcheck
set spell spelllang=en_us

"Disable arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

"Disable arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

"Map Leader key to comma
let mapleader=","

set nofoldenable

" Create the tags files
command! MakeTags !ctags -R .

"""""""""""""""""""""""""
" PLUGIN CONFIGURATIONS "
"""""""""""""""""""""""""

"Remap navigation keys (tmux)
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

"Tagbar Plugin
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus=0
let g:tagbar_width=42
autocmd BufEnter *.py :call tagbar#autoopen(0)
autocmd BufWinLeave *.py :TagbarClose

"NerdTree
nmap <leader>t :NERDTreeToggle<CR>
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"Autopairs
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutJump = '<c-n>'

"Airline Config
set laststatus=2
set ttimeoutlen=50
let g:airline_powerline_fonts = 1

"Typescript and Angular 2 Config
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
autocmd FileType typescript JsPreTmpl html
autocmd FileType typescript syn clear foldBraces

let g:tsuquyomi_disable_quickfix = 1

"YouCompleteMe
"if !exists("g:ycm_semantic_triggers")
"	let g:ycm_semantic_triggers = {}
"endif
"let g:ycm_semantic_triggers['typescript'] = ['.']
"set completeopt-=preview

" These are the tweaks I apply to YCM's config, you don't need them but they
" might help.
" YCM gives you popups and splits by default that some people might not
" like, so these should tidy it up a bit for you.
"let g:ycm_add_preview_to_completeopt=0
"let g:ycm_confirm_extra_conf=0
"let g:ycm_autoclose_preview_window_after_completion=1
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"Validator settings
let g:validator_javascript_checkers = ['eslint']
let g:validator_python_checkers = ['flake8']
let g:validator_auto_open_quickfix = 0
noremap <leader>v :ValidatorCheck<CR>

"lnext and lprev shortcut
noremap <F2> :lnext<CR>
noremap <F3> :lprevious<CR>

"Autoformat mappings
noremap <F6> :Autoformat<CR>
"au BufWrite * :Autoformat

"Autoformat formatters javascript prior
let g:formatters_javascript = ["jscs", "jsbeautify_javascript"]

let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

let g:formatdef_my_custom_c = '"astyle --mode=c --style=gnu --align-pointer=type --align-reference=type -pcHs2U -A2 -W1"'
let g:formatters_c = ['my_custom_c']

"vim-latex-live-preview
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'open -a Preview'

let g:SimpylFold_docstring_preview=1

"Python settings

" omnicomplete
set completeopt-=preview                    " remove omnicompletion dropdown

" rope
let g:pymode_python = 'python3'
let g:pymode_rope=0
let g:pymode_rope_completion=0
let g:pymode_rope_complete_on_dot=0
let g:pymode_rope_auto_project=0
let g:pymode_rope_enable_autoimport=0
let g:pymode_rope_autoimport_generate=0
let g:pymode_rope_guess_project=0

" documentation
let g:pymode_doc=1
let g:pymode_doc_key='K'

let g:pymode_folding = 1
let g:pymode_indent = 1

" lints
let g:pymode_lint=1
let pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
let pymode_lint_cwindow = 1
let pymode_lint_ignore = ''
let pymode_lint_message = 1
let pymode_lint_on_fly = 0
let pymode_lint_on_write = 1
let pymode_lint_select = ''
let pymode_lint_signs = 1

" virtualenv
let g:pymode_virtualenv=1

" breakpoints
let g:pymode_breakpoint=1
let g:pymode_breakpoint_key='<leader>p'

" syntax highlight
let python_highlight_all=1
let python_highlight_exceptions=1
let python_highlight_builtins=1
let python_slow_sync=1
let g:pymode_syntax=1
let g:pymode_syntax_all=1
let g:pymode_syntax_indent_errors=g:pymode_syntax_all
let g:pymode_syntax_space_errors=g:pymode_syntax_all

" highlight 'long' lines (>= 80 symbols) in python files
augroup vimrc_autocmds
    autocmd!
    autocmd FileType python,rst highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python,rst match Excess /\%81v.*/
    autocmd FileType python,rst set nowrap
augroup END

" code running
let g:pymode_run=1
let g:pymode_run_bind = 'r'

" jedi-vim
let g:jedi#popup_select_first=0             " Disable choose first option on autocomplete
let g:jedi#show_call_signatures=0           " Show call signatures
let g:jedi#popup_on_dot=1                   " Enable autocomplete on dot

"SmoothScroll
"arguments: distance, duration, speed
noremap <silent> <c-b> :call smooth_scroll#up(&scroll, 50, 1)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll, 50, 1)<CR>

"Online Thesaurus
let g:online_thesaurus_map_keys = 0
nnoremap <c-t> :OnlineThesaurusCurrentWord<CR>

"------------------------------------
" Nvim-R
"------------------------------------
if has("gui_running")
    inoremap <C-Space> <C-x><C-o>
else
    inoremap <Nul> <C-x><C-o>
endif
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine

"CtrlP and Tagbar
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <silent> <Leader>b :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""
" FUNCTIONS                       "
"""""""""""""""""""""""""""""""""""

"http://dalibornasevic.com/posts/43-12-vim-tips
"usage:
":vimgrep /CurrencyNumberHelper/ app/models/*.rb
":Qargs
":argdo %s/CurrencyNumberHelper/CurrencyHelper/g
":argdo update
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()

" populate the argument list with each of the files named in the quickfix list
function! QuickfixFilenames()
	let buffer_numbers = {}
	for quickfix_item in getqflist()
		let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
	endfor
	return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

" Commenting blocks of code.
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

