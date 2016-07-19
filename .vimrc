" Syntax
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

" Remapping
nnoremap <F1> <esc>:source ~/.vimrc<cr>
inoremap <F1> <esc>:source ~/.vimrc<cr>

noremap <C-p> <esc>:FZF<cr>
noremap <C-n> :NERDTreeToggle<CR>
noremap <C-t> :vsplit<CR>

"PHP Expand Class
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

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

Plug 'itchyny/lightline.vim'

Plug 'alvan/vim-closetag'

call plug#end()

" Settings
set tags+=.git/tags,.git/tags.vendor
let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git']
let g:auto_ctags_tags_name = 'tags'
let g:auto_ctags_tags_args = '--tag-relative --recurse --sort=yes --exclude=vendor --exclude=.git --PHP-kinds=+cf --regex-php=/^[ \t]*trait[ \t]+([a-z0_9_]+)/\1/t,traits/i'
let g:deoplete#enable_at_startup = 1

" filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"
