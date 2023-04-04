set background=dark
set rnu " show relavite numbers on left side
set nu " combined with rnu, this will show absolute number for current line
set shiftwidth=4 " columns are 4 spaces
set smarttab " use tabs/spaces for indentation according to current file, spaces as default
"setlocal spell

set tgc " 24 bit rgb colors

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
Plug 'nathanaelkane/vim-indent-guides'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'Soares/base16.nvim'
Plug 'sheerun/vim-polyglot'
" TODO: ubuntu has old nvim, so this can't be used
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
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
silent %s/\s*$//
''
endfunction

" Trim whitespaces on file modifications
autocmd FileWritePre * :call TrimWhiteSpace()
autocmd FileAppendPre * :call TrimWhiteSpace()
autocmd FilterWritePre * :call TrimWhiteSpace()
autocmd BufWritePre * :call TrimWhiteSpace()

set title " nicer window title

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines
set listchars+=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

" Show list chars
set list

" CoC.nvim config
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Jumps in fzf, if only this was not vimscript I could actually read it...
function! GetJumps()
  redir => cout
  silent jumps
  redir END
  return reverse(split(cout, "\n")[1:])
endfunction
function! GoToJump(jump)
    let jumpnumber = split(a:jump, '\s\+')[0]
    execute "normal " . jumpnumber . "\<c-o>"
endfunction
command! Jumps call fzf#run(({
        \ 'source': GetJumps(),
        \ 'sink': function('GoToJump')}))

