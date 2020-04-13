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

" move line and blocks
nnoremap √ :m .+1<CR>==
nnoremap ª :m .-2<CR>==
inoremap √ <Esc>:m .+1<CR>==gi
inoremap ª <Esc>:m .-2<CR>==gi
vnoremap √ :m '>+1<CR>gv=gv
vnoremap ª :m '<-2<CR>gv=gv

" map nerdtree
map <C-n> :NERDTreeToggle<CR>

" jump to placeholder
map <SPACE> <Esc>/<++><CR><Esc>ciB

" compiles .tex files and open in pdf
map <C-C> :!pdflatex % && open %:r.pdf<CR> 


" status bar
"-----------------------------------------------------------------------------------------"
au InsertEnter * hi statusline guifg=black guibg=#d7afff ctermfg=darkmagenta ctermbg=white
au InsertLeave * hi statusline guifg=black guibg=#8fbfdc ctermfg=cyan ctermbg=black
hi statusline guifg=black guibg=#8fbfdc ctermfg=cyan ctermbg=black

function! ModeCurrent() abort
   let l:modecurrent = mode()
   " use get() -> fails safely, since ^V doesn't seem to register
   " 3rd arg is used when return of mode() == 0, which is case with ^V
   " thus, ^V fails -> returns 0 -> replaced with 'V Block'
   let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'V·Block '))
   let l:current_status_mode = l:modelist
   return l:current_status_mode
endfunction

"function! StatuslineGitBranch()
"  let b:gitbranch=""
"  if &modifiable
"    lcd %:p:h
"    let l:gitrevparse=system("git rev-parse --abbrev-ref HEAD")
"    lcd -
"    if l:gitrevparse!~"fatal: not a git repository"
"      let b:gitbranch="(".substitute(l:gitrevparse, '\n', '', 'g').") "
"    endif
"  endif
"endfunction
"
"augroup GetGitBranch
"  autocmd!
"  autocmd VimEnter,WinEnter,BufEnter * call StatuslineGitBranch()
"augroup END

" Status Line Custom
let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'Normal·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ '^V' : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '^S' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}

set laststatus=2
set noshowmode
set statusline=
set statusline+=%0*\ %{ModeCurrent()}\ 
set statusline+=%2*\ %f\                                 " File path, modified, readonly, helpfile, preview
set statusline+=\ %{&modified?'[+]':''}                  " If modified
"set statusline+=%2*\%{b:gitbranch}                       " include git branch
set statusline+=%=                                       " Right Side
set statusline+=%3*│                                     " Separator
set statusline+=%2*\ %Y\                                 " FileType
set statusline+=%3*│                                     " Separator
set statusline+=%0*\ line:\ %02l/%L\                     " Line number / total lines,
set statusline+=%0*\ col:\ %02v\ (%1p%%)\                " Column and percentage of document

hi User1 ctermfg=007 ctermbg=239 guibg=#4e4e4e guifg=#adadad
hi User2 ctermfg=007 ctermbg=236 guibg=#303030 guifg=#adadad
hi User3 ctermfg=236 ctermbg=236 guibg=#303030 guifg=#303030
hi User4 ctermfg=239 ctermbg=239 guibg=#4e4e4e guifg=#4e4e4e
"-----------------------------------------------------------------------------------------"
