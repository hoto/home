"====================================
" VUNDLE
"====================================
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'L9'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'FuzzyFinder'
Plugin 'vim-scripts/vim-auto-save'
Plugin 'leafgarland/typescript-vim'
Plugin 'elzr/vim-json'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'tpope/vim-surround'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'chase/vim-ansible-yaml'
Plugin 'MarcWeber/vim-addon-mw-utils' "for vim-snipmate
Plugin 'tomtom/tlib_vim' "for vim-snipmate
Plugin 'kurayama/systemd-vim-syntax'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets' "for vim-snipmate
Plugin 'evanmiller/nginx-vim-syntax'
call vundle#end()

filetype plugin indent on

" You will have to restart Vim to update Plugin list.
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to  auto-approve removal


"=====================================
" VIM STUFF
"====================================
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar
set fileencodings=utf-8
set encoding=utf-8
set t_Co=256 "enables 256 colors
set nobackup
set noswapfile
set nowritebackup
set ignorecase "ignore case when searching
set incsearch " do incremental searching
set nomodeline "disable modelines, source of security vulnerabilities
set showcmd "show partial commands in the last line of the screen
set wildmenu "better command-line completion
set tabstop=4
set shiftwidth=2
set softtabstop=2
set expandtab
"set autoindent "keep the same indent in new line
set backspace=indent,eol,start whichwrap+=<,>,[,] "allow backspacing over autoindent, line breaks etc.
set pastetoggle=<F10> "disables formatting when pasting text in Insert mode
set splitright "make vsplit put the new buffer on the right of the current buffer
set splitbelow "make split put the new buffer below the current buffer

if has("gui_running")
    colorscheme desert
else
    colorscheme desert
endif

syntax on "syntax highliting on
set hlsearch "higlight last searched pattern
highlight Search cterm=NONE ctermfg=black ctermbg=yellow
filetype indent plugin on

"=====================================
" MAPPINGS
"====================================
" do not skip to next search match
noremap * #*zz
noremap # *#zz

:imap jj <Esc>

" CTRL-Y is Redo (although not repeat); not in cmdline though
noremap <C-Y> <C-R>
inoremap <C-Y> <C-O><C-R>

" CTRL-p will set PATH to current file directory (usefull for fuzzy finder)
map <C-p> :cd %:p:h<CR>

" Switching case of words
" gcw        - capitalize word (from cursor position to end of word)
" gcW        - capitalize WORD (from cursor position to end of WORD)
" gciw       - capitalize inner word (from start to end)
" gciW       - capitalize inner WORD (from start to end)
" gcis       - capitalize inner sentence
" gc$        - capitalize until end of line (from cursor postition)
" gcgc       - capitalize whole line (from start to end)
" gcc        - capitalize whole line
" {Visual}gc - capitalize highlighted text
if (&tildeop)
  nmap gcw guw~l
  nmap gcW guW~l
  nmap gciw guiw~l
  nmap gciW guiW~l
  nmap gcis guis~l
  nmap gc$ gu$~l
  nmap gcgc guu~l
  nmap gcc guu~l
  vmap gc gu~l
else
  nmap gcw guw~h
  nmap gcW guW~h
  nmap gciw guiw~h
  nmap gciW guiW~h
  nmap gcis guis~h
  nmap gc$ gu$~h
  nmap gcgc guu~h
  nmap gcc guu~h
  vmap gc gu~h
endif

"=====================================
" PLUGINS
"====================================
" AIRLINE - install fonts: https://github.com/powerline/fonts
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 12
set laststatus=2 "display a line at the bottom of the screen with file name
let g:airline_powerline_fonts = 1

" VIM-AUTO-SAVE
let g:auto_save = 1 "enable autosave
let g:auto_save_silent = 1 "auto-save notification display on/off
let g:auto_save_in_insert_mode = 0
let g:auto_save_no_updatetime = 1

" FUZZY-FINDER
let s:slash = '[/\\]'
let s:startname = '(^|'.s:slash.')'
let s:endname = '($|'.s:slash.')'
let s:extension = '\.bak|\.dll|\.exe|\.o|\.pyc|\.pyo|\.swp|\.swo|\.class'
let s:dirname = 'node_modules|target|bower_components|build|deploy|tools|\.idea|\.git|.+\.egg-info'
let g:fuf_file_exclude = '\v'.'('.s:startname.'('.s:dirname.')'.s:endname.')|(('.s:extension.')$)'
let g:fuf_dir_exclude = '\v'.s:startname.'('.s:dirname.')'.s:endname
let g:fuf_modesDisable = []
let g:fuf_mrufile_maxItem = 60
let g:fuf_mrucmd_maxItem = 60
let g:fuf_enumeratingLimit = 60
map ,f :FufFile <CR>
map ,c :FufCoverageFile <CR>
map ,e :FufBuffer <CR>
map ,r :FufMruFile <CR>
map ,j :FufJumpList <CR>
map ,g :FufLine <CR>
map ,l :FufLine <CR>
map ,p :FufRenewCache <CR>

" JAVASCRIPT-LIBRARIES-SYNTAX
let g:used_javascript_libs = 'underscore,backbone,flux,react,jasmine,chai'

" Jump to last position when reopenning a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

au BufNewFile,BufRead Jenkinsfile setf groovy
