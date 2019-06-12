" ------------ USABILITY CONFIGURATION --------- "
"  Basic and needed settings for source code editing

" Set terminal color to 256
set t_Co=256
" Do not make VIM compatible with Vi
set nocompatible

" filetype off

" Encoding is UTF-8
set encoding=utf-8
set fileencoding=utf-8

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin('~/.vim/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" -- Safe Essentials --
Plugin 'kien/ctrlp.vim' " - CTRLP - required file opener
Plugin 'mattn/emmet-vim' " - HTML, CSS Expander
Plugin 'othree/html5.vim' " - HTML5 Support
Plugin 'flazz/vim-colorschemes'

Plugin 'jistr/vim-nerdtree-tabs' " - Tab view for Nerdtree
Plugin 'scrooloose/nerdtree.git' " - Nerdtree folder viewer

"Plugin 'nathanaelkane/vim-indent-guides' " - Indent Guides
Plugin 'Yggdroot/indentLine'

Plugin 'vim-airline/vim-airline-themes' " - Themes for airlines
Plugin 'vim-airline/vim-airline' " - Airlines is the top/bottom navbar

" --- Logistics --- "
Plugin 'tpope/vim-fugitive' " -- Git wrapper
Plugin 'airblade/vim-gitgutter' " -- Git Gutter
"Plugin 'thaerkh/vim-workspace' " -- Vim workspace
"Plugin 'sjl/gundo.vim' " -- Undo Tree Visualizer
Plugin 'tpope/vim-sensible' " -- Sensible Vim, for setting some default editor stuff
Plugin 'tpope/vim-surround'

" -- CSS --
"Plugin 'scrooloose/syntastic' " - Syntax Checker
"Plugin 'cakebaker/scss-syntax.vim' " - Syntax Checking for SCSS
Plugin 'ap/vim-css-color'

" --- Syntax Highlighing ----
Plugin 'leafgarland/typescript-vim'
Plugin 'gregsexton/matchtag'
"Plugin 'burnettk/vim-angular' " - Angular Syntax fixes
Plugin 'pangloss/vim-javascript'
"Plugin 'othree/yajs.vim'
Plugin 'mxw/vim-jsx' " - JSX Syntax Highlighting
"Plugin 'ntpeters/vim-better-whitespace'
Plugin 'styled-components/vim-styled-components'

"Plugin 'easymotion/vim-easymotion' " -- Easy motion, jump to and from etc
Plugin 'Raimondi/delimitMate' " -- Auto closing of stuff

Plugin 'godlygeek/tabular' " -- for Markdown
Plugin 'plasticboy/vim-markdown' " -- for Markdown

Plugin 'scrooloose/nerdcommenter' " -- commenting

Plugin 'dyng/ctrlsf.vim' " - Requires AG : apt-get install silversearcher-ag
Plugin 'vim-scripts/JavaScript-Indent'

" --- Quality of Life ---- "
Plugin 'editorconfig/editorconfig-vim'
Plugin 'universal-ctags/ctags'
Plugin 'ludovicchabant/vim-gutentags'

" -- Prettier -- "
Plugin 'prettier/vim-prettier'
Plugin 'heavenshell/vim-jsdoc'


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

colorscheme vibrantink


autocmd FileType css,scss set omnifunc=csscomplete#CompleteCSS
" autocmd BufWritePre * set ff=unix

" ----- Prettier ----- "
" max line length that prettier will wrap on
" Prettier default: 80
let g:prettier#config#print_width = 120

" number of spaces per indentation level
" Prettier default: 2
let g:prettier#config#tab_width = 2

" use tabs over spaces
" Prettier default: false
let g:prettier#config#use_tabs = 'false'

" print semicolons
" Prettier default: true
let g:prettier#config#semi = 'true'

" single quotes over double quotes
" Prettier default: false
let g:prettier#config#single_quote = 'true'

" print spaces between brackets
" Prettier default: true
let g:prettier#config#bracket_spacing = 'true'

" put > on the last line instead of new line
" Prettier default: false
let g:prettier#config#jsx_bracket_same_line = 'true'

" avoid|always
" Prettier default: avoid
let g:prettier#config#arrow_parens = 'always'

" none|es5|all
" Prettier default: none
let g:prettier#config#trailing_comma = 'none'

" flow|babylon|typescript|css|less|scss|json|graphql|markdown
" Prettier default: babylon
let g:prettier#config#parser = 'flow'

" cli-override|file-override|prefer-file
let g:prettier#config#config_precedence = 'prefer-file'

" always|never|preserve
let g:prettier#config#prose_wrap = 'preserve'

" run async on prettier cmd
let g:prettier#exec_cmd_async = 1

" ----- JsDoc -------"
let g:jsdoc_allow_input_prompt  = 1
let g:jsdoc_input_description = 1
let g:jsdoc_enable_es6 = 1

" ---- Velocity ---- "
au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=html
au BufNewFile,BufRead *.tsx,*.js,*.jsx set ft=javascript.jsx
au BufNewFile,BufRead *.ts set ft=typescript

" ---- Emmet ----- "
" let g:user_emmet_expandabbr_key = '<Tab>'
let g:user_emmet_install_global = 0
let g:emmet_html5 = 0
let g:user_emmet_settings = {
      \  'javascript.jsx' : {
      \      'extends' : 'jsx',
      \  },
      \}
autocmd FileType javascript.jsx,velocity,html,scss,css EmmetInstall | imap <buffer> <expr> <tab> emmet#expandAbbrIntelligent("\<tab>") | let b:ycm_key_list_select_completion = ['<Enter>', '<Down>']

:imap <C-BS> <C-w>
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

" ---- Syntax, Javascript -----
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_javascript_checkers = ["eslint"]
let g:used_javascript_libs = 'angularjs,angularuirouter,jquery,handlebars'
let delimitMate_expand_cr = 1
let g:javascript_plugin_flow = 1

augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:', {{:}}"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

let g:indent_guides_enable_on_vim_startup = 1
let g:rainbow_active = 0 " - 0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
      \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
      \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
      \   'operators': '_,_',
      \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
      \   'separately': {
      \       '*': {},
      \       'tex': {
      \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
      \       },
      \       'lisp': {
      \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
      \       },
      \       'vim': {
      \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
      \       },
      \       'html': {
      \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
      \       },
      \       'css': 0,
      \   }
      \}

" --- Angular Vim ---
let g:angular_filename_convention = 'titlecased'

" --- React Vim ---
let g:jsx_ext_required = 0

" -- Scrooloose Syntastic -- "
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0


syntax on

" ---- UltiSnips ----

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" ---- You Complete Me Settings ----- "
let g:ycm_filetype_blacklist = {
      \ 'notes' : 1,
      \ 'html' : 1,
      \ 'css' : 1,
      \ 'scss' : 1,
      \ 'text' : 1,
      \}

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" ---- Airline, Tagbar ----- "
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set laststatus=2

" -- Nerd Tree --
"autocmd vimenter * NERDTree
" Go to previous (last accessed) window.
"autocmd VimEnter * wincmd p

let NERDTreeWinSize = 40
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :NERDTreeToggle<CR>
map  <C-x> :tabc<CR>
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

" --- Gundo ---- "
nnoremap <F5> :GundoToggle<CR>
" --- ctrlp -----
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/](\.git|\.hg|\.svn|_site|node_modules|bower_components|coverage|dist-*)$',
      \ }

let g:ctrlp_clear_cache_on_exit = 0

" ---------- Swap Up and Down ---------- "
function! s:swap_lines(n1, n2)
  let line1 = getline(a:n1)
  let line2 = getline(a:n2)
  call setline(a:n1, line2)
  call setline(a:n2, line1)
endfunction

function! s:swap_up()
  let n = line('.')
  if n == 1
    return
  endif

  call s:swap_lines(n, n - 1)
  exec n - 1
endfunction

function! s:swap_down()
  let n = line('.')
  if n == line('$')
    return
  endif

  call s:swap_lines(n, n + 1)
  exec n + 1
endfunction

" --- Custom Bindings ---

map <c-c> <Esc>\ci
imap kj <Esc> " -- quickly jump out of insert mode
imap jk <Esc> " -- quickly jump out of insert mode

noremap <S-j> 5j
noremap <S-k> 5k
noremap <S-l> 5l
noremap <S-h> 5h

nnoremap <Bs> i<Bs>

noremap <silent> <c-s-k> :call <SID>swap_up()<CR>
noremap <silent> <c-s-j> :call <SID>swap_down()<CR>

nmap     <C-F> <Plug>CtrlSFPrompt
vmap     <C-F> <Plug>CtrlSFVwordExec

nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

nnoremap <c-i> gg=G''

" --- Windows Shit
inoremap <M-u> <Esc>u
inoremap <M-r> <Esc>r
inoremap <M-j> <Esc>j
inoremap <M-k> <Esc>k
inoremap <M-h> <Esc>h
inoremap <M-l> <Esc>l
inoremap <M-p> <Esc>p
inoremap <M-o> <Esc>o

nnoremap <M-u> <Esc>u
nnoremap <M-r> <Esc>r
nnoremap <M-j> <Esc>j
nnoremap <M-k> <Esc>k
nnoremap <M-h> <Esc>h
nnoremap <M-l> <Esc>l
nnoremap <M-o> <Esc>o

" ----- Nerd Commenter ------ "
let g:NERDSpaceDelims = 1

" ----- Change Vim Display ------ "
hi Normal ctermbg=none

" ------ Auto Indent ---------- "
let g:html_indent_inctags = "section"
let g:html_indent_inctags = "p"

" --- Smooth Scroll --- "

noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 10, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 10, 2)<CR>
"noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 4)<CR>
"noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 4)<CR>

" --- GENERAL SETTINGS ---

set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch
set clipboard=unnamed
set mouse=a
set foldmethod=indent
set ts=2 sw=2 expandtab

" NOTES
" powerline: install powerline font patches for airline use.
" best: light version of source code pro
"
" javascript syntax checker
" npm install -g eslint
" or
" npm install -g jslint

set tags=./tags;/
