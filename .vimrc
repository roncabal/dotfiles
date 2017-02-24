" Syntax
syntax enable        " Enables colored syntax
set number           " Shows line numbers
set relativenumber   " Show numbers relative to your current line
set tabstop=4 	     " Sets the width per tab
set shiftwidth=4     " Sets the number of spaces per tab
set expandtab        " Converts tabs into spaces
set nowrap           " Prevent long codes to wrap
set guifont=*

"set langmap='q,\\,w,.e,pr,yt,fy,gu,ci,ro,lp,/[,=],aa,os,ed,uf,ig,dh,hj,tk,nl,s\\;,-',\\;z,qx,jc,kv,xb,bn,mm,w\\,,v.,z/,[-,]=,\"Q,<W,>E,PR,YT,FY,GU,CI,RO,LP,?{,+},AA,OS,ED,UF,IG,DH,HJ,TK,NL,S:,_\",:Z,QX,JC,KV,XB,BN,MM,W<,V>,Z?

" Color Schemes
colorscheme despacio

" Shows tabs, end of line, etc...
set list
set listchars=eol:¬,tab:>-,trail:·,extends:>,precedes:<

" Use tabs on these projects
autocmd BufRead,BufNewFile,BufEnter ~/Development/office/cyberzone/**/* setlocal noexpandtab

" Use 2 spaces for css, js, and vue
autocmd BufRead,BufNewFile,BufEnter *.css,*.scss,*.js,*.vue setlocal tabstop=2 shiftwidth=2

" Update changed files
set autoread

" Key Remapping
nnoremap <F1> <esc>:source ~/.config/nvim/init.vim<cr>
inoremap <F1> <esc>:source ~/.config/nvim/init.vim<cr>

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

" Twig
Plug 'Glench/Vim-Jinja2-Syntax'

" Emmet
Plug 'mattn/emmet-vim'

" Color Schemes
Plug 'crusoexia/vim-monokai'

" Vue for vim
"Plug 'posva/vim-vue'

" Vim gutter
Plug 'airblade/vim-gitgutter'

call plug#end()

" Ligthline
let g:lightline = {
    \ 'component': {
    \   'readonly': '%{&readonly?"":""}',
    \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
    \ }

" tags
set tags+=.git/tags,.git/tags.vendor,.git/tags.test
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

" Vim-Jinja2
autocmd BufRead,BufNewFile *.html.twig set filetype=jinja
autocmd BufRead,BufNewFile *.twig set filetype=jinja
autocmd BufRead,BufNewFile *.vue set filetype=html
