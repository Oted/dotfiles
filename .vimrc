set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
:set mouse=nicr

set guifont=Monaco:h14
" their plugins
Plugin 'gmarik/Vundle.vim'

" my plugins
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'Valloric/YouCompleteMe'
Plugin 'kien/ctrlp.vim.git'
Plugin 'elzr/vim-json'
Plugin 'scrooloose/nerdtree.git'
Plugin 'tpope/vim-surround.git'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-fugitive.git'

" Plugin 'wookiehangover/jshint.vim'

autocmd BufWritePre * StripWhitespace

call vundle#end()            " required
filetype plugin indent on    " required

" my settings
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

set shell=/bin/bash
:syntax on
set splitbelow
set number
set smartindent
set ts=2
set tabstop=2
set shiftwidth=2
set sw=2
set expandtab
set backspace=indent,eol,start
set nocursorline
set nocursorcolumn
set lazyredraw

" my mappings
:map <Tab> :NERDTreeToggle<CR>
:map <Space> :call ToggleMaxWins()<CR>
:map <C-X> :call CommentToggle()<CR>

inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

vnoremap . :norm.<CR>

" my script
function! ToggleMaxWins()
  if exists('g:windowMax')
    au! maxCurrWin
    wincmd =
    unlet g:windowMax
  else
    augroup maxCurrWin
        " au BufEnter * wincmd _ | wincmd |
        "
        " only max it vertically
        au! WinEnter * wincmd _
    augroup END
    do maxCurrWin WinEnter
    let g:windowMax=1
  endif
endfunction
nnoremap <Leader>max :call ToggleMaxWins()<CR>

" toggles comments
function! CommentToggle()
    execute ':silent! s/\([^ ]\)/\/\/ \1/'
    execute ':silent! s/^\( *\)\/\/ \/\/ /\1/'
endfunction

colorscheme distinguished
hi Normal ctermbg=none

let NERDTreeShowHidden=1
