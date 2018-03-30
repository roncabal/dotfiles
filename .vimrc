" Syntax
syntax enable        " Enables colored syntax
set number           " Shows line numbers
set relativenumber   " Show numbers relative to your current line
set tabstop=4        " Sets the width per tab
set shiftwidth=4     " Sets the number of spaces per tab
set expandtab        " Converts tabs into spaces
set nowrap           " Prevent long codes to wrap
set guifont=*
set t_8f=^[[38;2;%lu;%lu;%lum  " Needed in tmux
set t_8b=^[[48;2;%lu;%lu;%lum  " Ditto

"set langmap='q,\\,w,.e,pr,yt,fy,gu,ci,ro,lp,/[,=],aa,os,ed,uf,ig,dh,hj,tk,nl,s\\;,-',\\;z,qx,jc,kv,xb,bn,mm,w\\,,v.,z/,[-,]=,\"Q,<W,>E,PR,YT,FY,GU,CI,RO,LP,?{,+},AA,OS,ED,UF,IG,DH,HJ,TK,NL,S:,_\",:Z,QX,JC,KV,XB,BN,MM,W<,V>,Z?

if (empty($TMUX) && has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
    set termguicolors
endif

" Color Schemes
set background=dark
colorscheme two-firewatch

" Shows tabs, end of line, etc...
set list
set listchars=tab:>-,trail:·,extends:>,precedes:<
"set listchars=eol:¬,tab:>-,trail:·,extends:>,precedes:<

" Use tabs on these projects
"autocmd BufRead,BufNewFile,BufEnter ~/Development/web/wordpress/**/* setlocal noexpandtab

" Use 2 spaces for css, js, and vue
autocmd BufRead,BufNewFile,BufEnter *.css,*.scss,*.js,*.vue setlocal tabstop=2 shiftwidth=2

" Update changed files
set autoread

" Key Remapping
nnoremap <F1> <esc>:source ~/.config/nvim/init.vim<cr>
inoremap <F1> <esc>:source ~/.config/nvim/init.vim<cr>

noremap <C-p> <esc>:FZF<cr>
noremap <C-n> :NERDTreeToggle<CR>

noremap <C-\> :vsplit<CR>

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

" Vue for vim
"Plug 'posva/vim-vue'

" Syntastic
Plug 'vim-syntastic/syntastic'

" Vim gutter
Plug 'airblade/vim-gitgutter'

call plug#end()

" Ligthline
let g:lightline = {
    \ 'colorscheme': 'twofirewatch',
    \ 'component': {
    \   'readonly': '%{&readonly?"":""}',
    \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
    \ }

" tags
:set tags+=.git/tags,.git/tags.vendor,.git/tags.test
:let g:auto_ctags = 1
:let g:auto_ctags_directory_list = ['.git']
:let g:auto_ctags_tags_name = 'tags'
:let g:auto_ctags_tags_args = '--tag-relative --recurse --sort=yes --exclude=vendor --exclude=.git --PHP-kinds=+cf --regex-php=/^[ \t]*trait[ \t]+([a-z0_9_]+)/\1/t,traits/i'
:let g:deoplete#enable_at_startup = 1

function! ICustomTags()
    :set tags+=.tags/tags,.tags/tags.vendor,.tags/tags.test
    :let g:auto_ctags = 1
    :let g:auto_ctags_directory_list = ['.tags']
    :let g:auto_ctags_tags_name = 'tags'
    :let g:auto_ctags_tags_args = '--tag-relative --recurse --sort=yes --exclude=vendor --exclude=.git --PHP-kinds=+cf --regex-php=/^[ \t]*trait[ \t]+([a-z0_9_]+)/\1/t,traits/i'
    :let g:deoplete#enable_at_startup = 1
endfunction

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-9>"
let g:UltiSnipsJumpBackwardTrigger="<c-0>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Vim-Jinja2
autocmd BufRead,BufNewFile *.html.twig set filetype=jinja
autocmd BufRead,BufNewFile *.twig set filetype=jinja
autocmd BufRead,BufNewFile *.vue set filetype=html

"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_checkers=['']
