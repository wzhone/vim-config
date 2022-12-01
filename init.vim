call plug#begin()

	"Plug 'Vssblt/vim-choosewin'
	Plug 't9md/vim-choosewin'

	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

	Plug 'wzhone/vim-config', {'branch': 'master'}

	" Plug 'adi/vim-indent-rainbow'

	" Plug 'nathanaelkane/vim-indent-guides'

	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	" 高亮某个单词
	Plug 'lfv89/vim-interestingwords'

	Plug 'vim-airline/vim-airline'

	Plug 'vim-airline/vim-airline-themes'

	Plug 'voldikss/vim-floaterm'

	" 显示左侧的mark
	Plug 'kshenoy/vim-signature'

	" Plug 'tpope/vim-dispatch'

	Plug  'yegappan/taglist'

	" 在同一行快速跳转单词
	" Plug 'unblevable/quick-scope'

	Plug 'flazz/vim-colorschemes'
	Plug 'sainnhe/sonokai'

	Plug 'yianwillis/vimcdoc'

	Plug 'preservim/nerdcommenter'

  " 多光标
	Plug 'mg979/vim-visual-multi'

	" vim文档中文化
	Plug 'embear/vim-localvimrc'

	" Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } } 
	 " gc  
	 " Add doxygen document on class, function or the other definitions. 
	 " <c-n>  
	 " Jump forward position. 
	 " <c-t> 
	 " Jump backward position. 

	Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }

call plug#end()
