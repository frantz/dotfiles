" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vimrc

" Install Vim Plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin()

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'w0rp/ale'

" Javascript plugin
Plug 'pangloss/vim-javascript'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
Plug 'carlitux/deoplete-ternjs'


Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'ryanoasis/vim-devicons'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tomtom/tcomment_vim'
Plug 'sjl/gundo.vim'
Plug 'rking/ag.vim' " pacman -S the_silver_searcher
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'mxw/vim-jsx'
Plug 'embear/vim-localvimrc'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'JamshedVesuna/vim-markdown-preview'

call plug#end()

set background=dark
colorscheme solarized

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>e :e! ~/.config/nvim/init.vim<cr>
autocmd! bufwritepost init.vim source ~/.config/nvim/init.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Two spaces indent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set smarttab
set shiftwidth=2
set tabstop=2
set shiftround

" converting tabs to space before writing a file
set expandtab
autocmd! bufwritepre * set expandtab | retab! 2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocomplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
let g:deoplete#file#enable_buffer_path = 1 " path relative to current file
" Use ALE and also some plugin 'foobar' as completion sources for all code.
call deoplete#custom#option('sources', {
\ '_': ['ale'],
\})

let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

let g:ale_fixers = {
\ 'javascript': ['eslint']
\ }

let g:localvimrc_whitelist=['/home/frantz/src/']
let g:localvimrc_persistent=1
let g:ale_fix_on_save = 1

"
" NERDTree settings
autocmd vimenter * NERDTree
autocmd FileType nerdtree setlocal nolist " https://github.com/ryanoasis/vim-devicons/issues/133
map <C-bslash> :NERDTreeToggle<CR>
map <leader>f :NERDTreeFind<CR>

" Airline setup
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'

" show line number
set number

" highlight current line
set cursorline

" show command in bottom bar
set showcmd

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

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

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Set invisible characters for :set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" enable folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" open ag.vim
nnoremap <leader>a :Ag

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><S-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><S-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" To map <Esc> to exit terminal-mode:
tnoremap <Esc> <C-\><C-n>

" https://github.com/JamshedVesuna/vim-markdown-preview#unix
let vim_markdown_preview_github=1
let vim_markdown_preview_use_xdg_open=1
let vim_markdown_preview_use_xdg_open=1

" nnoremap <C-d> :ALEGoToDefinition<CR>
