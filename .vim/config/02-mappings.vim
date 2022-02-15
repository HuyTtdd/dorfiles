" Tab block of code
vnoremap > >gv
vnoremap < <gv

" <leader>
let g:mapleader=' '

" Select all text
nnoremap <C-a> <C-\><C-N>ggVG<CR>
" Accidently add and dont know how to remove
" nnoremap <C-S-a> <NOP>

" Select & change buffer
nnoremap <space>b :ls<CR>:b<space>

" Tabs controlling
noremap <leader>t :tabnew<CR>
noremap <leader>h gT<CR>
noremap <leader>l gt

" Change split tab
nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>

" System clipboard copy/paste
nnoremap <space>y "+y
nnoremap <space>d "+d
nnoremap <space>p "+p
nnoremap <space>P "+P
vnoremap <space>y "+y
vnoremap <space>d "+d
vnoremap <space>p "+p
vnoremap <space>P "+P
" quickly select text just be pasted
noremap gV `[v`]

" Swapping windows
" vertically split to horizontally
nmap <leader>sj <C-w>t<C-w>K
" horizontally split to vertically
nmap <leader>sl <C-w>t<C-w>H

" Remove hightlight
nnoremap <CR> :noh<CR>

" Saving
nnoremap <space>w :w<CR>

" Resize window
nnoremap <C-down> :resize +5<CR>
nnoremap <C-Up> :vertical resize +5<CR>

" Rename current file
function! RenameFile()
    let old_=expand('%')
    let new_=input('New file name: ', expand('%'), 'file')
    if new_ != '' && new_ != old_
        exec ':saveas ' . new_
        exec ':silent !rm ' . old_
        redraw!
    endif
endfunction
nnoremap <leader>rf :call RenameFile()<CR>

" Show hightlight groups for current word
nmap <C-S-S> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists('*synstack')
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction

" Nvim's terminal
" navigate windows from any mode
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
