 let g:coc_global_extensions=[
    \ 'coc-snippets',
    \ 'coc-pairs',
    \ 'coc-json',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-pyright',
    \ 'coc-vimlsp',
    \ 'coc-highlight',
    \ 'coc-emmet'
    \ ]
let g:python3_host_prog='/usr/bin/python3'

" jumping in snippets
let g:coc_snippet_next='<C-j>'
let g:coc_snippet_prev='<C-k>'

" <TAB> for trigger completion
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" <CR> for trigger completion with format on type
inoremap <silent><expr> <CR>
    \ pumvisible() ? coc#_select_confirm() :
    \ "\<C-g>u\<CR>\<C-r>=coc#on_enter()\<CR>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" goto
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" let g:NERDTreeGitStatusConcealBrackets = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'M',
                \ 'Staged'    :'S',
                \ 'Untracked' :'U',
                \ 'Renamed'   :'Rn',
                \ 'Unmerged'  :'uM',
                \ 'Deleted'   :'D',
                \ 'Dirty'     :'d',
                \ 'Ignored'   :'I',
                \ 'Clean'     :'Cl',
                \ 'Unknown'   :'?',
                \ }

let g:NERDTreeMinimalUI=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeDirArrowExpandable='+'
let g:NERDTreeDirArrowCollapsible='-'

" find
map <C-f> :NERDTreeFind<CR>

" toggle NERDTree
map <silent> <C-b> :NERDTreeToggle<CR> :NERDTreeMirror<CR>

" Ignore
let g:NERDTreeIgnore=['^node_modules$', '^.git$', '\.swp$', '\.bak$', '\.pyc$', '^__pycache__']

" close vim if there's only NERDTree
autocmd Bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" automatically open NERDTree when vim starts up on a opening dir
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" auto refresh
function! NERDTreeRefresh()
    if &filetype == "nerdtree"
        silent exe substitute(mapcheck("R"), "<CR>", "", "")
    endif
endfunction
autocmd BufEnter * call NERDTreeRefresh()

" add spaces after comment delimeters
let g:NERDSpaceDelims=1

" multi-line comments
let g:NERDCompactSexyComs=1
let g:NERDDefaultAlign="left"
let g:NERDCustomDelimiters={'c': {'left':'//'}, 'python':{'left': '#'}}
vmap <C-_> <Plug>NERDCommenterToggle
nmap <C-_> <Plug>NERDCommenterToggle

" GitGutter
let g:gitgutter_map_keys=0
nmap <leader>gp <Plug>(GitGutterPreviewhunk)
nmap <leader>gs <Plug>(GitGutterStageHunk)
nmap <leader>gu <Plug>(GitGutterUndoHunk)

" fzf
nnoremap <silent> <C-p> :FZF<CR>

" Formatter
" let g:neoformat_basic_format_trim = 1
augroup fmt
    autocmd!
    " autocmd bufWritePre * undojoin | Neoformat
    au BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
augroup END

" lightline
let g:lightline = {
    \ 'colorscheme': 'mytheme'
  \ }

" Tmux and vim navigate
let g:tmux_navigator_no_mappings=1
nnoremap <silent> <A-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <A-l> :TmuxNavigateRight<CR>
nnoremap <silent> <A-j> :TmuxNavigateDown<CR>
nnoremap <silent> <A-k> :TmuxNavigateUp<CR>
nnoremap <silent> <A-\> :TmuxNavigatePrevious<CR>
inoremap <silent> <A-h> <C-\><C-N>:TmuxNavigateLeft<CR>
inoremap <silent> <A-l> <C-\><C-N>:TmuxNavigateRight<CR>
inoremap <silent> <A-j> <C-\><C-N>:TmuxNavigateDown<CR>
inoremap <silent> <A-k> <C-\><C-N>:TmuxNavigateUp<CR>
inoremap <silent> <A-\> <C-\><C-N>:TmuxNavigatePrevious<CR>
