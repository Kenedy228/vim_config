set nocompatible
set number
set encoding=utf-8
set hidden
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes
filetype indent plugin on
syntax enable

call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'hail2u/vim-css3-syntax'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'w0rp/ale'
Plug 'omnisharp/omnisharp-vim'
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'matze/vim-move'

call plug#end()

colorscheme gruvbox

let mapleader = " "

"config for buffers
nnoremap <leader>sh :split<CR>
nnoremap <leader>sv :vsplit<CR>

"config for tabs
nnoremap <leader>to :tabnew<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tp :tabprevious<CR>

"config for coc.nvim
inoremap <silent><expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
inoremap <silent><expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"

nnoremap <silent> K :call ShowDocumentation()<CR>
  " Show hover when provider exists, fallback to vim's builtin behavior.
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('definitionHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

inoremap <silent><expr> <C-e> coc#pum#visible() ? coc#pum#cancel() : "\<C-e>"
inoremap <silent><expr> <tab> coc#pum#visible() ? coc#pum#confirm() : "\<tab>"

let g:ale_fixers = ['prettier', 'eslint', 'gofmt', 'pgformatter']
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1

" OmniSharp: {{{
let g:OmniSharp_popup_position = 'peek'
if has('nvim')
  let g:OmniSharp_popup_options = {
  \ 'winblend': 30,
  \ 'winhl': 'Normal:Normal,FloatBorder:ModeMsg',
  \ 'border': 'rounded'
  \}
else
  let g:OmniSharp_popup_options = {
  \ 'highlight': 'Normal',
  \ 'padding': [0],
  \ 'border': [1],
  \ 'borderchars': ['─', '│', '─', '│', '╭', '╮', '╯', '╰'],
  \ 'borderhighlight': ['ModeMsg']
  \}
endif
let g:OmniSharp_popup_mappings = {
\ 'sigNext': '<C-n>',
\ 'sigPrev': '<C-p>',
\ 'pageDown': ['<C-f>', '<PageDown>'],
\ 'pageUp': ['<C-b>', '<PageUp>']
\}

let g:OmniSharp_highlight_groups = {
\ 'ExcludedCode': 'NonText'
\}
" }}}

" NerdTree config
nnoremap <leader>ee :NERDTreeToggle<CR>
nnoremap <leader>ef :NERDTreeFind<CR>

"Emmet config 
let g:user_emmet_leader_key=','

"AutoCloseTag config
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

"Move lines config
let g:move_map_keys = 0

vmap <C-j> MoveBlockDown
vmap <C-k> MoveBlockUp
