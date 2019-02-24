if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree'
"Plug 'hzchirs/vim-material'
"Plug 'tyrannicaltoucan/vim-quantum'

call plug#end()
"syntax off 

set number relativenumber
" set colorcolumn=80

"let g:material_style='default'
"set background=dark
"set termguicolors
"colorscheme quantum


autocmd VimEnter * NERDTree
set autoindent
set noexpandtab
set tabstop=2
set shiftwidth=2
set listchars=tab:\-\ 
set list
