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
map <C-n> :NERDTreeToggle<CR>

" jump to placeholder
map <SPACE><SPACE> <Esc>/<++><CR><Esc>4s

" compiles .tex files and open in pdf
map <C-C> :!pdflatex % && open %:r.pdf<CR> 

" autocomplete
set wildmode=longest,list,full

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
