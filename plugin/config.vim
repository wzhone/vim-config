"set n
"set relativenumber
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
" set t_Co=256
set fillchars=stl:\ 
set backspace=indent,eol,start
set foldcolumn=1
set signcolumn=number
set numberwidth=1
set scrolloff=6
set undofile
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set termguicolors


let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
colorscheme sonokai

aug QFClose
au!
au WinEnter * if winnr('$') == 1 && &buftype == "quickfix"|q|endif
aug END



 
highlight EndOfBuffer ctermfg=bg
execute ":command! Config :e " g:plug_home.'/vim-config/plugin/config.vim'
execute ":command! InitConfig :e $HOME/.config/nvim/init.vim"
execute ":command! ReloadConfig :e source "g:plug_home.'/vim-config/plugin/config.vim'

let mapleader="w"

inoremap jj <Esc>
inoremap kk <Esc>
inoremap <M-j> <c-o>j
inoremap <M-k> <c-o>k
inoremap <M-h> <c-o>h
inoremap <M-l> <c-o>l
nnoremap <C-j> <c-e><c-e>
noremap <C-k> <c-y><c-y>

noremap <leader>h ^
noremap <leader>l $


noremap <F5> :Make<CR>
inoremap <F5> <ESC>:Make<CR>

" tab
nnoremap <tab> >>
nnoremap <s-tab> <<
vnoremap <tab> >
vnoremap <s-tab> <

nnoremap <Leader>C :set cursorline! cursorcolumn!<CR>
"set cursorline
set mouse=v

"noremap <C-S-W> :w !sudo tee %<CR>

tnoremap <C-h> <C-\><C-n>

nnoremap <space> za

noremap <c-s> :w<CR>
inoremap <c-s> <c-o>:w<CR>


"highlight LineNr term=bold cterm=NONE ctermfg=blue ctermbg=NONE gui=NONE guifg=red guibg=NONE
highlight CurrentWord guibg=#666688


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
let g:choosewin_overlay_enable = 0
let g:choosewin_label = "asdfghjkl"



""""""""""""""""""""""""""""""
" fold 
""""""""""""""""""""""""""""""
"set foldenable
"set foldclose=all

autocmd FileType js,c,c++ set foldmethod=syntax
autocmd FileType python set foldmethod=indent

syn region myFold start="{" end="}" transparent fold
syn sync fromstart
set foldmethod=syntax
autocmd BufRead * normal zR

" augroup autoformat_settings
	"autocmd FileType yml,yaml set shiftwidth=2

	 "autocmd FileType bzl AutoFormatBuffer buildifier
	 "autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
	 "autocmd FileType dart AutoFormatBuffer dartfmt
	 "autocmd FileType go AutoFormatBuffer gofmt
	 "autocmd FileType gn AutoFormatBuffer gn
	 "autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
	 "autocmd FileType java AutoFormatBuffer google-java-format
	 "autocmd FileType python AutoFormatBuffer autopep8
	 "autocmd FileType rust AutoFormatBuffer rustfmt
	 "autocmd FileType vue AutoFormatBuffer prettier
" augroup END

"let g:rainbow_colors_color= [ 226, 192, 195, 189, 225, 221 ]
"call rainbow#enable()
":IndentGuidesEnable







""""""""""""""""""""""""""""""
" Indent Guides Setting 缩进会有颜色
""""""""""""""""""""""""""""""

"let g:indent_guides_enable_on_vim_startup = 1
" map ,hl :IndentGuidesToggle<CR>
"let g:indent_guides_auto_colors = 0
"hi IndentGuidesOdd  guibg=green   ctermbg=3
"hi IndentGuidesEven guibg=green ctermbg=4
"let g:indent_guides_guide_size = 



""""""""""""""""""""""""""""""
" coc
""""""""""""""""""""""""""""""

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.


" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"inoremap <silent><expr> <c-space> coc#refresh()
"inoremap <silent><expr> <NUL> coc#refresh() 

nnoremap g<Tab> :call CocAction('jumpDefinition', 'drop')<CR>
nnoremap g<Tab> :call CocAction('jumpDefinition', 'drop')<CR>
nnoremap g<space> <Plug>(coc-references)
vnoremap g<Tab> :call CocAction('jumpDefinition', 'drop')<CR>

"nnoremap g<CR> :call CocAction('jumpDefinition', 'split')<CR>
"vnoremap g<CR> :call CocAction('jumpDefinition', 'split')<CR>
"nmap <leader><space> <Plug>(coc-references)

nmap gn <Plug>(coc-diagnostic-next-error)
nmap gp <Plug>(coc-diagnostic-prev-error)
nmap gi <Plug>(coc-diagnostic-info)
nmap g= <Plug>(coc-format-selected)
xmap g= <Plug>(coc-format-selected)
nmap gf <Plug>(coc-format)
nmap gr <Plug>(coc-rename)
nmap ga :CocCommand clangd.switchSourceHeader<CR>
"nmap bna <Plug>(coc-diagnostic-next)
"nmap bpa <Plug>(coc-diagnostic-prev)

"noremap <space>y :<C-u>CocList -A --normal yank<cr>

:nmap <F3> <Cmd>CocCommand explorer<CR>

" autocmd VimEnter * CocCommand explorer " 开启启动文件浏览器
" execute("normal! <leader>n")
" nnoremap <silent> <space>g :<C-u>CocList --normal gstatus<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
autocmd CursorHold * silent call CocActionAsync('highlight')

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
let g:airline_theme = 'alduin'
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
let g:coc_global_extensions = [
    \ 'coc-clangd',
    \ 'coc-cmake',
    \ 'coc-vimlsp',
    \ 'coc-highlight',
    \ 'coc-html',
    \ 'coc-yank',
    \ 'coc-explorer', 
    \ 'coc-ecdict',
    \ 'coc-pairs',
    \ 'coc-tsserver',
    \ 'coc-pyright',
    \ 'coc-css',
    \ 'coc-snippets',
  \ ]

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
nnoremap <Leader>e :GFiles<CR>
nnoremap <Leader>e <ESC>:GFiles<CR>
nnoremap <Leader><Leader>e :Files<CR>


""""""""""""""""""""""""""""""
" TagList
""""""""""""""""""""""""""""""
noremap <F6> :TlistToggle<CR> 
let Tlist_Use_Right_Window=1
let Tlist_Exit_OnlyWindow = 1

"""""""""""""""""""""""""""""
" quickscope
"""""""""""""""""""""""""""""


"""""""""""""""""""""""""
 "embear/vim-localvimrc
"""""""""""""""""""""""""
let g:localvimrc_ask=0 
let g:localvimrc_sandbox=0 


"""""""""""""""""""""""""
 "nerdcommenter
"""""""""""""""""""""""""
filetype plugin on
let g:NERDCreateDefaultMappings = 0

" xmap <leader>c :call Comment()<CR>
xmap /  <Plug>NERDCommenterToggle

"function Comment()
	"execute "normal \<Plug>NERDCommenterToggle"
	"let [line2, col2] = getpos("'>")[1:2]
	"if (line2 == line('.'))
		"let [line1, col1] = getpos("'<")[1:2]
		"execute ':'.line1
		"normal V
		"execute ':'.line2
	"endif
"endfunction
"
"
"

" -----------------------

let g:doge_enable_mappings='0'
let g:doge_mapping='gc' 
let g:doge_mapping_comment_jump_forward='<c-j>' 
"let g:doge_mapping_comment_jump_backward='<c-k>' 
let g:doge_doc_standard_cpp='doxygen_javadoc' 


autocmd BufReadPost *
	\ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
	\ |   exe "normal! g`\""
	\ | endif

