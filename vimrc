" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available

if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set nocompatible

" Hybrid line number mode
set number

" Per file type indentation
filetype plugin indent on

" Soft-tabs, 4 spaces
set expandtab
set shiftwidth=4
set softtabstop=4

" Always show status line
set laststatus=2
set ruler

" Hidden buffers
set hidden

" Search
set incsearch
set hlsearch

" Swapfile management
set swapfile
" set dir=~/.vim/swap

" Show trailing whitespace
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+\%#\@<!$/

" Tab completion mode
set wildmode=longest,list,full

" Spelling
set spelllang=en_ca

" Backspace
set backspace=indent,eol,start

" Buffer switching
nnoremap <leader>b :buffers<CR>:buffer<Space>

" Language specific settings
autocmd Filetype coffee setlocal shiftwidth=2 softtabstop=2
autocmd Filetype html setlocal shiftwidth=2 softtabstop=2
autocmd Filetype less setlocal shiftwidth=2 softtabstop=2
autocmd Filetype javascript setlocal shiftwidth=2 softtabstop=2
autocmd Filetype json setlocal shiftwidth=2 softtabstop=2
autocmd Filetype python setlocal colorcolumn=80
autocmd Filetype ruby setlocal shiftwidth=2 softtabstop=2
autocmd Filetype scheme setlocal shiftwidth=2 softtabstop=2 colorcolumn=80
autocmd Filetype go setlocal tabstop=4 shiftwidth=4 noexpandtab
autocmd Filetype haskell setlocal colorcolumn=80
autocmd Filetype sml setlocal shiftwidth=3 softtabstop=3 colorcolumn=80
autocmd Filetype ocaml setlocal shiftwidth=2 softtabstop=2 colorcolumn=80

autocmd Filetype text map j gj
autocmd Filetype text map k gk
autocmd Filetype text setlocal wrap linebreak noexpandtab
autocmd Filetype markdown map j gj
autocmd Filetype markdown map k gk
autocmd Filetype markdown setlocal wrap linebreak noexpandtab
autocmd Filetype plaintex map j gj
autocmd Filetype plaintex map k gk
autocmd Filetype plaintex setlocal wrap linebreak noexpandtab

" Supposed to be used with vim-plug
if filereadable(expand("~/.vimrc.plugins"))
    source ~/.vimrc.plugins
endif

if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

if filereadable(expand("./.vimrc.dir"))
    source ./.vimrc.dir
endif
