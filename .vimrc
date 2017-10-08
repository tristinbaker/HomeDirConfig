" Show line numbers
set nu

" Show matching parenthesis and brackets
set showmatch

" Searches while characters are entered
set incsearch

" Highlights searches
set hlsearch

" Makes tabs spaces
set expandtab

" Sets colorscheme
colorscheme elflord

filetype plugin indent on

" Makes tabs only 4 spaces rather than 8
set tabstop=4

" When indenting with '>', use 4 spaces width
set shiftwidth=4

" Move to next line after 80 characters
set tw=80

"-----------------------------------
"         Key Remapping               
"-----------------------------------

" Remap jj to escape so escape is not needed
inoremap jk <Esc>
cnoremap jk <Esc>

" Automatically puts #include when #in is typed
inoremap #in #include 

" Automatically puts #ifndef when #if is typed
inoremap #if #ifndef

" Automatically puts #define when #d is typed
inoremap #d #define

" Automatically puts #endif when #e is typed
inoremap #e #endif
