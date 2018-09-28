call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/denite.nvim'
Plug 'sheerun/vim-polyglot'
Plug 'posva/vim-vue'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'jiangmiao/auto-pairs'

Plug 'mechatroner/rainbow_csv'

Plug 'nvie/vim-flake8'

"Plug 'terryma/vim-multiple-cursors'

Plug 'dracula/vim'
Plug 'tomasr/molokai'
Plug 'nanotech/jellybeans.vim'
Plug 'chriskempson/tomorrow-theme'
call plug#end()

" theme
colors dracula
set background=dark

" special sauce
set expandtab
set number
set relativenumber
set cursorline
set cursorcolumn
set list
set sw=2
set ts=2

" python!
let g:python3_host_prog = '/usr/local/bin/python3'

" plugins and crap
let g:deoplete#enable_at_startup = 1

"" lifecycle hooks for mutli cursor plugin
"function g:Multiple_cursors_before()
 "let g:deoplete#disable_auto_complete = 1
"endfunction

"function g:Multiple_cursors_after()
 "let g:deoplete#disable_auto_complete = 0
"endfunction

" use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

"Q: I want to complete the candidates from other files.
   "https://github.com/Shougo/deoplete.nvim/issues/133

"A: You must install |context_filetype| plugin.
   "https://github.com/Shougo/context_filetype.vim
   "And you must set |g:context_filetype#same_filetypes| variabl

"set filetype js sw=2 ts=2
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-j> <C-w>j
map <C-k> <C-w>k

let mapleader=","
nnoremap <leader><space> :noh<enter>
nnoremap <leader>rp :source ~/.vim/vimrc<enter> :PlugInstall<enter>
nnoremap <leader>rc :source ~/.vim/vimrc<enter>

nnoremap <leader>fj :%!python -m json.tool<enter>
"Q: Deoplete does not work with vim-multiple-cursors.

"A: You must disable deoplete when using vim-multiple-cursors. >

       "function g:Multiple_cursors_before()
         "let g:deoplete#disable_auto_complete = 1
       "endfunction
       "function g:Multiple_cursors_after()
         "let g:deoplete#disable_auto_complete = 0
       "endfunction

:nnoremap <silent> <leader>c :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
