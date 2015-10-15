set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'davidhalter/jedi-vim'
Plugin 'marijnh/tern_for_vim'
Plugin 'msanders/snipmate.vim.git'
Plugin 'vim-scripts/pep8'
Plugin 'vim-scripts/TaskList.vim.git'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'lsdr/monokai'
Plugin 'tomasr/molokai'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" All of your Plugins must be added before the following line
call vundle#end()

filetype plugin indent on

" The rest of your config follows here

" Change mapleader to comma
let mapleader=","

"augroup vimrc_autocmds
"    autocmd!
    " highlight characters past column 120
"    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
"    autocmd FileType python match Excess /\%80v.*/
"    autocmd FileType python set nowrap
"augroup END

" Powerline setup
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 12
set laststatus=2

" NERDTree shortcut
map <F2> :NERDTreeToggle<CR>

"Use spaces instead of tabs
set tabstop=4
set shiftwidth=4
set expandtab

" Task list settings
map <leader>td <Plug>TaskList

" Syntax highlighting and validation
syntax on                           " syntax highlighing
filetype on                          " try to detect filetypes
filetype plugin indent on    " enable loading indent file for filetype
set number
set nowrap

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SnytasticStatusLineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:ycm_global_ycm_extra_conf = '/home/eric/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm'

" Window splits shortcuts
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

set t_Co=256
set background=dark
colorscheme molokai
