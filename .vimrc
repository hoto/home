"let g:airline_powerline_fonts = 1
"let g:airline_theme='jellybeans'
"set laststatus=2 "display a line at the bottom of the screen with file name
"set nocompatible

set fileencodings=utf-8
set encoding=utf-8

colorscheme desert
filetype indent plugin on
syntax on

set autoindent "keep the same indent in new line
set backspace=indent,eol,start whichwrap+=<,>,[,] "allow backspacing over autoindent, line breaks etc.

"set backup
"set backupdir=~/tmp
"set backupskip=~/tmp
"set directory=~/tmp
set nobackup
set noswapfile

set hlsearch "highlight searches
set ignorecase "ignore case when searching
set incsearch " do incremental searching
set nomodeline "disable modelines, source of security vulnerabilities
set showcmd "show partial commands in the last line of the screen

set wildmenu "better command-line completion
set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab


noremap <C-k> <C-]>
noremap <C-j> <C-t>

" do not skip to next search match
noremap * #*zz
noremap # *#zz


"set nostartofline "stop certain movement from going to the first char of line

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.
" Use CTRL-G u to have CTRL-Z only undo the paste.
" This looks like enabling CTRL+V in Insert mode (andy)
exe 'inoremap <script> <C-V> <C-G>u' . paste#paste_cmd['i']
exe 'vnoremap <script> <C-V> ' . paste#paste_cmd['v']

" CTRL+X is Cut
vnoremap <C-X> "+x 
" CTRL+C is Copy
vnoremap <C-C> "+y 
" CTRL-V is Paste
map <C-V> "+gP
cmap <C-V> <C-R>+

" Use CTRL-Q to do what CTRL-V used to do (block selection)
noremap <C-Q> <C-V>

" Use CTRL-S for saving, also in Insert mode
noremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR>

if has('mouse')
  set mouse=a
endif

" CTRL-Z is Undo; not in cmdline though
noremap <C-Z> u
inoremap <C-Z> <C-O>u

" CTRL-Y is Redo (although not repeat); not in cmdline though
noremap <C-Y> <C-R>
inoremap <C-Y> <C-O><C-R>

" CTRL-A is Select all
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

" CTRL-Tab is Next window
noremap <C-Tab> <C-W>w
inoremap <C-Tab> <C-O><C-W>w
cnoremap <C-Tab> <C-C><C-W>w
onoremap <C-Tab> <C-C><C-W>w

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

"vim won't move cursor back after insertion
inoremap <silent> <Esc> <C-O>:stopinsert<CR>
