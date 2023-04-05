set number
syntax on
filetype plugin indent on
set tabstop=4
set softtabstop=4
set autoindent
set encoding=utf-8
set expandtab

" set cursorline
set cursorline

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" reset the cursor on start (for older versions of vim, usually not required)
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

call plug#begin()

" Plugins
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'puremourning/vimspector'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Themes
Plug 'cocopon/iceberg.vim'
Plug 'xero/sourcerer.vim'
Plug 'kamwitsta/nordisk'

call plug#end()

" Colorscheme
colorscheme nordisk


" Key mappings
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" there's way more, see `:help coc-key-mappings@en'


" COMPLETION
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
                let col = col('.') - 1
                return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
                                                \ coc#pum#visible() ? coc#pum#next(1) :
                                                \ CheckBackspace() ? "\<Tab>" :
                                                \ coc#refresh()

" use <c-space> for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
" Use <C-@> on vim
inoremap <silent><expr> <c-@> coc#refresh()

inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
" COMPLETION END


" LeaderF configuration
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
nnoremap <silent> <leader>ff :<C-U>Leaderf file<CR>
