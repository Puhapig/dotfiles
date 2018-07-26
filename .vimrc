" Vundle
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/vundle'

" Colourscheme
Plugin 'joshdick/onedark.vim'

" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Fuzzy finder
Plugin 'kien/ctrlp.vim'

" Handle surrounds
Plugin 'tpope/vim-surround'

" Repeat plugin actions with '.'
Plugin 'tpope/vim-repeat'

" Highlight trailing whitespace
Plugin 'ntpeters/vim-better-whitespace'

" Smooth scrolling
Plugin 'terryma/vim-smooth-scroll'

" Syntax
Plugin 'vim-ruby/vim-ruby'
Plugin 'thoughtbot/vim-rspec'
Plugin 'rodjek/vim-puppet'
Plugin 'tpope/vim-markdown'
Plugin 'leshill/vim-json'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'chase/vim-ansible-yaml'
Plugin 'vim-python/python-syntax'

call vundle#end()

filetype plugin indent on " Filetype auto-detection

syntax on

" set relativenumber " Line numbers relative to cursor
set number

"Display whitespace
set listchars=tab:>.,trail:.
set list

set tabstop=2
set shiftwidth=2
set softtabstop=2
set showtabline=2
set mouse=a
set expandtab " use spaces instead of tabs.
set smarttab " let's tab key insert 'tab stops', and bksp deletes tabs.
set shiftround " tab / shifting moves to closest tabstop.
set autoindent " Match indents on new lines.
set smartindent " Intellegently dedent / indent new lines based on rules.
set backspace=indent,eol,start " make backspace great again.
set colorcolumn=120

" We have VCS -- we don't need this stuff.
set nobackup " We have vcs, we don't need backups.
set nowritebackup " We have vcs, we don't need backups.
set noswapfile " They're just annoying. Who likes them?

" don't nag me when hiding buffers
set hidden " allow me to have buffers with unsaved changes.
set autoread " when a file has changed on disk, just load it. Don't ask.

" Make search more sane
set ignorecase " case insensitive search
set smartcase " If there are uppercase letters, become case-sensitive.
set incsearch " live incremental searching
set showmatch " live match highlighting
set hlsearch " highlight matches
set gdefault " use the `g` flag by default.

" allow the cursor to go anywhere in visual block mode.
set virtualedit+=block

" To enable vim-airline
set laststatus=2

" leader is a key that allows you to have your own "namespace" of keybindings.
" You'll see it a lot below as <leader>
let mapleader = ","


" So we don't have to press shift when we want to get into command mode.
noremap ; :

" So we don't have to reach for escape to leave insert mode.
inoremap jf <esc>

" create new vsplit, and switch to it.
noremap <leader>v <C-w>v

" bindings for easy split nav
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Open new split panes to the bottom/right
set splitbelow
set splitright

" Use sane regexes when searching
nnoremap / /\v
vnoremap / /\v

" Quick buffer switching - like cmd-tab'ing
nnoremap <leader><leader> <c-^>


" Visual line nav, not real line nav
" If you wrap lines, vim by default won't let you move down one line to the
" wrapped portion. This fixes that.
noremap j gj
noremap k gk

" Clear match highlighting
noremap <leader><space> :noh<cr>:call clearmatches()<cr>
noremap <leader>n :noh<cr>:call clearmatches()<cr>


let g:ctrlp_map = '<c-t>' " Remap ctrlp to ctrl-t

" Let ctrlp have up to 30 results.
let g:ctrlp_max_height = 30
let g:solarized_termtrans = 1

" ########################

" puppet file type recognition
autocmd BufRead,BufNewFile *.pp setfiletype=puppet

" golang file type recognition
autocmd BufRead,BufNewFile *.mtail setfiletype=go

" Python syntax for requirements.txt file
autocmd BufRead,BufNewFile requirements.txt set syntax=python
autocmd BufRead,BufNewFile hosts,Pipfile set syntax=dosini

" Alternate Dockerfile naming
autocmd BufRead,BufNewFile Dockerfile* set syntax=dockerfile

" PEP8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4     |
    \ set softtabstop=4 |
    \ set shiftwidth=4  |

    "\ set textwidth=120 |
    \ set expandtab     |
    \ set autoindent    |
    \ set fileformat=unix

" vim-airline
" ===========
" Set vim-airline theme
let g:airline_theme='onedark'
" Use powerline fonts
let g:airline_powerline_fonts = 1

" enable python syntax highlighting
let g:python_highlight_all = 1
let g:python_highlight_builtin_funcs = 0

" from https://github.com/joshdick/onedark.vim
colorscheme onedark

" Smooth scroll config
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
