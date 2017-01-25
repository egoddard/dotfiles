set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'
Plugin 'tpope/vim-sensible'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'tpope/vim-fugitive'
"Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'davidhalter/jedi-vim'
"Plugin 'marijnh/tern_for_vim'
Plugin 'mxw/vim-jsx'
Plugin 'msanders/snipmate.vim.git'
Plugin 'vim-scripts/TaskList.vim.git'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'lsdr/monokai'
Plugin 'tomasr/molokai'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'tmhedberg/SimpylFold'
Plugin 'elzr/vim-json'

" All of your Plugins must be added before the following line
call vundle#end()

filetype plugin indent on
syntax on                           " syntax highlighing
filetype on                          " try to detect filetypes
set number
set nowrap

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

au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=80 expandtab autoindent fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css, *.md, *.rst set tabstop=2 softtabstop=2 shiftwidth=2

"python virtualenv support for YCM
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" Task list settings
map <leader>td <Plug>TaskList

" Folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Show docstrings for folded code
let g:SimpylFold_docstring_preview=1

" Markdown settings
let g:vim_markdown_folding_disabled=1

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SnytasticStatusLineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"let g:ycm_global_ycm_extra_conf = '/home/eric/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm'
let g:ycm_python_binary_path = 'python'

" ReactJS/JSX settings
let g:jsx_ext_required = 0 " allow JSX in normal JS files
let g:syntastic_javascript_checkers = ['eslint']

" Delete trailing whitespace
"autocmd BufWritePre * :%s/\s\+$//e

" Toggle paste mode
map <leader>p <Esc>:set paste<CR>
map <leader>[ <Esc>:set nopaste<CR>


" Window splits shortcuts
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

set t_Co=256
set background=dark
colorscheme molokai
