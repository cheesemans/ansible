" =============================================================
" Plugins
" =============================================================
" Set compatability to Vim only
set nocompatible

" Helps force plug-ins to load correctly when it is turned on below
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" =============================================================
" Plugins
" =============================================================
" Status bar configuration
Plugin 'itchyny/lightline.vim'
" File system explorer
Plugin 'scrooloose/nerdtree'
" Linting plugin (syntax checking and semantic errors)
Plugin 'dense-analysis/ale'
" Surround plugin for placing parenthesis, brackets etc.
Plugin 'tpope/vim-surround'
" Color Schemes
Plugin 'morhetz/gruvbox'
" Git in vim
Plugin 'tpope/vim-fugitive'
" Code completion
" Plugin 'valloric/youcompleteme'

" All Plugins must be added before the following line
call vundle#end()

" For plug-ins to load correctly
filetype plugin indent on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" =============================================================
" My configurations
" =============================================================

" -------------------------------------------------------------
" General
" -------------------------------------------------------------
" Sets how many lines of history VIM has to remember
set history=500

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Turn off modelines
set modelines=0

" Vim's auto indentation feature does not work properly with text copied from outisde of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" Display options
set showmode
set showcmd


" -------------------------------------------------------------
" VIM user interface
" -------------------------------------------------------------
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Speed up scrolling in Vim
set ttyfast

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch
" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>
" How many tenths of a second to blink when matching brackets
set mat=2

" Remap % to TAB for easier toggling between brackets
nnoremap <tab> %
vnoremap <tab> %

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit of extra margin to the left
set foldcolumn=1


" -------------------------------------------------------------
" Colors and Fonts
" -------------------------------------------------------------
" Colorscheme
colorscheme gruvbox
set background=dark

" Enable syntax highlighting
syntax on

" Encoding
set encoding=utf-8


" -------------------------------------------------------------
" Files, backups and undo
" -------------------------------------------------------------
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


" -------------------------------------------------------------
" Text, tab and indent related
" -------------------------------------------------------------
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set noshiftround

" Set textwidth to 100 characters
set lbr
set textwidth=99

" Highlight 100 character width
set colorcolumn=100
highlight ColorColumn ctermbg=242

set ai "Auto indent
set si "Smart indent
set nowrap "Don't wrap lines

" Format options
set formatoptions=qrn1

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Show line numbers
set number
set relativenumber


" -------------------------------------------------------------
" Visual mode related
" -------------------------------------------------------------
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" When pasting in visual mode, the pasted over text is not copied
set mouse=a


" -------------------------------------------------------------
" Moving around, tabs, windows and buffers
" -------------------------------------------------------------
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <C-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" -------------------------------------------------------------
" Status bar
" -------------------------------------------------------------
" Alwars show the status line
set laststatus=2

" Format the status line
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}


" -------------------------------------------------------------
" Editing mappings
" -------------------------------------------------------------
" Remap VIM 0 to first non-blank character
map 0 ^

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

" Add normal keybindings for copy/paste/cut
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" -------------------------------------------------------------
" Helper functions
" -------------------------------------------------------------
function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" =============================================================
" Plugin configuration
" =============================================================

" -------------------------------------------------------------
" NERDTree
" -------------------------------------------------------------
" Remap NERDTreeToggle to Ctrl+n
map <C-n> :NERDTreeToggle<CR>
" Automatically close vim if only tab left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
