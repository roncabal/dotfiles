" Syntax
syntax enable        " Enables colored syntax
set number           " Shows line numbers
set relativenumber   " Show numbers relative to your current line
set tabstop=4 	     " Sets the width per tab
set shiftwidth=4     " Sets the number of spaces per tab
set expandtab        " Converts tabs into spaces
set nowrap           " Prevent long codes to wrap

" Tabs for html
autocmd FileType html setlocal shiftwidth=2 tabstop=2 noexpandtab

" Shows tabs, end of line, etc...
set list
set listchars=eol:¬,tab:>-,trail:·,extends:>,precedes:<

" Update changed files
set autoread

" Key Remapping
nnoremap <F1> <esc>:source ~/.vimrc<cr>
inoremap <F1> <esc>:source ~/.vimrc<cr>

noremap <C-p> <esc>:FZF<cr>
noremap <C-n> :NERDTreeToggle<CR>
noremap <F2> <esc>:vsplit<CR>
noremap <F3> <esc>:split<CR>
noremap <F4> <esc>:tabe<CR>

"PHP Expand Class
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction

" Auto use class for php
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>
autocmd FileType php inoremap <Leader>e :call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>

" I dont know what this does, but I need this
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" Plugins Installation
call plug#begin('~/.vim/plugged')

" Group dependencies, vim-snippets depends on ultisnips
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Commenter
Plug 'scrooloose/nerdcommenter'

" File Explorer
Plug 'scrooloose/nerdtree'

" Just an awesome plugin
Plug 'tpope/vim-surround'

" Namespacing
Plug 'arnaud-lb/vim-php-namespace'

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

" Vim bar
Plug 'itchyny/lightline.vim'

call plug#end()

" tags
set tags+=.git/tags,.git/tags.vendor
let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git']
let g:auto_ctags_tags_name = 'tags'
let g:auto_ctags_tags_args = '--tag-relative --recurse --sort=yes --exclude=vendor --exclude=.git --PHP-kinds=+cf --regex-php=/^[ \t]*trait[ \t]+([a-z0_9_]+)/\1/t,traits/i'
let g:deoplete#enable_at_startup = 1

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
