call plug#begin('~/.vim/plugged')

runtime macros/matchit.vim

" Nerdtree
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'taiansu/nerdtree-ag'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Comments
Plug 'scrooloose/nerdcommenter'

" helps to end certain structures automatically. In Ruby, this means adding
" end after if, do, def
Plug 'tpope/vim-endwise'

" Pasting in Vim with indentation adjusted to destination context
Plug 'sickill/vim-pasta'

" RUBY
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'tpope/vim-bundler'

" Moving to the parent node ( :YamlGoToParent ),
" Getting the full path to the current element ( :YamlGetFullPath ),
" Moving to an element, given the path ( :YamlGoToKey )
Plug 'lmeijvogel/vim-yaml-helper'
Plug 'refactor-rails.vim'
" custom text object for selecting ruby blocks.
Plug 'kana/vim-textobj-user' | Plug 'nelstrom/vim-textobj-rubyblock'

" This plug-in provides automatic closing of quotes, parenthesis, brackets, etc.,
Plug 'Raimondi/delimitMate'

" CtrlP extension for fuzzy-search in tag matches.
Plug 'kien/ctrlp.vim'
Plug 'ivalkeen/vim-ctrlp-tjump'

" better-looking, more functional vim statuslines
Plug 'bling/vim-airline'


" sidebar that displays the ctags-generated tags of the current file
Plug 'majutsushi/tagbar'

" A vim plugin that simplifies the transition between multiline and
" single-line code
Plug 'AndrewRadev/splitjoin.vim'


" Vim script for text filtering and alignment
Plug 'godlygeek/tabular'

" repeat.vim: enable repeating supported plugin maps with "."
Plug 'tpope/vim-repeat'

" abolish.vim: easily search for, substitute, and abbreviate multiple variants
" of a word
Plug 'tpope/vim-abolish'

" front for ag, A.K.A. the_silver_searcher.
Plug 'rking/ag.vim'

" Motions
Plug 'camelcasemotion'
Plug 'Lokaltog/vim-easymotion'

" Syntax files
Plug 'aklt/plantuml-syntax'
Plug 'pangloss/vim-javascript'
Plug 'yaymukund/vim-rabl'
Plug 'slim-template/vim-slim'
Plug 'plasticboy/vim-markdown'
Plug 'kchmck/vim-coffee-script'
Plug 'groenewege/vim-less'
Plug 'elixir-lang/vim-elixir'
Plug 'solarnz/thrift.vim'
Plug 'rhysd/vim-crystal'
Plug 'ekalinin/Dockerfile.vim'
" jade
Plug 'digitaltoad/vim-pug'
Plug 'isRuslan/vim-es6'

" NeoVim/Vim plugin performing project-wide async search and replace, similar to SublimeText, Atom et al.
Plug 'eugen0329/vim-esearch'

call plug#end()


filetype plugin indent on     " required!

let mapleader = ","

" Double jj in insert mode exits insert mode
imap jj <Esc>

colorscheme vividchalk

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Display line numbers on the left
set number

" Use <F12> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F12>

set nobackup
set nowritebackup
set history=500		" keep 500 lines of command line history
set incsearch		" do incremental searching


" When files were edited outside vim
set autoread

" folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=10

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Maps autocomplete to Control K(Netbeans style)
imap <C-K> <C-P>

" Tab navigation
nnoremap 1 :tabprevious<CR>
nnoremap 2 :tabnext<CR>

" Automatically removing all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Plugin Customization
map <Leader>n <plug>NERDTreeTabsToggle<CR>
map <Leader>1 :NERDTreeFind<CR>

" scrooloose/nerdtree
" Automatically close NERDTree when opening a file
let NERDTreeQuitOnOpen=1

" airblade/vim-gitgutter
hi GitGutterAdd      ctermfg=0 ctermbg=2 guibg='green'
hi GItGutterDelete   ctermfg=0 ctermbg=1 guibg='red'
hi GitGutterChange   ctermfg=0 ctermbg=4 guibg='blue'

let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '!'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_modified_removed = '<'

" highlight search term
" hi Search cterm=NONE ctermfg=black ctermbg=white

" AndrewRadev/splitjoin.vim
nmap <Leader>s :SplitjoinSplit<CR>
nmap <Leader>j :SplitjoinJoin<CR>

" majutsushi/tagbar
nmap <F8> :TagbarToggle<CR>
nmap <F9> :TagbarOpenAutoClose<CR>

let g:tagbar_type_ruby = {
      \ 'kinds' : [
      \ 'm:modules',
      \ 'c:classes',
      \ 'd:describes',
      \ 'C:contexts',
      \ 'f:methods',
      \ 'F:singleton methods'
      \ ]
      \ }

let g:rails_projections = {
      \ "app/services/drivy/*.rb": {
      \   "command": "service",
      \   "template": "class %S < Drivy::Service\nend",
      \   "test": [
      \     "spec/services/%s_spec.rb"
      \   ]
      \ },
      \ "spec/services/*_spec.rb": {
      \   "alternate": 'app/services/drivy/%s.rb'
      \ },
      \ "app/forms/*.rb": {
      \   "command": "form",
      \   "template": "class %S < Drivy::Form\nend",
      \   "test": [
      \     "spec/forms/%s_spec.rb"
      \   ]
      \ },
      \ "spec/factories/*.rb": {
      \   "command": "factory",
      \   "template": "FactoryGirl.define do\n factory: %S do\n end\n \nend",
      \ },
      \ "app/assets/javascripts/backbone/apps/*_app.js.coffee":  {
      \   "command": "jmodule",
      \ },
      \ "app/assets/javascripts/backbone/entities/*.js.coffee":  {
      \   "command": "jentity",
      \ },
      \ "app/assets/javascripts/backbone/apps/*_controller.js.coffee":  {
      \   "command": "jcontroller",
      \ },
      \ "app/assets/javascripts/backbone/apps/*_view.js.coffee":  {
      \   "command": "jview",
      \ },
      \ }
" camelcasemotion
map w <Plug>CamelCaseMotion_w
map b <Plug>CamelCaseMotion_b
map e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

" ivalkeen/vim-ctrlp-tjump
nnoremap <c-]> :CtrlPtjump<cr>
vnoremap <c-]> :CtrlPtjumpVisual<cr>
let g:ctrlp_tjump_shortener = ['/home/.*/gems/', '.../']

" EXTRA

" Edit routes
command! Rroutes :e config/routes.rb
command! RTroutes :tabe config/routes.rb
command! Ctags :! ctags -R --extra=+f --exclude=.git --exclude=log *

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Maps autocomplete to Control K(Netbeans style)
imap <C-K> <C-P>

" Press ^F from insert mode to insert the current file name
imap <C-F> <C-R>=expand("%")<CR>

" Boxes

vmap <F2> ! boxes -drb -f ~/.boxes-config<CR>
vmap <F3> ! html2haml<CR>

command W w
