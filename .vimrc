syntax enable
set number
set relativenumber
set tabstop=4 	     " Sets the width per tab
set shiftwidth=4     " Sets the number of spaces per tab
set expandtab        "  Converts tabs into spaces
set nowrap
set list
set listchars=eol:¬,tab:>-,trail:·,extends:>,precedes:<

set clipboard=unnamed

nnoremap <F1> <esc>:source ~/.vimrc<cr>
inoremap <F1> <esc>:source ~/.vimrc<cr>

noremap <C-p> <esc>:FZF<cr>
noremap <C-n> :NERDTreeToggle<CR>

"PHP Expand Class
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

call plug#begin('~/.vim/plugged')

" Group dependencies, vim-snippets depends on ultisnips
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'scrooloose/nerdcommenter'

Plug 'scrooloose/nerdtree'

Plug 'tpope/vim-surround'

Plug 'arnaud-lb/vim-php-namespace'

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

let g:deoplete#enable_at_startup = 1

Plug 'itchyny/lightline.vim'


call plug#end()

set tags+=.git/tags,.git/tags.vendor
let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git']
let g:auto_ctags_tags_name = 'tags'
let g:auto_ctags_tags_args = '--tag-relative --recurse --sort=yes --exclude=vendor --exclude=.git --PHP-kinds=+cf --regex-php=/^[ \t]*trait[ \t]+([a-z0_9_]+)/\1/t,traits/i'
