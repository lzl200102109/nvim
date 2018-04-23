:set number

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'neovim/python-client'
Plug 'daeyun/vim-matlab', { 'do': function('DoRemote') }
Plug 'marcweber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'vim-scripts/MatlabFilesEdition'
Plug 'vim-scripts/matchit.zip'
Plug 'shougo/deoplete.nvim'
Plug 'bling/vim-airline'

" Initialize plugin system
call plug#end()


" default horizontal split
au VimEnter * split

" NERDTree setup
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeShowBookmarks=1

" python config
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'
autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>
autocmd CompleteDone * pclose " To close preview window of deoplete automagically

" assuming you want to use snipmate snippet engine

"let g:matlab_auto_mappings=1 "automatic mappings enabled
let g:matlab_server_launcher='vim'
let g:matlab_server_split='horizontal'

