set nocompatible              " be iMproved, required
filetype plugin indent on     

" Disable annoying beeping
set belloff=all

set nocompatible
set autoindent
set cindent
" searching ignoring case
set ignorecase


set cursorcolumn

set clipboard=unnamed
set mouse=a

set cmdheight=2

set backspace=indent,eol,start

"--------------------------------------------Plugin 시작

call plug#begin()

" basic plugin
Plug 'blueyed/vim-diminactive' "화면 분할 시 background color 변경
Plug 'koron/nyancat-vim'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree' 
Plug 'preservim/tagbar'
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'tribela/vim-transparent'
" coc plugin
Plug 'haya14busa/vim-asterisk'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'nvie/vim-flake8' " python 문법 검사
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'puremourning/vimspector'


Plug 'joe-skb7/cscope-maps'
Plug 'voldikss/vim-floaterm'


Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'

Plug 'SirVer/ultisnips'

Plug 'azabiong/vim-highlighter'

Plug 'sheerun/vim-polyglot'


call plug#end()

"---------------------------------------------Plugin 종료

"--------------------------------------------- vim 기본 설정

" ultisnips
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = ['UltiSnips']

try
	colorscheme dracula
catch /^Vim\%((\a\+)\)\=:E185/
	" deal with it
endtry



let g:floaterm_width= get(g:, 'floaterm_width', 0.9)
let g:floaterm_height= get(g:, 'floaterm_height', 0.9)

let mapleader=","
" line number
set number relativenumber
set nu rnu

syntax on           "구문 강조
set t_Co=256        "구문강조 색 변경
set encoding=utf-8
set nu              "Line 출력
set cursorline      "현재 줄 강조
set ruler
set laststatus=2    "두줄로 표시
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\  "현재 라인 위치 출력
set wildmenu

set ts=4
set sw=4
set sts=4

" set showcmd
set showcmd
"-------------------------------------------- vim 기본 설정 끝


" ------------------------------------------------- mapping  시작
"



" open rc
nmap <Leader>rc :rightbelow vnew $MYVIMRC<CR>



" nerdtre setting
nmap <C-F> :NERDTreeFind<CR>
nmap <Leader>nerd :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

nnoremap   <silent>   <s-h>   :FloatermToggle<CR>
tnoremap   <silent>   <s-h>   <C-\><C-n>:FloatermToggle<CR>

vnoremap <S-Q> <Nop>
nnoremap <S-Q> <Nop>

" coc setting
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


let g:UltiSnipsExpandTrigger = "<nop>"

" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()



" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

:
" open fzf
nmap <C-P> :Files<CR>




function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter /* call LoadCscope()
" set asterick
map *   <Plug>(asterisk-*)

" highlight
augroup MyHighlight
  autocmd!
  autocmd BufNewFile,BufRead * highlight an1 ctermfg=233 ctermbg=147
  autocmd BufNewFile,BufRead * syntax match an1 /\v\/\/ A:.*$/
augroup END


nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tn  :tabnew<CR>
