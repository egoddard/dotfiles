set encoding=utf-8
call plug#begin('~/.local/share/nvim/plugged')


Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi',
Plug 'sbdchd/neoformat'
Plug 'mxw/vim-jsx'
Plug 'altercation/vim-colors-solarized'
Plug 'lsdr/monokai'
Plug 'tomasr/molokai'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'airblade/vim-gitgutter'
Plug 'elzr/vim-json'
Plug 'editorconfig/editorconfig-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'joshdick/onedark.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'rakr/vim-one'

call plug#end()

let g:python_host_prog = '/home/eric/.virtualenvs/py2neovim/bin/python'
let g:python3_host_prog = '/home/eric/.virtualenvs/py3neovim/bin/python'

filetype plugin indent on

let mapleader="\<SPACE>"
set showmatch           " Show matching brackets.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set expandtab           " Insert spaces when TAB is pressed.

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


" Clear highlighting
nnoremap <silent> <leader>c :nohlsearch<CR>

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

" Use Esc to exit insert mode when in terminal
:tnoremap <Esc> <C-\><C-n>

" CtrlP Custom ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)|node_modules$',
  \ 'file': '\v\.(exe|so|dll|pyc)$',
  \ }

" Window splits shortcuts
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" buffer previous/next shortcuts
nnoremap <silent> <leader>q :bp<CR>
nnoremap <silent> <leader>e :bn<CR>

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'one'

" Use deoplete for autocompletion
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 1

" Close the completion preview window after a selection is made
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

"Remap completion to tab if preview window is open
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

let g:EditorConfig_exclude_patterns = ['fugitive://.*','scp://.*']

let g:markdown_folding_disabled = 1

" Keep undo history across sessions by storing in file.
silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
set undodir=~/.config/nvim/backups
set undofile

" Refresh file on focus
set autoread
au FocusGained * :checktime

" ALE config
let g:ale_python_flake8_executable = 'python'
let g:ale_python_flake8_options = '-m flake8'
let g:ale_lint_on_text_changed = 'never'
let g:ale_open_list = 0

let g:ale_linters = {
\   'python': ['flake8'],
\   'javascript': ['eslint']
\}

let g:ale_fixers = {
\   'python': ['yapf'],
\   'javascript': ['prettier'],
\   'css': ['prettier']
\}

nmap <silent> <leader>k <Plug>(ale_previous_wrap)
nmap <silent> <leader>j <Plug>(ale_next_wrap)

if (has("termguicolors"))
    set termguicolors
endif

let g:onedark_terminal_italics=1
colorscheme one
set background=light
