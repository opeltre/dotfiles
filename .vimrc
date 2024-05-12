" ~/.vimrc

" pathogen
execute pathogen#infect()

""""""" FOLDS 

set foldlevel=1

" toggle folds with space 
nnoremap <space> za
" python docstrings
let g:SimpylFold_fold_docstring = 0
" folds appearance
:hi Folded ctermbg=black
:hi Folded ctermfg=yellow
:hi FoldColumn ctermbg=black
" foldtext
set foldtext=MyFoldText()
function MyFoldText()
  let line = getline(v:foldstart)
  let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
  return sub
endfunction


" souris
set mouse=a
" Reconnaissance du type:
filetype plugin indent on

" Coloration syntaxique:
syntax on

" Affiche les numéros de ligne:
set number

" Fond sombre:
set background=dark

" Afficher les commandes: 
set showcmd

" Ouverture en dernière position:
if has("autocmd")
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Règles d'indentation et wrapping:

set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
set smarttab
set formatoptions+=l
set linebreak
set breakindent

set showbreak=......
au BufNewFile,BufReadPost *.tex set showbreak=. 

" Se déplacer ligne à ligne:
"nnoremap j gj 
"vnoremap j gj
nnoremap k gk
vnoremap k gk
