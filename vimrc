" Mouse settings
" This will allow balloons on hover AND pasting with middle click
" but only if vim is compiled with +clipboard (check with --version)
" To get +clipboard:
" On Arch linux install gvim package instead of vim
" On debian don't use vim-tiny
set ballooneval
set balloonevalterm
set mouse=a
set ttymouse=xterm2

" ALE Stuff
"
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'

let g:ale_fixers = {
\                   'javascript': ['prettier', 'remove_trailing_lines', 'trim_whitespace'],
\                   'css': ['prettier'],
\                   'python': ['autopep8', 'isort', 'remove_trailing_lines', 'trim_whitespace'],
\                   }
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma all'

let g:ale_linters = {
                    \'python': ['flake8', 'mypy', 'pylint', 'pyright', 'pyls', 'prospector']
                    \}

let g:ale_set_balloons=1
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1

" Ale keymaps
nmap K :ALEHover<CR> " Show docstring/method info in top window
nmap gr :ALEFindReferences<CR> " List references in top window
nmap gd :ALEGoToDefinition<CR> " Move to the definition
nmap gn :ALENext<CR>  " Move to the next error

" Vim test stuff
nmap <silent> t<C-n> :TestNearest<CR> "Test individual test
nmap <silent> t<C-f> :TestFile<CR> " Test active file
nmap <silent> t<C-s> :TestSuite<CR> " Test everything
nmap <silent> t<C-l> :TestLast<CR> " run last test
nmap <silent> t<C-g> :TestVisit<CR>" run last test in buffer

let test#strategy = "vimterminal"

" Airline config

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_theme = 'solarized'

let g:airline_left_sep          = ''
let g:airline_left_alt_sep      = ''
let g:airline_right_sep         = ''
let g:airline_right_alt_sep     = ''
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#right_sep = ''

let g:airline#extensions#branch#prefix     = '' " ⤴➔, ➥, ⎇
let g:airline#extensions#readonly#symbol   = '⊘'
let g:airline#extensions#linecolumn#prefix = '¶'
let g:airline#extensions#paste#symbol      = 'ρ'
let g:airline_symbols.linenr    = '␊'
let g:airline_symbols.branch    = '⎇'
let g:airline_symbols.paste     = 'ρ'
let g:airline_symbols.paste     = 'Þ'
let g:airline_symbols.paste     = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" UltiSnip stuff

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

" CTRL-P Stuff

" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg|pyc)$',
\}

" Use the nearest .git directory as the cwd
let g:ctrlp_working_path_mode = 'r'

" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<CR>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<CR>
nmap <leader>bm :CtrlPMixed<CR>
nmap <leader>bs :CtrlPMRU<CR>

" Buffergator stuff

" Use the top of the screen (for portrait monitor)
let g:buffergator_viewport_split_policy = 'T'

" I want my own keymappings...
let g:buffergator_suppress_keymaps = 1

" Looper buffers
"let g:buffergator_mru_cycle_loop = 1

" Go to the previous buffer open
nmap <leader>jj :BuffergatorMruCyclePrev<cr>

" Go to the next buffer open
nmap <leader>kk :BuffergatorMruCycleNext<cr>

" View the entire list of buffers open
nmap <leader>bl :BuffergatorOpen<cr>

" vimtex stuff

"This is required to stop vimtex annoying us with a warning
let g:tex_flavor = 'latex'

" General stuff

set encoding=UTF-8

" Use space as leader
nnoremap <SPACE> <Nop>
map <Space> <Leader>

filetype on
filetype plugin on


" Buffer stuff

set hidden "Allow buffer to be hidden if modified

nmap <leader>T :enew<CR> " Create empty buffer
nmap <leader>l :bnext<CR> " Move to next buffer
nmap <leader>h :bprevious<CR> " Move to previous buffer
" Close current buffer and move to previous one
" This is equivalent to closing a tab
nmap <leader>bq :bp <BAR> bd #<CR> 

" Using buffergator instead
" nmap <leader>bl :ls<CR> " Show all open buffers and their status

" Generic Python Stuff ----
" enable syntax highlighting
syntax enable

" show line numbers
set number

" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

set foldmethod=indent

" enable all Python syntax highlighting features
let python_highlight_all = 1

"End Python Stuf ----
"
" Vundle stuff going at the end 
"VUNDLE STUFF =====
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'https://github.com/w0rp/ale.git' " ALE linting/autocomplete.. needs appropriate LPS/linters installed

Plugin 'https://github.com/altercation/vim-colors-solarized.git' " pretty. Needs Xresources/kitty colour files set correctly

Plugin 'tpope/vim-fugitive' " git integration

Plugin 'knubie/vim-kitty-navigator' " kitty/vim nav

Plugin 'vim-test/vim-test' " run tests from within vim

Plugin 'vim-airline/vim-airline' " fancy status bar

Plugin 'vim-airline/vim-airline-themes' " themes for airline

Plugin 'ctrlpvim/ctrlp.vim' " Fuzzy search

Plugin 'lervag/vimtex' " latex features

Plugin 'jeetsukumaran/vim-buffergator' " Buffer tools

Plugin 'ryanoasis/vim-devicons' " filetype fonts. Needs nerdfonts/terminal font set correctly

Plugin 'frazrepo/vim-rainbow' " colour match brackets

Plugin 'jmcantrell/vim-virtualenv' " Handle virtualenvs 

Plugin 'sheerun/vim-polyglot' " syntax/indent for _every_ language

Plugin 'SirVer/ultisnips' " create/edit/use snippets

Plugin 'honza/vim-snippets' " Pre made snippets 

Plugin 'tweekmonster/django-plus.vim' " django file types/completions/snippets

call vundle#end()

filetype plugin indent on

"END VUNDLE STUFF =====

" Colour stuff (needs solarized to be loaded)
set background=light
colorscheme solarized
