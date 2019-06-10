set background=dark " tell vim that background will be dark
set rnu " show relavite numbers on left side
set nu " combined with rnu, this will show absolute number for current line
set shiftwidth=4 " columns are 4 spaces
set smarttab " use tabs/spaces for indentation according to current file, spaces as default

"install Plug if missing
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
call plug#end()

" Opening nerdtree
map <C-n> :NERDTreeToggle<CR>

" Split navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

set showmatch "Show matching brackets when text indicator is over them

" Removes trailing spaces
function! TrimWhiteSpace()
%s/\s*$//
''
endfunction

" Trim whitespaces on file modifications
autocmd FileWritePre * :call TrimWhiteSpace()
autocmd FileAppendPre * :call TrimWhiteSpace()
autocmd FilterWritePre * :call TrimWhiteSpace()
autocmd BufWritePre * :call TrimWhiteSpace()

set title " nicer window title

