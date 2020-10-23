" ~/.vimrc

" pathogen
" execute pathogen#infect()

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
nnoremap j gj 
vnoremap j gj
nnoremap k gk
vnoremap k gk
