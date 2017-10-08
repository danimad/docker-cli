".vimrc
" Author: danimad

" Plug
" -----------------------
filetype off

call plug#begin('home/dev/.config/nvim/bundle')

" Apperance
" -----------------------
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ntpeters/vim-better-whitespace'

" Colorscheme
Plug 'chriskempson/base16-vim'
Plug 'ajh17/Spacegray.vim'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'joshdick/onedark.vim'
Plug 'mhartington/oceanic-next'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'easysid/mod8.vim'
Plug 'trusktr/seti.vim'
Plug 'keith/parsec.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'cocopon/iceberg.vim'
Plug 'MaxSt/FlatColor'

" Utility
" -----------------------
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch'
Plug 'junegunn/vim-easy-align'
Plug 'rking/ag.vim'   " Vim plugin for the_silver_searcher
Plug 'houtsnip/vim-emacscommandline'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'ervandew/supertab'

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'zchee/deoplete-jedi'
Plug 'zchee/libclang-python3'
Plug 'tweekmonster/deoplete-clang2'

call plug#end()

filetype plugin indent on

syntax on
" Style
" -----------------------
"set encoding=utf-8
set foldmethod=expr
" set viminfo="NONE"
" set shortmess=a
"set nocompatible
set modelines=0
set fenc=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set visualbell
set cursorline
set cursorcolumn
" from: http://howivim.com/2016/fatih-arslan/ for speed
set synmaxcol=128
syntax sync minlines=256
set re=1
"
set ruler
set backspace=indent,eol,start
set laststatus=2
"set number
set relativenumber
set cpoptions+=J
set undofile
set undoreload=10000
set matchtime=3
set splitbelow
set splitright
set fillchars=diff:⣿
set autowrite
set shiftround
set title
set autochdir           " always changes the work directory to the current
set autoread            " re-reads the file if it was changes outside vim
set history=1000        " keep 50 lines of command line history
set incsearch           " do incremental searching
set showtabline=2
set foldenable
set foldlevelstart=10
set foldnestmax=10
" set nolist
set clipboard=unnamed

" Neovim settings
set termguicolors
" set guicursor

" The Silver Searcher and Ctrl-P
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

" Start Deoplete at startup
let g:deoplete#enable_at_startup = 1

if has('mouse')
  set mouse=a
endif

let base16colorspace=256

" Wildmenu
" -----------------------
set wildmenu
set wildmode=list:longest

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

" Backups
" -----------------------
set backup      " keep a backup file
set undodir=~/Dropbox/dotfiles/.nvim/tmp/undo/      " undo files
set backupdir=~/Dropbox/dotfiles/.nvim/tmp/backup/ " backups
set directory=~/Dropbox/dotfiles/.nvim/tmp/swap/   " swap files

" Tabs, spaces, wrapping
" -----------------------
set expandtab
" set tabstop=2
set shiftwidth=2
set softtabstop=2
" set smarttab
set autoindent
set wrap
set textwidth=80
set colorcolumn=+1
set guioptions=er
set formatoptions=qrn1  "qrn1 , tcqarn1
" set formatoptions-=l  "qrn1 , tcqarn1
" set fo=croqnvt
" formatoptions:
" c - autowrap COMMENTS using textwidth
" r - insert comment leader (?) on <enter>
" o - insert comment leader on 'o' or 'O'
" q - gq formats comments (?)
" n - recon numbered lists
" v - wrap on blanks
" t - autowrap TEXT using textwidth

" List
"-------------------------
set list
set listchars=tab:▸\ ,eol:¬,extends:>,precedes:<

" Localization
" ----------------------
set spell
set spelllang=en,hu ",en_us ",it,de

" Sessions
" ----------------------
let g:workspace_autosave_always = 1

" Leader
" -----------------------
let mapleader=","
let maplocalleader="í"

" Searching
" -----------------------
nnoremap / /\v
vnoremap / /\v

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault

set scrolloff=3
set sidescroll=1
set sidescrolloff=10

set virtualedit+=block

nnoremap <tab> %
vnoremap <tab> %

" Remaps
" -----------------------
nnoremap <leader><space> :noh<cr> " clear search
nnoremap <leader>v :tabedit $MYVIMRC<CR> " new tab with .vimrc
nnoremap <leader>T :tabnew<CR> " new tab
nnoremap <A-j> gT " prev tab
nnoremap <A-k> gt " next tab
nnoremap <space> za
nnoremap j gj
nnoremap k gk
nnoremap D d$
nnoremap * *<c-o>
nnoremap H ^   " jump to the beginning of the line in normal mode
nnoremap L g_  " jump to the end of the line in normal mode
nnoremap <leader>r :call g:ToggleNuMode()<cr>
nnoremap \z :setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>
nnoremap <leader>mi ysiw_
nnoremap <leader>k ea<C-X><C-S>
nnoremap cp :let @" = expand("%:p")<CR>
vmap q <gv
vmap <TAB> >gv

" Colorscheme
colorscheme base16-mocha


let g:syntastic_python_checkers=['pep8', 'pylint', 'python']

inoremap <c-a> <esc>I
inoremap <c-e> <esc>A
inoremap <c-k> <esc>ld$a
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>
" nnoremap <C-H> <Left>
" nnoremap <C-L> <Right>
" nnoremap <C-J> <Up> " c-j is taken
" nnoremap <C-K> <Down>
inoremap <C-B> <C-O>yiW<End>=<C-R>=<C-R>0<CR> " calculator

" navigation between buffers
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" functions
so ~/.config/nvim/functions/add_functions.vim
so ~/.config/nvim/functions/abbr.vim
so ~/.config/nvim/functions/ipython_integration.vim

" ----------------------
" plug-ing, and language specific changes
" ----------------------

" Status line
" ----------------------
" Airline
" themes:
" molokai, powerlineish, luna, base16_paraiso, deep_space
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif


let g:airline_theme = 'base16_paraiso'

" " vim-powerline symbols
let g:airline_left_sep          = '⮀'
let g:airline_left_alt_sep      = '⮁'
let g:airline_right_sep         = '⮂'
let g:airline_right_alt_sep     = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly   = '⭤'
let g:airline_symbols.linenr = '⭡'

" FZF
" ----------------------
nnoremap <C-p> :FZF<CR>
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10split enew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.config/fzf-history'

" ----------------------
" Autogroups
" ----------------------

if has('autocmd')

    " .vimrc autoload
    augroup vimrc
        au!
        au bufwritepost init.vim source $MYVIMRC
        " powerline load:
        " au bufwritepost .vimrc call Pl#Load()
        au FocusLost * :wa " save when focus lost
        " Resize splits when the window is resized
        au VimResized * exe "normal! \<c-w>=" "
        au BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif
    augroup END

    augroup python
        au!
        au! BufRead,BufNewFile,Filetype python inoremap <buffer> <F9> :!python3 %<CR>
        au! BufRead,BufNewFile,Filetype python nnoremap <buffer> <F9> :!python3 %<CR>
        " au! FileType python nnoremap <leader>y :0,$!yapf<Cr>
        au! CompleteDone * pclose
        au! Filetype python inoremap <buffer> <F8> <C-o>:Dispatch<CR>
        au! Filetype python nnoremap <buffer> <F8> :Dispatch<CR>
        au! FileType python let b:dispatch = 'ipython3 %'
    augroup END

endif
