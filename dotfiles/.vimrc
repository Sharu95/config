if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

" Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree'
Plug 'hzchirs/vim-material'
Plug 'vim-airline/vim-airline'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'airblade/vim-gitgutter'


call plug#end()
"syntax off 

" set true colors 
if (has("termguicolors"))
  set termguicolors
endif

" material theme settings
let g:material_theme_style = 'dark'
let g:airline_theme='material'
" let g:material_terminal_italics = 1

" set color scheme in general
set background=dark
" colorscheme vim-material

set number relativenumber
set colorcolumn=80

" Airline
let g:airline#extensions#tabline#enabled = 1


" autocmd VimEnter * NERDTree
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4
set listchars=tab:\-\ 
set list
