set encoding=utf-8
call plug#begin('~/.local/share/nvim/plugged')


Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'sbdchd/neoformat'
Plug 'mxw/vim-jsx'
Plug 'altercation/vim-colors-solarized'
Plug 'lsdr/monokai'
Plug 'tomasr/molokai'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'tmhedberg/SimpylFold'
Plug 'elzr/vim-json'
Plug 'editorconfig/editorconfig-vim'

call plug#end()

let g:python_host_prog = '/home/eric/.pyenv/versions/py2neovim/bin/python'
let g:python3_host_prog = '/home/eric/.pyenv/versions/py3neovim/bin/python'

let mapleader="\<SPACE>"
set showmatch           " Show matching brackets.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=4           " Render TABs using this many spaces.
set shiftwidth=4        " Indentation amount for < and > commands.

set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set nostartofline       " Do not jump to first character with page commands.
set nowrap              " Do not soft wrap long lines

set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
" set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).

" Use ; for commands instead of :
nnoremap ; :
" Use Q to execute default register
nnoremap Q @q

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Search and Replace
nmap <Leader>s :%s//g<Left><Left>


set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 12

" NERDTree shortcut
map <F2> :NERDTreeToggle<CR>

" ctrlP Settings
" Open file menu
nnoremap <Leader>o :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>

" CtrlP Custom ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|pyc)$',
  \ }


" Window splits shortcuts
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
let g:airline_theme = 'jellybeans'

" Use deoplete for autocompletion
let g:deoplete#enable_at_startup = 1

let g:EditorConfig_exclude_patterns = ['fugitive://.*','scp://.*']

set t_Co=256
set background=dark
colorscheme molokai
