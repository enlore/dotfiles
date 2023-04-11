"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugins
"
call plug#begin()
  " util
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/vim-easy-align'
  Plug 'windwp/nvim-autopairs'
  Plug 'tommcdo/vim-exchange'

  " dx
  Plug 'nvim-lualine/lualine.nvim'
  " provides icons in statusline
  Plug 'kyazdani42/nvim-web-devicons'

  " themes
  Plug 'wadackel/vim-dogrun'
  Plug 'ajmwagar/vim-deus'
  Plug 'preservim/nerdcommenter'
  Plug 'ayu-theme/ayu-vim'
  Plug 'danilo-augusto/vim-afterglow'

  " lsp stuff
  Plug 'williamboman/mason.nvim'

  " autocomplete
  " main one
  "Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
  " 9000+ Snippets
  "Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SYNTAX ENGINE BUG
" - broken vim script highlighting when using lua heredocs
" - used curl command below to revert lua syntax file to an older version that
"   doesn't trigger the bug
" - until this issue solved: https://github.com/neovim/neovim/issues/20456
"
" !curl -sS https://raw.githubusercontent.com/neovim/neovim/v0.7.2/runtime/syntax/lua.vim > $VIMRUNTIME/syntax/lua.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto close brackets
"
lua << EOF
require("nvim-autopairs").setup {}
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colors
"
set background=dark
set termguicolors
colorscheme deus

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" formatting
"
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nu
set relativenumber
set colorcolumn=80
set cursorcolumn
set nowrap
" trying this out, may need for coc
set signcolumn=yes

" loudly highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" handy mappings and settings tweaks
"
let mapleader=","

" do this instead of opening splits above and left
" nice post: https://thoughtbot.com/blog/vim-splits-move-faster-and-more-naturally
set splitbelow
set splitright

" clear highlighted search hits
nnoremap <leader><space> <esc>:noh<CR>

" source this config file with shift-s
nnoremap <leader><s-s> :source ~/.config/nvim/init.vim<CR>

" PlugInstall with shift-p
nnoremap <leader><s-p> :PlugInstall<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Use ctrl-[hjkl] to select the active pane
nmap <silent> <c-k> <c-w><c-k>
nmap <silent> <c-j> <c-w><c-j>
nmap <silent> <c-l> <c-w><c-l>
nmap <silent> <c-h> <c-w><c-h>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" autocomplete config
""
""let g:coq_settings = { 'auto_start': v:true } " use this line to debug
"let g:coq_settings = { 'auto_start': 'shut-up' }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lualine and native status line related things
"
"
" don't show the search count in the native status line
set shortmess=S

lua << END
require('lualine').setup {
    sections = {
        lualine_y = {'searchcount', 'progress'}
    }
}
END

