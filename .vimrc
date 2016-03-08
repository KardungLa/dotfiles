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
"Airline Plugin
Plugin 'bling/vim-airline'
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
Plugin 'tpope/vim-surround'

Plugin 'gorodinskiy/vim-coloresque'

Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

Plugin 'editorconfig/editorconfig-vim'

Plugin 'lervag/vimtex'
Plugin 'xuhdev/vim-latex-live-preview'

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

"Enable spellcheck
set spell spelllang=en_us

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

"Set JavaScript checkers
let g:syntastic_javascript_checkers = ['eslint']
"lnext and lprev shortcut
noremap <F2> :lnext <CR>
noremap <F3> :lprevious <CR>

"Autoformat mappings
noremap <F6> :Autoformat<CR>
"au BufWrite * :Autoformat

"Autoformat formatters javascript prior
let g:formatters_javascript = ["jscs", "jsbeautify_javascript"]

"vim-latex-live-preview
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'open -a Preview'

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


