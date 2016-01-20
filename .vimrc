let g:init_dir = getcwd()

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'itchyny/lightline.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'mbbill/undotree'

Plugin 'davidhalter/jedi-vim'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/indentpython.vim'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-commentary'
Plugin 'rking/ag.vim'
Plugin 'ntpeters/vim-better-whitespace'

Plugin 'albfan/nerdtree'
Plugin 'albfan/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ryanoasis/vim-devicons'

Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

Plugin 'tmux-plugins/vim-tmux-focus-events'

" Plugin 'n9code/pydeadbeef.vim'
Plugin 'vim-scripts/Conque-GDB'

" Plugin 'nathanaelkane/vim-indent-guides'
call vundle#end()

filetype indent plugin on
syntax on


" Color scheme
colorscheme solarized
set background=dark


augroup vimrc
    au!
    au BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END

let mapleader=','



" General
set encoding=utf-8
scriptencoding utf-8
set fileformat=unix
set number
set modelines=0
set hidden
set history=1000
set undoreload=10000
set shell=bash
set showbreak=>
set splitbelow
set splitright
set backspace=indent,eol,start
" TODO: patch fonts
" set fillchars=
set autowrite
set autoread
set shiftround
set title
set cursorline
set noshowmode
set ttimeout
set ttimeoutlen=50
" TODO: test this
set viminfo='100,<1000100,%,:5
set scrolloff=4
set completeopt=longest,menuone,preview,noinsert
set ruler
set laststatus=2
set t_vb=
set cmdheight=1
set pastetoggle=<F2>
set clipboard=unnamed


" Tabs & Spaces
set expandtab
set smarttab
set shiftwidth=4
set tabstop=8
set softtabstop=4
au BufNewFile,BufReadPost *.css,*.html,*.js,*.json set shiftwidth=2


" Wildmenu
set wildmenu
set wildmode=full
set wildignore+=.hg,.git,.svn
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest
set wildignore+=*.sw?
set wildignore+=*.DS_Store
set wildignore+=migrations
set wildignore+=*.pyc
set wildignore+=*.orig


" Line wrapping and display
set wrap
set linebreak  " default `breakat` is pretty OK
set textwidth=80
set formatoptions+=qrn1
set foldlevel=0


" Search
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch


" Backups
set undodir=~/.vim/tmp/undo//
set directory=~/.vim/tmp/swap//
set undofile
set noswapfile


" Auto commands
autocmd InsertLeave * :pc


" Key Mappings
noremap <C-h> <C-w>h
imap <C-h> <Esc><C-h>
noremap <C-j> <C-w>j
imap <C-j> <Esc><C-j>
noremap <C-k> <C-w>k
imap <C-k> <Esc><C-k>
noremap <C-l> <C-w>l
imap <C-l> <Esc><C-l>

noremap <leader>= =

noremap = :vertical resize +2<CR>:echo<CR>
noremap - :vertical resize -2<CR>:echo<CR>
noremap + :resize +2<CR>:echo<CR>
noremap _ :resize -2<CR>:echo<CR>

noremap <C-a> g^
imap <C-a> <Esc><C-a>i
noremap <C-e> g$
imap <C-e> <Esc><C-e>a

noremap <C-t> :tabnew<CR> 
imap <C-t> <Esc><C-t>
noremap <leader><Tab> :tabclose<CR>

" NERDTree Configuration
noremap <leader>t :NERDTreeTabsToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1

let g:NERDTreeIndicatorMap = {
            \ "Modified"  : "*",
            \ "Staged"    : "+",
            \ "Untracked" : "-",
            \ "Renamed"   : ">",
            \ "Unmerged"  : "=",
            \ "Deleted"   : "x",
            \ "Dirty"     : "#",
            \ "Clean"     : "v",
            \ "Unknown"   : "?"
            \ }


noremap <Tab> gt
noremap <S-Tab> gT

noremap <leader>q :q!<CR><Esc>
noremap <leader>Q :qal!<CR><Esc>

noremap <leader>ss :setlocal spell spellang=en_us<cr>
inoremap <leader>s <C-X>s
noremap <leader>l :nohl<CR>

" noremap <C-f> /\v
" inoremap <C-Space> <C-x><C-o>

" Stay selected in visual mode
vnoremap > ><CR>gv
vnoremap < <<CR>gv
map <leader>/ gcc
vmap <leader>/ gc

vmap <C-r> "_dP

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>rv :w<cr>:source $MYVIMRC<cr>

" Copy the while file contents
noremap <C-c><C-c> gg0vG$y<Esc>
" Run the python file and start interpreter
augroup Python
    autocmd!
    autocmd FileType python noremap <leader>py :w<CR>:!pyt_run %<CR>
    " autocmd FileType python VirtualEnvActivate
augroup END


" This is for editing test files with long wrapping lines
augroup text
    autocmd!
    autocmd FileType tex noremap <Up> gk
    autocmd FileType tex imap <Up> <Esc><Up>a
    autocmd FileType tex noremap <Down> gj
    autocmd FileType tex imap <Down> <Esc><Down>a
    autocmd FileType tex noremap <C-a> g0
    autocmd FileType tex imap <C-a> <Esc><C-a>i
    autocmd FileType tex noremap <C-e> g$
    autocmd FileType tex imap <C-e> <Esc><C-e>a
augroup END

" Easy conflict resolution
if &diff
    noremap z<up> :diffupdate<cr>
noremap z<left> :diffget LO<cr>
    noremap z<right> :diffget RE<cr>
    noremap z<down> :diffget BA<cr>
    noremap <cr> ]c
    noremap \ [c
endif

let g:lightline = {
            \ 'colorscheme': 'solarized_dark_n9code',
            \ 'active': {
            \   'left': [ 
            \       [ 'mode', 'paste' ],
            \       [ 'fugitive', 'venv',  'readonly', 'filename', 'modified' ]
            \   ],
            \   'right': [
            \       ['lineinfo'],
            \       ['percent'],
            \   ],
            \ },
            \ 'tabline': {
            \   'left': [
            \       ['tabs']
            \   ],
            \   'right': [
            \   ],
            \ },
            \ 'component_function': {
            \   'fugitive': 'LightLineFugitive',
            \   'filename': 'LightLineFilename',
            \   'mode': 'LightLineMode',
            \   'venv': 'LightLineVenv',
            \ },
            \ 'component': {
            \   'readonly': '%{&readonly?"\u2b64":""}',
            \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":""}',
            \ },
            \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
            \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" },
            \ }

function! LightLineFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = ''  " edit here for cool mark
      let _ = fugitive#head()
      return strlen(_) ? "\u2b60 ".mark._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightLineModified()
      return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
  endfunction

  function! LightLineReadonly()
        return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' ? '' :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineMode()
    let fname = expand('%:t')
    return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LightLineVenv()
    if &filetype != 'python'
        return ''
    endif
    try
        let venv = virtualenv#statusline()
    catch
        let venv = ''
    endtry
    return strlen(venv) ? "\u24d4 ".venv : ""
endfunction

" augroup AutoSyntastic
"   autocmd!
"   autocmd BufWritePost,BufReadPost *.py,*.c,*.cpp call s:syntastic()
" augroup END
" function! s:syntastic()
"   SyntasticCheck
"   call lightline#update()
" endfunction

" Jedi-vim Configuration
" TODO: deal with signature suggestion
let g:jedi#show_call_signatures = 0
let g:jedi#use_tabs_not_buffers = 1

map <leader>b <leader>d
function! GotoInSplit()
    let g:jedi#use_tabs_not_buffers = 0
    let g:jedi#use_splits_not_buffers = "winwidth"
    call jedi#goto()
    let g:jedi#use_splits_not_buffers = ""
    let g:jedi#use_tabs_not_buffers = 1
endfunction
map <leader>B :call GotoInSplit()<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1


" Ag configuration
function! g:NNfind(pattern)
    execute "tabnew"
    echom "Searching for ".a:pattern
    execute "Ag! '".a:pattern."' '".g:init_dir."'"
    " TODO: change title to Search Results
endfunction
command! -nargs=* NNFind call g:NNfind('<args>')
noremap <leader>f :NNFind 
noremap <leader>F :NNFind <C-R><C-W><CR>

" augroup QuickFix
"     autocmd!
"     autocmd FileType qf hi Search cterm=NONE ctermfg=NONE ctermbg=NONE
"     autocmd FileType qf hi Cursor ctermfg=8 ctermbg=8
" augroup END


" CtrlP Configuration
let g:ctrlp_show_hidden = 1
let g:ctrlp_open_new_file = 't'
let g:ctrlp_by_filename = 1


let g:ConqueGdb_Leader = '<leader>;'
" Here goes git
"

let g:webdevicons_conceal_nerdtree_brackets = '1'
let g:WebDevIconsUnicodeDecorateFolderNodes = '1'

