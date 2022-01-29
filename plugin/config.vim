set nu
set relativenumber
set lazyredraw
set wildmenu
set lazyredraw
set wildmenu
set laststatus=2
set showtabline=2
set encoding=utf8
set fileencodings=ucs-bom,utf8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set hlsearch 
set incsearch
set showmatch 
set ignorecase
set viminfo='20,\"50000
set timeoutlen=1000
set ttimeoutlen=10
set updatetime=0
set clipboard^=unnamed,unnamedplus
set t_Co=256
set fillchars=stl:\ 
set backspace=indent,eol,start
set foldcolumn=1
"set signcolumn=number
set numberwidth=1
set scrolloff=6
set undofile

colorscheme torte

aug QFClose
au!
au WinEnter * if winnr('$') == 1 && &buftype == "quickfix"|q|endif
aug END


execute ":command! Config :e " g:plug_home.'/vim-config/plugin/config.vim'
execute ":command! InitConfig :e $HOME/.config/nvim/init.vim"
execute ":command! ReloadConfig :e source "g:plug_home.'/vim-config/plugin/config.vim'


let mapleader=","

noremap <C-S> :w<CR>

noremap <F5> :make<CR>
inoremap <F5> <ESC>:make<CR>

nnoremap <Leader>C :set cursorline! cursorcolumn!<CR>
set cursorline
set mouse=a

"noremap <C-S-W> :w !sudo tee %<CR>

tnoremap <C-h> <C-\><C-n>

nnoremap <space> za

highlight LineNr term=bold cterm=NONE ctermfg=blue ctermbg=NONE gui=NONE guifg=red guibg=NONE

" 切换输入模式
noremap <F4> :call ToggleInput()<CR>
inoremap <F4> <ESC>:call ToggleInput()<CR>
function ToggleInput()
  if &mouse == "v"
    set mouse=a
  else
    set mouse=v
  endif
endfunction



" Toggle
function! GetBufferList()    
  redir =>buflist    
  silent! ls!    
  redir END    
  return buflist    
endfunction

function! ToggleList(bufname, pfx)    
  let buflist = GetBufferList()    
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')    
    if bufwinnr(bufnum) != -1    
      exec(a:pfx.'close')    
      return    
    endif    
  endfor    
  if a:pfx == 'l' && len(getloclist(0)) == 0    
      echohl ErrorMsg    
      echo "Location List is Empty."    
      return    
  endif    
  let winnr = winnr()    
  exec(a:pfx.'open')    
  if winnr() != winnr    
    wincmd p    
  endif    
endfunction    
     
nmap <silent> <F2> :call ToggleList("Quickfix", 'c')<CR>


""""""""""""""""""""""""""""""
" choosewin settings
""""""""""""""""""""""""""""""
nmap . <Plug>(choosewin)
let g:choosewin_overlay_enable = 1
let g:choosewin_label = "asdfghjkl"




filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab

augroup autoformat_settings
  autocmd FileType yml,yaml set shiftwidth=2

  " autocmd FileType bzl AutoFormatBuffer buildifier
  " autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  " autocmd FileType dart AutoFormatBuffer dartfmt
  " autocmd FileType go AutoFormatBuffer gofmt
  " autocmd FileType gn AutoFormatBuffer gn
  " autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  " autocmd FileType java AutoFormatBuffer google-java-format
  " autocmd FileType python AutoFormatBuffer yapf
  " " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  " autocmd FileType rust AutoFormatBuffer rustfmt
  " autocmd FileType vue AutoFormatBuffer prettier
augroup END


"let g:rainbow_colors_color= [ 226, 192, 195, 189, 225, 221 ]
"call rainbow#enable()
":IndentGuidesEnable







""""""""""""""""""""""""""""""
" Indent Guides Setting
""""""""""""""""""""""""""""""
let g:indent_guides_enable_on_vim_startup = 1
map ,hl :IndentGuidesToggle<CR>
"let g:indent_guides_auto_colors = 0
"hi IndentGuidesOdd  guibg=green   ctermbg=3
"hi IndentGuidesEven guibg=green ctermbg=4
"let g:indent_guides_guide_size = 



""""""""""""""""""""""""""""""
" coc
""""""""""""""""""""""""""""""
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<Tab>" :
  \ coc#refresh()

inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"



inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <NUL> coc#refresh() 

nnoremap <leader><Tab> :call CocAction('jumpDefinition', 'drop')<CR>
vnoremap <leader><Tab> :call CocAction('jumpDefinition', 'drop')<CR>

nnoremap <leader><CR> :call CocAction('jumpDefinition', 'split')<CR>
vnoremap <leader><CR> :call CocAction('jumpDefinition', 'split')<CR>
nmap <leader><space> <Plug>(coc-references)

nmap gn <Plug>(coc-diagnostic-next-error)
nmap gp <Plug>(coc-diagnostic-prev-error)
nmap gi <Plug>(coc-diagnostic-info)
nmap g= <Plug>(coc-format-selected)
vmap g= <Plug>(coc-format-selected)
nmap ga= <Plug>(coc-format)
nmap gr <Plug>(coc-rename)
"nmap bna <Plug>(coc-diagnostic-next)
"nmap bpa <Plug>(coc-diagnostic-prev)

"noremap <space>y :<C-u>CocList -A --normal yank<cr>

:nmap <F3> <Cmd>CocCommand explorer<CR>

" autocmd VimEnter * CocCommand explorer " 开启启动文件浏览器
" execute("normal! <leader>n")

""""""""""""""""""""""""""""""
" AirLine
""""""""""""""""""""""""""""""
nmap <C-L> <Plug>AirlineSelectNextTab
nmap <C-H> <Plug>AirlineSelectPrevTab
nmap <leader>b <C-H>:sp<CR><C-L>:bd<cr>
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme = 'light'
let g:airline#extensions#keymap#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <C-W> <C-H>:sp<CR><C-L>:bd<cr>
let g:airline#extensions#tabline#buffer_idx_format = {    
       \ '0': '0 ',    
       \ '1': '1 ',    
       \ '2': '2 ',      
       \ '3': '3 ',    
       \ '4': '4 ',    
       \ '5': '5 ',    
       \ '6': '6 ',    
       \ '7': '7 ',    
       \ '8': '8 ',     
       \ '9': '9 '    
       \}    
if !exists('g:airline_symbols')    
  let g:airline_symbols = {}    
endif
let g:airline_powerline_fonts=1    
let g:airline_symbols.linenr = "CL" " current line    
let g:airline_symbols.whitespace = '|'    
let g:airline_symbols.maxlinenr = 'Ml' "maxline        
let g:airline_symbols.branch = 'BR'    
let g:airline_symbols.readonly = "RO"    
let g:airline_symbols.dirty = "DT"     
let g:airline_symbols.crypt = "CR"    
let g:airline_extensions = []


""""""""""""""""""""""""""""""
" Floaterm
""""""""""""""""""""""""""""""

noremap <leader>n   :FloatermToggle<CR>
tnoremap <leader>n  <C-\><C-n>:FloatermToggle<CR>

autocmd TermOpen * call TermInit()
func TermInit() 
  setlocal nonu 
  setlocal norelativenumber 
  startinsert 
endfunc 

autocmd TermEnter * call TermEnter()
func TermEnter()
  "call rainbow#disable()
  startinsert 
endfunc 

autocmd TermLeave * call TermLeave()
func TermLeave()
  "call rainbow#enable() 
endfunc

let g:floaterm_autoclose = 1    
let g:floaterm_height = 0.9    
let g:floaterm_width = 0.9

""""""""""""""""""""""""""""""
" FZF
""""""""""""""""""""""""""""""
func InsModeFZF()
  startinsert
  :GFiles
  stopinsert
endfunc
noremap <Leader>e :GFiles<CR>
inoremap <Leader>e <ESC>:GFiles<CR>
noremap <Leader><Leader>e :Files<CR>


""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""
"noremap <F3> :NERDTreeToggle<CR>
"autocmd VimEnter * NERDTree | wincmd p
"autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif



""""""""""""""""""""""""""""""
" TagList
""""""""""""""""""""""""""""""
noremap <F6> :TlistToggle<CR> 

