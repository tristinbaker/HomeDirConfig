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

" Have Vim remember last location of last 10 files opened
set viminfo='10,\"100,:20,%,n~/.viminfo

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

"----------------------------------"
"                                  "   
"            Functions             "
"                                  "
"----------------------------------"

function Create()
  let s:line=line(".")
  let input = input('Function (f)/Controller (c)/Model (m)?: ')
  if input == 'f' || input == 'function' || input == 'F' || input == 'Function'
    let name = input('Function name: ')
    let func_name = "def " . name
    call append(s:line, func_name)
    call append(s:line+1,"")
    call append(s:line+2,"end")
  elseif input == 'c' || input == 'controller' || input == 'C' || input == 'Controller'
    let name = input('Controller name: ')
    let func_name = "class " . name . "Controller < ApplicationController"
    let crud = input('Would you like resourceful methods? (y/n): ')
    if crud == 'y' || crud == 'Y' || crud == 'yes' || crud == 'Yes'
      call append(s:line, func_name)
      call append(s:line+1,"")
      call append(s:line+2,"def index")
      call append(s:line+3,"")
      call append(s:line+4,"end")
      call append(s:line+5,"")
      call append(s:line+6,"def show")
      call append(s:line+7,"")
      call append(s:line+8,"end")
      call append(s:line+9,"")
      call append(s:line+10,"def new")
      call append(s:line+11,"")
      call append(s:line+12,"end")
      call append(s:line+13,"")
      call append(s:line+14,"def create")
      call append(s:line+15,"")
      call append(s:line+16,"end")
      call append(s:line+17,"")
      call append(s:line+18,"def edit")
      call append(s:line+19,"")
      call append(s:line+20,"end")
      call append(s:line+21,"")
      call append(s:line+22,"def update")
      call append(s:line+23,"")
      call append(s:line+24,"end")
      call append(s:line+25,"")
      call append(s:line+26,"def destroy")
      call append(s:line+27,"")
      call append(s:line+28,"end")
      call append(s:line+29,"")
    endif
    call append(s:line+30,"private")
    call append(s:line+31,"")
    call append(s:line+32,"end")
  elseif input == 'm' || input == 'model' || input == 'M' || input == 'Model'
    let name = input('Model name: ')
    let func_name = "class " . name . " < ApplicationRecord"
    call append(s:line, func_name)
    call append(s:line+1,"")
    call append(s:line+2,"end")
  else
    echom "nope"
  endif
  unlet s:line
  call feedkeys("gg=G``")
  call feedkeys("dd")
endfunction

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