"""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""
set nocompatible

" init pathogen to include files in ~/.vim/bundle
call pathogen#infect()

" Set folding
set foldenable
set foldmethod=manual

" Set case behaviour
set ignorecase
set smartcase

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Hide buffers instead of closing them
set hidden

" Copy text between app and vim through the clipboard
set tw=0 wrap linebreak

" Set filetype plugin
filetype indent on
filetype plugin on
"set autochdir

" Set numbers of saved changes
set history=1000
set undolevels=1000

set showmode

" Turn Off Swap Files
set noswapfile
set nobackup
set nowb

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" set out tab characters, trailing whitespace and invisible spaces visually
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

"""""""""""""""""""""""""""
" User interface
"""""""""""""""""""""""""""
" Maintain more context around the cursor
set scrolloff=5

" Always show current position
set ruler

set wildmenu
set wildmode=list:longest,full
set showcmd

" mark the end of the rewrite selection when using 'cw'
set cpoptions+=$

syntax on
set number
set cursorline

" Command bar height
set ch=2

" Search settings
set incsearch
set hlsearch

" showmatch: Show the matching bracket for the last ')'?
set showmatch

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set guitablabel=%M\ %t
endif

set t_Co=256

"set tabline=tabline-layout
"colorscheme wombat256
colorscheme mustang


"""""""""""""""""""""""""""
" Tabbing & Indent
"""""""""""""""""""""""""""
" Spaces instead of tabs
"set expandtab

" 1tab = 2spaces
"set tabstop=2
"set shiftwidth=2

set autoindent
set smartindent

" set PHP specific tabs
set filetype=php expandtab tabstop=2 shiftwidth=2 autoindent smartindent

"""""""""""""""""""""""""""
" PHP
"""""""""""""""""""""""""""
" PHP build settings (use :make)
set makeprg=php\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l
" syntax highlight settings
let php_sql_query=1
let php_htmlInStrings=1
" auto-save the buffer when :make is invoked
autocmd QuickFixCmdPre make w

" Drupal CodeSniffer integration with Syntastic
let g:syntastic_phpcs_conf=" --standard=Drupal --extensions=php,module,inc,install,test,profile,theme"
"disables the format checking for phpcs, but leaves the PHP syntax checking on
"let g:syntastic_phpcs_disable=1


"""""""""""""""""""""""""""
" Statusline
"""""""""""""""""""""""""""
" Better statusline
" from https://github.com/spf13/spf13-vim/blob/master/.vimrc
if has('statusline')
  set laststatus=2
  " Broken down into easily includeable segments
  set statusline=%<%f\    " Filename
  set statusline+=%w%h%m%r " Options
  set statusline+=%{fugitive#statusline()} "  Git Hotness
  set statusline+=\ [%{&ff}/%Y]            " filetype
"  set statusline+=\ [%{getcwd()}]          " current dir
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  let g:syntastic_enable_signs=1
  set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
"set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%*
endif


"""""""""""""""""""""""""""
" Supertab
"""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]


"""""""""""""""""""""""""""
" Keystrokes
"""""""""""""""""""""""""""
imap <C-s> <esc>:w<cr>a
map <C-right> <ESC>:bn<CR>
map <C-left> <ESC>:bp<CR>
" auto reindent
nmap <C-F11> 1G=G
imap <C-F11> <ESC>1G=Ga
" paste with automatic formatting. C-p with normal
nnoremap <Esc>P P'[v']=
nnoremap <Esc>p p'[v']=
nnoremap <c-p> p
" stops to jump cursor “over” the current line to the next line
nnoremap j gj
nnoremap k gk

" Set indentation on pastes
set pastetoggle=<F12> 

" Let's make it easy to edit the .vimrc file key, ('e'dit 'v'imrc)
nmap <silent> ,ev :e $MYVIMRC<cr>
" And to source this file as well key ('s'ource 'v'imrc)
nmap <silent> ,sv :so $MYVIMRC<cr>

"Stay away from arrow keys
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>
" map C-Space to omnicomplete
imap <C-Space> <C-x><C-o>
imap <C-@> <C-Space>

"  when you forgot to sudo before editing use w!!
cmap w!! w !sudo tee % >/dev/null

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"""""""""""""""""""""""""""
" Tags
"""""""""""""""""""""""""""
" map <ctrl>+F12 to generate ctags for current folder:
map <C-F12> :!ctags -R .<CR><CR>
" add current directory's generated tags file to available tags
"set tags+=./tags

" replace Taglist module with Tagbar
nmap <F8> :TagbarToggle<CR>
let tagbar_autofocus = 1
let tagbar_autoclose = 1


"""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""
map <F2> :NERDTreeToggle<CR>
let NERDTreeChDirMode=2
let NERDTreeQuitOnOpen=1
let NERDTreeShowBookmarks=1
nnoremap <leader>n :NERDTree .<CR>


"""""""""""""""""""""""""""
" Functions
"""""""""""""""""""""""""""
