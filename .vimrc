" Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
  " Features
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-fugitive'
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'janko/vim-test'
  Plug 'psliwka/vim-smoothie'
  " Plug 'ludovicchabant/vim-gutentags'

  " Linter & language server
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'w0rp/ale'
  Plug 'tpope/vim-endwise', { 'for': 'ruby' }

  " Visual
  Plug 'ap/vim-buftabline'
  Plug 'itchyny/lightline.vim'
  " Plug 'morhetz/gruvbox'
  Plug 'joshdick/onedark.vim'
  " Plug 'airblade/vim-gitgutter'

  " Languages
  Plug 'sheerun/vim-polyglot'
  " Plug 'LokiChaos/vim-tintin'
  " Plug 'rupurt/vim-mql5'
call plug#end()

" Theme
set background=dark
" colorscheme gruvbox
colorscheme onedark

if (empty($TMUX))
  if (has("nvim")) | let $NVIM_TUI_ENABLE_TRUE_COLOR=1 | endif
  if (has("termguicolors")) | set termguicolors | endif
endif

" Settings
set number relativenumber
set hidden
set nobackup nowritebackup noswapfile
set history=50
set noshowcmd
set tabstop=2 shiftwidth=2 shiftround expandtab
set list listchars=tab:»·,trail:·,nbsp:·
set nojoinspaces
set inccommand=nosplit
set clipboard+=unnamed
set scrolloff=5

" Key-bindings
let mapleader = "\<Space>"
nnoremap <silent> <Leader>w <Esc>:w<CR>
nnoremap <silent> <Leader><Leader> :noh<CR>
nnoremap <silent> <Tab> :bnext<CR>
nnoremap <silent> <S-Tab> :bprev<CR>
nnoremap <silent> <Leader>d :bdelete<CR>
nnoremap <silent> <Leader>r :source $MYVIMRC<CR>:echo "Reloaded ~/.vimrc"<CR>
nnoremap <silent> <Leader>b :echoe "Use Shift+TAB"<CR>
nnoremap <silent> <Leader>n :echoe "Use TAB"<CR>
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
command! -bang -nargs=* Ag Rg <args>
nnoremap <silent> <Leader>i :set fileencoding=iso-8859-1<CR>:w<CR>
autocmd BufWritePre * %s/\s\+$//e

" lighline.vim
let g:lightline = { 'colorscheme': 'onedark' }

" test.vim
nnoremap <silent> <leader>t :TestNearest<CR>
nnoremap <silent> <Leader>s :TestFile<CR>
nnoremap <silent> <Leader><S-s> :TestSuite<CR>
let test#strategy = "neovim"
let test#ruby#rspec#options = '--format p --no-profile'
let test#ruby#bundle_exec = 1
let test#ruby#use_spring_binstub = 0
let test#ruby#use_binstubs = 0

" deoplete.vim
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#auto_complete_delay = 100
" let g:deoplete#max_list = 15
" inoremap <silent><expr> <Tab>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ deoplete#manual_complete()

" fzf.vim
nnoremap <silent> <Leader>p :call fzf#vim#files('.', {'options': '--prompt ""'})<CR>
" let $FZF_DEFAULT_OPTS=' --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse  --margin=1,4'
" let g:fzf_layout = { 'window': 'call FloatingFZF()' }
" function! FloatingFZF()
"   let buf = nvim_create_buf(v:false, v:true)
"   call setbufvar(buf, '&signcolumn', 'no')

"   let height = float2nr(10)
"   let width = float2nr(80)
"   let horizontal = float2nr((&columns - width) / 2)
"   let vertical = 1

"   let opts = {
"         \ 'relative': 'editor',
"         \ 'row': vertical,
"         \ 'col': horizontal,
"         \ 'width': width,
"         \ 'height': height,
"         \ 'style': 'minimal'
"         \ }

"   call nvim_open_win(buf, v:true, opts)
" endfunction

" coc.vim
let g:coc_global_extensions = ['coc-solargraph']
nnoremap <silent> <leader>f :CocList symbols<CR>
nnoremap <silent> <C-]> :call CocAction('jumpDefinition', 'edit')<CR>
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" gitgutter
" let g:gitgutter_map_keys = 0

" ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_sign_error = '🔴'
let g:ale_sign_warning = '🔔'
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_ruby_reek_executable = 'bundle'
