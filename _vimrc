" encoding
set encoding=utf-8

"Configuration file for vim
set modelines=0		" CVE-2007-2438
" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

let skip_defaults_vim=1
set nu
set tabstop=4
set softtabstop=4
set shiftwidth=4
set mouse=a
set autoindent
set smartindent
set cindent
"height ligth cusor
set bg=dark
set cursorline
set cursorcolumn
highlight CursorLine cterm=none ctermbg=250
highlight CursorColumn cterm=none ctermbg=250
syntax on

filetype on
filetype plugin indent on
set shellslash
" ================   vim  theme  ===============
colorscheme gruvbox

" 必须要打开，否则颜色显示会有问题
set t_Co=256

set rtp+=~/vimfiles/bundle/Vundle.vim
call vundle#begin('~/vimfiles/bundle')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Lokaltog/vim-powerline' "status 美化
Plugin 'octol/vim-cpp-enhanced-highlight' "对c++语法高亮增强
Plugin 'kshenoy/vim-signature' "书签可视化的插件
Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines' "书签行高亮
Plugin 'majutsushi/tagbar' "taglist的增强版，查看标签，依赖于ctags
Plugin 'scrooloose/nerdcommenter' "多行注释，leader键+cc生成, leader+cu删除注释
Plugin 'scrooloose/nerdtree' "文件浏览
Plugin 'kien/ctrlp.vim' "搜索历史打开文件，在命令行模式下按ctrl+p触发
Plugin 'vim-scripts/grep.vim' "在命令行模式使用grep命令，:Grep
Plugin 'Lokaltog/vim-easymotion' "快速跳转，按两下leader键和f组合
Plugin 'vim-scripts/ShowTrailingWhitespace.git' "高亮显示行尾的多余空白字符
"Plugin 'vim-scripts/indentpython.vim.git'
Plugin 'vim-scripts/Solarized.git' "主题方案
Plugin 'nathanaelkane/vim-indent-guides.git' "缩进对齐显示
"Plugin 'vim-scripts/indexer.tar.gz' "自动生成标签
"Plugin 'vim-scripts/DfrankUtil' "indexer 依赖
"Plugin 'vim-scripts/vimprj' "indexer 依赖
Plugin 'davidhalter/jedi-vim' "python 补全，不依赖于tags,但比较慢，可以使用indexer替换，但不能跳转项目外
Plugin 'vim-scripts/Markdown'
Plugin 'tpope/vim-surround'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'tomasr/molokai'
Plugin 'leafgarland/typescript-vim'
Plugin 'Yggdroot/indentLine'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'https://github.com/edkolev/tmuxline.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'morhetz/gruvbox'
Plugin 'ycm-core/YouCompleteMe' "自动补全

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ==================  Nerdtree  ================
let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
let g:nerdtree_tabs_open_on_gui_startup=1
let g:nerdtree_tabs_open_on_console_startup=1

autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nmap <F5> :NERDTreeToggle<cr>

" ==================    tagbar   ===============
let g:tagbar_width=35
let g:tagbar_autofocus=1
nmap <F6> :TagbarToggle<CR>

" parse markdown"
let g:tagbar_type_markdown = {
  \ 'ctagstype' : 'markdown',
  \ 'kinds' : [
    \ 'h:Heading_L1',
    \ 'i:Heading_L2',
    \ 'k:Heading_L3'
  \ ]
\ }

" ==================  ctrlp  ===============
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$|target$'

" ==================  ctrlp-funky  ===============
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>uu :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1

" ==================  NERDTREE close all window  ===============
autocmd BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif