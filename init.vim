," .neovimrc
let mapleader = ","
let maplocalleader = "\\"

" Plug ~
call plug#begin('~/.vim/plugged')
" Language

Plug 'vim-scripts/true-monochrome'
Plug 'owickstrom/vim-colors-paramount'
Plug 'fatih/vim-go'
Plug 'tpope/vim-rails'
Plug 'mattn/emmet-vim'
Plug 'Valloric/MatchTagAlways'
Plug 'Shutnik/jshint2.vim'
Plug 'pangloss/vim-javascript'
Plug 'neoclide/vim-jsx-improve'
Plug 'posva/vim-vue'
Plug 'mxw/vim-jsx'
Plug 'hail2u/vim-css3-syntax'
Plug 'leafgarland/typescript-vim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown'] }

" Color
Plug 'rakr/vim-one'
Plug 'pgdouyon/vim-yin-yang'
Plug 'ewilazarus/preto'
Plug 'robertmeta/nofrils'
Plug 'vim-scripts/Black-Angus'

" Function
Plug 'vimwiki/vimwiki'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-vinegar'
Plug 'Raimondi/delimitMate'
Plug 'w0rp/ale'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
Plug 'mhinz/vim-grepper'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-obsession'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

call plug#end()


" Functionality Settings ~
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartcase
set ignorecase
set linebreak
set breakindent
set breakindentopt=shift:2
set splitbelow
set splitright
inoremap {<CR> {<CR>}<Esc>O

set undofile
set undodir=/Users/zac/.local/share/nvim/undo
augroup vimrc
    " Files for which to NOT produce undo file
    autocmd BufWritePre /tmp/* setlocal noundofile 
augroup END

set foldmethod=syntax
highlight Folded guibg=grey guifg=blue
nnoremap <space> :
nnoremap S :w<cr>
set foldlevel=20
set nofixendofline
let loaded_matchparen = 1

" Display Settings ~
syntax on
" syntax enable
set number
set ruler
set hlsearch
set showmatch
set matchtime=2
set cursorline
set relativenumber

set background=dark
" colorscheme true-monochrome

" colorscheme nofrils-light
" colorscheme nofrils-dark
" colorscheme nofrils-acme
" colorscheme eink
colorscheme one
" colorscheme black_angus
" colorscheme yin
set termguicolors

" Key Remapings ~
imap jk <Esc>
if has('nvim')
    tnoremap jk <C-\><C-n>
    tnoremap <Esc> <Esc>
endif

" Custom Commands ~
command Gotime execute "cd ~/go/src/github.com/zkry"
nnoremap <Leader>ev :vsplit $MYVIMRC<cr>
nnoremap <Leader>/ :set hlsearch!<cr>
nnoremap <leader>k <C-^>
nmap  S  :%s//g<LEFT><LEFT>

" fzf-vim
nnoremap <C-p> :GFiles<cr>
nnoremap g<C-o> :GFiles?<cr>
nnoremap g<C-p> :Files<cr>
nnoremap <C-m> :Marks<cr>
nnoremap <C-h> :History<cr>
nnoremap <C-c> :History:<cr>

nmap <silent> <UP>            :prev<CR>
nmap <silent> <DOWN>          :next<CR>
nmap <silent> <LEFT>          :cprev<CR>
nmap <silent> <RIGHT>         :cnext<CR>
" nnoremap <C-/> :History/<cr> doesn't work

" deoplete
let g:deoplete#enable_at_startup = 1

" ale
let g:ale_linters = {
            \   'javascript': ['jshint'],
            \   'html': ['htmlhint'],
            \}

nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)
" autocmd bufwritepost *.js silent !standard --fix %
" set autoread

" let g:ale_sign_column_always = 1

" Dispatcher
let g:dispatch_compilers={}
let g:dispatch_compilers['npm run lint']='tslint'

" Grepper
let g:grepper = {}
let g:grepper.tools = ['ag', 'grep', 'git', 'rg']
nnoremap <Leader>* :Grepper -cword -noprompt<CR>
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
nnoremap <Leader>g :Grepper -tool ag<CR>

" vim-test
"let test#strategy = "dispatch"
"

" ~~~~~~~~~~~~~~~~~~~~~~ Language Specific Code ~~~~~~~~~~~~~~~~~~~~~~
" Golang ~~~~~~~~~~~~~~~~~~~~~~{{{
iabbrev :: :=
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
let g:go_list_type = "quickfix"

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction


let g:go_fmt_command = "goimports"
" let g:go_highlight_types = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_extra_types = 1
" let g:go_highlight_build_constraints = 1
" let g:go_highlight_generate_tags = 1

augroup gogroup
    autocmd!
    autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
    autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
    autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
    autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
    autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
    autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
    autocmd FileType go nmap <leader>t <Plug>(go-test)
    " autocmd FileType go nmap <leader>r :vsplit | terminal go run *.go<CR>
    autocmd FileType go nmap <leader>r <Plug>(go-run)
    autocmd FileType go nmap <leader>i <Plug>(go-info)
    autocmd FileType go nmap <leader>i <Plug>(go-info)
    autocmd FileType go nmap <leader>s :GoSameIdsAutoToggle<CR>
    autocmd FileType go nmap <leader>s :set noshowmatch<CR>
    " autocmd BufEnter *.go colorscheme yin

    " autocmd FileType go nnoremap <C-o> :GoDecls<CR>
    " autocmd FileType go nnoremap g<C-o> :GoDeclsDir<CR>
augroup END

" let g:go_auto_sameids = 1
let g:go_auto_type_info = 1 " Audo update info based on cursor
" }}} Golang end

" Web ~~~~~~~~~~~~~~~~~~~~~~{{{
set runtimepath+=~/.vim/bundle/jshint2.vim/
augroup htmlgroup
    autocmd!
    autocmd FileType html setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType html setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType vue setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType vue setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
augroup END
" }}} Web end

" Ruby ~~~~~~~~~~~~~~~~~~~~~{{{
augroup rubygroup
    autocmd!
    autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
augroup END
" }}} Ruby end

" Javascript ~~~~~~~~~~~~~~~~~~~~~~{{{
augroup javascript
  autocmd!
  autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
  autocmd FileType javascript nmap <leader>r :!open index.html<CR>
  autocmd FileType javascript nnoremap ]] /^\W\+\w*(.*)*\W*{<CR>
  autocmd FileType html nmap <leader>r :!open index.html<CR>
augroup END
" }}} Javascript end

" Haml ~~~~~~~~~~~~~~~~~~~~~~{{{
augroup haml
    autocmd!
    autocmd FileType haml setlocal cursorcolumn
augroup END
" }}} Haml end

" Abbreviations:
iabbrev styel style

" Custom Functions
" Highlight a column in csv text.
" :Csv 1    " highlight first column
" :Csv 12   " highlight twelfth column
" :Csv 0    " switch off highlight
function! CSVH(colnr)
  if a:colnr > 1
    let n = a:colnr - 1
    execute 'match Keyword /^\([^,]*,\)\{'.n.'}\zs[^,]*/'
    execute 'normal! 0'.n.'f,'
  elseif a:colnr == 1
    match Keyword /^[^,]*/
    normal! 0
  else
    match
  endif
endfunction
command! -nargs=1 Csv :call CSVH(<args>)
