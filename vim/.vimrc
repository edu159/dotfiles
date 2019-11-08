set nocompatible    " use vim defaults
set noerrorbells
set vb t_vb=
set number          " show line numbers
set tags=tags;$HOME/.vim/tags/ "recursively searches directory for 'tags' file
set tabstop=4      " numbers of spaces of tab character
set shiftwidth=4    " numbers of spaces to (auto)indent
set expandtab
set showcmd         " display incomplete commands
set incsearch       " do incremental searching
set ai
set ruler           " show the cursor position all the time
set numberwidth=4   " line numbering takes up 5 spaces
set ignorecase      " ignore case when searching
set nowrap          " stop lines from wrapping
set t_Co=256
command Sd SyntasticToggleMode
set encoding=utf-8

" Mappings
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Vim-plug section
call plug#begin()
Plug 'scrooloose/syntastic'
Plug 'nvie/vim-flake8'
Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'edkolev/tmuxline.vim'
Plug  'mattn/calendar-vim'
Plug 'vimwiki/vimwiki'
call plug#end()
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tmuxline#enabled = 0
let g:airline_theme='bubblegum'
let g:airline_symbols = get(g:, 'airline_symbols', {})
let g:airline_symbols.space = " "

" set background=dark

" Syntastic options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" if &term =~ '256color'
"   " disable Background Color Erase (BCE) so that color schemes
"   " render properly when inside 256-color tmux and GNU screen.
"   " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
"   set t_ut=
" endif
"
filetype plugin indent on " turn on the indent plugins
filetype plugin on " turn on the indent plugins
syntax on                 " syntax highlighing
"colorscheme wombat256
colorscheme molokai

"-------NERDtree configuration--------------------
let NERDTreeShowBookmarks=1
let NERDTreeHightlightCursorline=1
map <F2> :NERDTreeToggle<cr> 
"autocmd vimenter * NERDTree
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction
"-------------------------------------------------
" Omnicompletion functions
set omnifunc=syntaxcomplete#Complete
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
"Fix SpellBad
highlight SpellBad term=reverse ctermbg=1

"Move through buffers easily
let mapleader = ","
map <leader>n :bn<cr>
map <leader>b :bp<cr>
map <leader>d :bd<cr>

" vimwiki/vimwiki
let g:vimwiki_list = [{'path': '~/.vimwiki/personal.wiki', 'syntax': 'markdown', 'ext': '.md', 'auto_tags': 1},
                     \{'path': '~/.vimwiki/arch-linux.wiki', 'syntax': 'markdown', 'ext': '.md', 'auto_tags': 1}]
let g:vimwiki_global_ext = 0
map <leader>tt <Plug>VimwikiToggleListItem
" au BufRead,BufNewFile *.md filetype=markdown
" :autocmd FileType vimwiki map d :VimwikiMakeDiaryNote
function! ToggleCalendar()
  execute ":Calendar"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction
:autocmd FileType markdown map c :call ToggleCalendar()
