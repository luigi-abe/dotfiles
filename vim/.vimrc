"tab settings
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent

" shows relative numbers 
set relativenumber
set number
set wildmenu
set autoread
set hls is
set ic

call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree' "for tree
Plug 'junegunn/goyo.vim' "for zenmode
Plug 'christoomey/vim-tmux-navigator' "for tmux motions
Plug 'godlygeek/tabular' "for markdown
Plug 'preservim/vim-markdown' "for markdown  
Plug 'prabirshrestha/vim-lsp' "lsp
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "fzf
Plug 'junegunn/fzf.vim' "fzf
call plug#end()

"share clipboard across system
set clipboard=unnamed

"change cursor style and set to normal mode on enter
autocmd VimEnter * silent !echo -ne "\e[2 q"
let &t_SI = "\e[6 q" "normal mode
let &t_EI = "\e[2 q" "insert mode
let &t_SR = "\e[4 q" "visual mode

" for theme
syntax enable   
filetype plugin indent on 
colorscheme gruvbox
set background=dark

"-----KEYMAPS------
let mapleader = " "

nnoremap <leader>ef :NERDTreeToggle<CR>
nnoremap <leader>zm :Goyo 100<CR>
nnoremap <leader>ff :FZF<CR>
inoremap jk <Esc>
nnoremap <leader>nh :nohl<CR>
nnoremap x "_x
nnoremap <leader>PI :PlugInstall<CR>

