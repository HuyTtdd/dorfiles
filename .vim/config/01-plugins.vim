let vim_plug_just_installed=0
let vim_plug_path=expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_path)
	echo 'Installing Vim-plug...'
	let vim_plug_just_installed=1
endif

if vim_plug_just_installed
	:execute 'source '.fnameescape(vim_plug_path)
endif

call plug#begin('~/.vim/plugged')

" Color Scheme
Plug 'morhetz/gruvbox'
Plug 'crusoexia/vim-monokai'

" Syntax highlight
" Plug 'sheerun/vim-polyglot', {'for': ['c', 'html', 'php', 'javascipt']}

" Latex
Plug 'lervag/vimtex'

" Indent line
Plug 'yggdroot/indentline', {'for': ['c', 'java', 'html', 'php', 'javascipt']}

" Statusline
Plug 'itchyny/lightline.vim'

" Formatter
Plug 'sbdchd/neoformat'

" Code complete
Plug 'neoclide/coc.nvim', {'branch':'release'}

" Search engine
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" File tree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Commenter
Plug 'scrooloose/nerdcommenter'

" Gutter
Plug 'airblade/vim-gitgutter'

" Surround
Plug 'tpope/vim-surround'

" Scope highlight
Plug 'justinmk/vim-matchparenalways'

" Python pep8
Plug 'hynek/vim-python-pep8-indent'

" Tmux and vim navigate
Plug 'christoomey/vim-tmux-navigator'

" PDF
Plug 'makerj/vim-pdf'


call plug#end()
