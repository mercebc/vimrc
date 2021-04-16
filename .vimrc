set nocompatible              " be improved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')

Plugin 'VundleVim/Vundle.vim'
Plugin 'mhartington/oceanic-next' " Color theme
Plugin 'scrooloose/nerdtree' " File explorer
Plugin 'vim-airline/vim-airline' " Navbar
Plugin 'sheerun/vim-polyglot' " Syntax higlighting
Plugin 'pangloss/vim-javascript' " Javascript syntax highlighting and indenting
Plugin 'mxw/vim-jsx'

Plugin 'junegunn/fzf' "Fizzy finder
Plugin 'junegunn/fzf.vim'
Plugin 'roman/golden-ratio'
Plugin 'takac/vim-hardtime' "hardtime vim forces you to use less commands to type and navigate

Plugin 'tomtom/tcomment_vim' " Commenting & Uncommenting stuff

Plugin 'elmcast/elm-vim' " elm plugin

"-------------------
" Javascript
"-------------------
let g:jsx_ext_required = 0 " Plugin valid for js and jsx files
"-------------------
" Elixir
"-------------------
Plugin 'elixir-editors/vim-elixir' " Syntax highlighting and indentation.
Plugin 'slashmili/alchemist.vim' " Gotodef, autocomplete and tooling.
let g:alchemist_tag_map = '<C-]>'
let g:alchemist_tag_stack_map = '<C-[>'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"-------------------
" Colors
"-------------------

" Theme
syntax enable
" for vim 7
set t_Co=256

" for vim 8
if (has("termguicolors"))
    set termguicolors
endif

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

colorscheme OceanicNext


let NERDTreeShowHidden=1

" Map NerdTree toggle to F6
nmap <F6> :NERDTreeToggle<CR>
" Shuts vim if NerdTree is the last window left
 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Starts NERDTree at the start.
" autocmd vimenter * NERDTree

set showmatch " Shows matching bracketssyntax on

set nu
set backspace=indent,eol,start
set tabstop=4
set nosmartindent
set autoindent

set laststatus=2 " Shows the current status of the file.
set expandtab
set shiftwidth=4
set softtabstop=4

set clipboard=unnamed

set list listchars=tab:»·,trail:·,nbsp:·

" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

"Fizzy finder
map <c-p> :FZF<CR>
map <leader>p :History<CR>
map <leader>g :GFiles?'<CR>

command! -bang -nargs=1 Search
\ call fzf#vim#grep(
\   'rg --column --line-number --no-heading --color=always '. shellescape(expand('<args>')), 1,
\   <bang>0 ? fzf#vim#with_preview('up:60%')
 \           : fzf#vim#with_preview('right:50%:hidden', '?'),
\   <bang>0)

nmap <silent> <Leader>s :execute 'Find'<CR>
command! -bang -nargs=* Find
\ call fzf#vim#grep(
\   'rg --column --line-number --no-heading --color=always '. shellescape(expand('<cword>')), 1,
\   <bang>0 ? fzf#vim#with_preview('up:60%')
\           : fzf#vim#with_preview('right:50%:hidden', '?'),
\   <bang>0)

" Numbers
set number
set numberwidth=5

set cursorline " highlight the current line the cursor is on
set cuc cul    " `highlight the current column the cursor is on5

" Do not create swapfiles
:set noswapfile
