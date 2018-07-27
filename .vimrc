source /apollo/env/envImprovement/var/vimrc

"----------------------------------"
"                                  "   
"           UI Upgrades            "   
"                                  "
"----------------------------------"

nmap <Leader>j <Plug>IMAP_JumpForward

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

" 256 bit colors
if &term == "screen"
  set t_Co=256
endif

" Sets colorscheme
colorscheme iceberg

" Visual <TAB> completion 
set wildmenu

" Makes :vsp open panes on right side
set splitright

" Makes :sp open panes on bottom 
set splitbelow

filetype plugin indent on

" Makes tabs only 4 spaces rather than 8
set tabstop=4

" When indenting with '>', use 4 spaces width
set shiftwidth=4

" Move to next line after 80 characters (HTML makes this hard to use)
" set tw=80

" Have bar show up at 80 characters
" set colorcolumn=80

"----------------------------------"
"                                  "   
"         Key Remapping            "   
"                                  "
"----------------------------------"

"---------------------------------"
"        C++ Specific Remaps      "
"---------------------------------"

" Automatically puts #include when #in is typed
inoremap #in #include 

" Automatically puts #ifndef when #if is typed
inoremap #if #ifndef

" Automatically puts #define when #d is typed
inoremap #d #define

" Automatically puts #endif when #e is typed
inoremap #e #endif

"---------------------------------"
"       Ruby Specific Remaps      "
"---------------------------------"

" Remaps rpq to paste ruby debug code, prevents weird pry session, then fixes indentation
nnoremap rqp A<CR>require 'pry'<CR>binding.pry if Rails.env.development?<CR>puts 'YEET'<ESC><F7>

" Same as above, but for when you're in .html.erb files
nnoremap mrqp A<CR><% require 'pry' %><CR><% binding.pry %><CR><% puts 'YEET' %><ESC><F7>

" Removes any line that has require pry, binding.pry, or YEET
nnoremap norqp :g/require 'pry'\\|binding.pry\\|YEET/d<CR>

"----------------------------------"
"         Vim Remapping            "   
"----------------------------------"

" Remap jj to escape so escape is not needed
inoremap jj <Esc>
cnoremap jj <Esc>

" Don't skip multi line lines
nnoremap j gj
nnoremap k gk

" Remaps :tabn :tabp to tn and tp 
nnoremap tn :tabnext<CR>
nnoremap tp :tabprev<CR>

" Remaps :w and :wq to ww and qq
noremap ww :w<CR>
nnoremap qq :wq<CR>

" Remap pane splits
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" Fix indentation on F7
noremap <F7> gg=G``

" Paste mode on F5
set pastetoggle=<F5>
