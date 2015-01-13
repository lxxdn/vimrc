"""""""""""""""""""
"vim基本设定
"""""""""""""""""""
set nu  "行号
set backspace=indent,eol,start "让backspace正常运作
set nocompatible               " 关闭 vi 兼容模式
filetype off           " Enable filetype detection

syntax on " 自动语法高亮
set showcmd "状态栏显示目前执行的命令
set enc=utf-8 "utf8 编码
set nocompatible               " be iMproved
set cul     "显示当前行

"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]  " 我的状态行显示的内容（包括文件类型和解码） set laststatus=2  " 总是显示状态行
set cmdheight=2   " 命令行（在状态行下）的高度，默认为1，这里是2

set lbr                 "单词不断行
set fo+=mB              "中文可以断
set hls                 "高亮搜索
set is                  "输入时搜索
set whichwrap=b,s,<,>,[,]
set ambiwidth=double
filetype plugin indent on
set sm             "括号匹配
set cin             "开启重新排版按V选中，然后按=，就会重排
set wildmode=longest,list,full
set clipboard=unnamed "use system clipboard
set tags=.tags,.gemtags
"""""""""""""""""""
"颜色主题
""""""""""""""""""""
set t_Co=256
set guifont=Menlo\ Regular:h15

if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window (for an alternative on Windows, see simalt below).
  set lines=999 columns=999
  syntax enable
  set background=light
  colorscheme solarized
else
  colorscheme molokai
  let g:molokai_original = 1
endif

"""""""""""""""""""
" 自定义键盘绑定
""""""""""""""""""""
" 定义下一个buffer和前一个buffer
map <C-Tab> :bnext<cr>
map <C-S-Tab> :bprevious<cr>
" % to bounce from do to end etc.
runtime! macros/matchit.vim

"""""""""""""""""""
"缩进
""""""""""""""""""""
set et                      " tab 变 空格
set smarttab                "backspace delete a tab instead of a space


"如果是ruby则tab是两个空格，否则是4个空格
set shiftwidth=2
set tabstop=2
set sw=2

"一次向下移动15行
map <C-j> 15j
"一次向上移动15行
map <C-k> 15k
"删除没用的空格
autocmd BufWritePre * :%s/\s\+$//e

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"my Bundle here:
"
" original repos on github
Plugin 'kien/ctrlp.vim'
"Plugin 'sukima/xmledit'
"Plugin 'sjl/gundo.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Valloric/ListToggle'
Plugin 'SirVer/ultisnips'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'godlygeek/tabular'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'kchmck/vim-coffee-script'
Plugin 'rking/ag.vim'
Plugin 'skammer/vim-css-color'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
"Plugin 'bling/vim-bufferline'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-fugitive'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'fatih/vim-go'
Plugin 'Yggdroot/indentLine'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/BufOnly.vim'
Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"
"

"""""""""""""""""""
" NerdTree
"""""""""""""""""""
"autocmd vimenter * NERDTree
let NERDTreeChDirMode=2 "make sure the working directory is set correctly.
map <leader>n :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <leader>r :NERDTreeFind<CR>


"""""""""""""""""""
" Rainbow Parentheses
"""""""""""""""""""
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \
    \]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax   * RainbowParenthesesLoadRound
au Syntax   * RainbowParenthesesLoadSquare
au Syntax   * RainbowParenthesesLoadBraces

"""""""""""""""""""
" ctrlp
"""""""""""""""""""

"MRU default
let g:ctrlp_regexp = 1
"let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|.rvm$'
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
let g:ctrlp_clear_cache_on_exit = 1

""""""""""""""""""
" Multiple cursor
"""""""""""""""""""
" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"""""""""""""""""""
" css-color
"""""""""""""""""""
let g:cssColorVimDoNotMessMyUpdatetime = 1


"""""""""""""""""""
" Vim flavored mardkown
"""""""""""""""""""
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

"""""""""""""""""""
" Airline
"""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1


"""""""""""""""""""
" YouCompleteMe
"""""""""""""""""""
let g:ycm_key_list_select_completion = ['<Down>']

"""""""""""""""""""
" ultisnips
"""""""""""""""""""

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"""""""""""""""""""
" ListToggle
"""""""""""""""""""
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'
