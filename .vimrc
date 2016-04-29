"Daniel's .vimrc 

"""""""""""""""""""""""""
" VUNDLE PACKAGES       "
"""""""""""""""""""""""""

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"Tmux seamless navigation
Plugin 'christoomey/vim-tmux-navigator'
"Ctag Tagbar plugin
Plugin 'majutsushi/tagbar'

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
Plugin 'Valloric/YouCompleteMe'
"Syntax checking (needs external syntax checker e.g. node jshint for js)
Plugin 'scrooloose/syntastic'

Plugin 'marijnh/tern_for_vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'nathanaelkane/vim-indent-guides'

"browserlink (https://github.com/jaxbot/browserlink.vim)
Plugin 'jaxbot/browserlink.vim'

"surround
"https://github.com/tpope/vim-surround
Plugin 'tpope/vim-surround'

Plugin 'gorodinskiy/vim-coloresque'

Plugin 'SirVer/ultisnips'
"Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

Plugin 'editorconfig/editorconfig-vim'

Plugin 'lervag/vimtex'
Plugin 'xuhdev/vim-latex-live-preview'

"Python
Plugin 'klen/python-mode' 
"Jedi-vim autocomplete plugin
Plugin 'davidhalter/jedi-vim'               
"Jinja support for vim
Plugin 'mitsuhiko/vim-jinja'                
Plugin 'hynek/vim-python-pep8-indent' 
"Combined Python 2/3 for Vim
Plugin 'mitsuhiko/vim-python-combined'      
Plugin 'jmcantrell/vim-virtualenv' 

"https://github.com/jeffkreeftmeijer/vim-numbertoggle
Plugin 'jeffkreeftmeijer/vim-numbertoggle'

"https://github.com/junegunn/goyo.vim
Plugin 'junegunn/goyo.vim'

"https://github.com/plasticboy/vim-markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

"https://github.com/mattn/emmet-vim
Plugin 'mattn/emmet-vim'

"smooth scroll
Plugin 'terryma/vim-smooth-scroll'

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

"""""""""""""""""""""""""
" PLUGIN CONFIGURATIONS "
"""""""""""""""""""""""""
"
"Trigger configuration. Do not use <tab> if you use
"#https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<F10>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"
"If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let delimitMate_expand_cr = 1

"Remap navigation keys (tmux)
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

"Toggle Tagbar Plugin
nmap <F8> :TagbarToggle<CR>

"Toggle NERDTree
nmap <F9> :NERDTreeToggle<CR>

"NERDTREE AutoStart
"autocmd vimenter * NERDTree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"Airline Config
set laststatus=2
set ttimeoutlen=50
let g:airline_powerline_fonts = 1


if !exists("g:ycm_semantic_triggers")
	let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']
set completeopt-=preview

" These are the tweaks I apply to YCM's config, you don't need them but they
" might help.
" YCM gives you popups and splits by default that some people might not
" like, so these should tidy it up a bit for you.
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0

"Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8', 'pydocstyle', 'python']

"Set JavaScript checkers
let g:syntastic_javascript_checkers = ['eslint']

" Set up the arrays to ignore for later
if !exists('g:syntastic_html_tidy_ignore_errors')
    let g:syntastic_html_tidy_ignore_errors = []
endif

if !exists('g:syntastic_html_tidy_blocklevel_tags')
    let g:syntastic_html_tidy_blocklevel_tags = []
endif

" Ignore ionic tags in HTML syntax checking
" See http://stackoverflow.com/questions/30366621
" ignore errors about Ionic tags
let g:syntastic_html_tidy_ignore_errors += [
      \ "<ion-",
      \ "discarding unexpected </ion-"]

" Angular's attributes confuse HTML Tidy
let g:syntastic_html_tidy_ignore_errors += [
      \ " proprietary attribute \"ng-"]

" Angular UI-Router attributes confuse HTML Tidy
let g:syntastic_html_tidy_ignore_errors += [
      \ " proprietary attribute \"ui-sref"]

" Angular in particular often makes 'empty' blocks, so ignore
" this error. We might improve how we do this though.
" See also https://github.com/scrooloose/syntastic/wiki/HTML:---tidy
" specifically g:syntastic_html_tidy_empty_tags
let g:syntastic_html_tidy_ignore_errors += ["trimming empty "]

" Angular ignores
let g:syntastic_html_tidy_blocklevel_tags += [
      \ 'ng-include',
      \ 'ng-form',
      \ 'ng-hide',
      \ 'ng-show'
      \ ]

" Angular UI-router ignores
let g:syntastic_html_tidy_ignore_errors += [
      \ " proprietary attribute \"ui-sref"]

"lnext and lprev shortcut
noremap <F2> :lnext <CR>
noremap <F3> :lprevious <CR>

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

"" Python settings

" omnicomplete
set completeopt-=preview                    " remove omnicompletion dropdown

" rope
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
let g:pymode_breakpoint_key='<leader>b'

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

" arguments: distance, duration, speed
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 2, 1)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 2, 1)<CR>

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


