set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'ycm-core/YouCompleteMe'
Plugin 'Valloric/YouCompleteMe'"

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

" leader to space
let mapleader = " " " map leader to Space

" backspace works ?
set backspace=indent,eol,start


" line numbers
set nu
highlight LineNr ctermfg=grey

" syntax
syntax on

" indendt
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab

" select last paste in visual mode
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

" remap switching split windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" remove sound
set belloff=all

" new line and normal mode
nnoremap o o<Esc>
nnoremap O O<Esc>

" map nerdtree
map <Leader>k :NERDTreeToggle<CR>

" jump to placeholder
map <SPACE><SPACE> <Esc>/<++><CR><Esc>4s

" compiles .tex files and open in pdf
autocmd Filetype tex map <C-C> :!pdflatex % && open %:r.pdf<CR> 

" rmarkdown compile
autocmd Filetype rmd map <C-c> :!echo<space>"require(rmarkdown);<space>render('<C-r>%')"<space>\|<space>R<space>--vanilla<enter>

" spell suggestions
:nnoremap K a<C-X><C-S>

nnoremap <silent> <Leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>sjd :vsplit \| YcmCompleter GoTo<CR>
nnoremap <leader>ijd :split \| YcmCompleter GoTo<CR>

" autocomplete
" set wildmode=longest,list,full

" change cursor in different modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"


" status bar
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

"filetype plugin indent on " required
"autocmd Filetype * AnyFoldActivate               " activate for all filetypes
"set foldlevel=99 " Open all folds
