# Windows10 Vim Ide 配置

本例子是在Windows10 上配置的，其他系统是否可用请自行尝试。安装路径建议使用默认路径即可。

[Github](https://github.com/obiscr/vim)

其他的资源可以再分享链接下载。这边只放了一个 _vimrc 文件。

## 懒人版

百度云链接: https://pan.baidu.com/s/1kEeCKsSNScaw4-ZFT_VWUQ 密码: 0git

下载完成以后，先安装三个exe文件，建议使用默认路径安装，然后还需要配置环境变量，go 和 python 的安装后的配置可以参考本文档下面的一部分。
然后备份自己用户目录（~/）的 _vimrc 文件，vimfiles 目录，然后把下载的这两个文件放到 ~/ 目录。

## 折腾版

### 下载 VIM
可以在 [此处](https://tuxproject.de/projects/vim/) 下载 **x64** 版本的Vim。
> 我用的 Vim 版本是: 9.0.0215

### 下载 Python

在 [此处](https://www.python.org/ftp/python/3.10.6/python-3.10.6-amd64.exe) 下载 Python。安装完成后，确保环境变量添加到了Path，运行是否正常等。
> 我用的 Python 版本是: 3.10.6

除此之外，还需要配置 **PYTHONHOME** 环境变量。变量名是：PYTHONHOME，变量值是Python的安装路径。

![4](https://services.obiscr.com/file/图片/4-20220821081926177.png)

### 特别注意
> **有一点需要注意：**Vim 版本 和 Python 版本的位数要匹配，要么都是 x64 （64位）的，要么都是 x86 （32位）的**。下载的时候注意版本问题。**

### 下载 _vimrc 文件

在 [Github 仓库](https://github.com/obiscr/vim) 下载需要的配置文件。下载完成之后放到 `C:\Users\<你的用户名>` 目录下。 或者要是懒得动手也可以直接复制下方的。
进入此目录 `C:\Users\<你的用户名>` ，也可以在终端执行 `cd ~` 即可进入，然后新建一个文件名为 **_vimrc** 的文件，把下面的内容放进去即可。

```console
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
```

### 插件配置

插件管理用的是：[Vundle](https://github.com/VundleVim/Vundle.vim)，Windows10 系统的配置可以参考 [Vundle官方文档](https://github.com/VundleVim/Vundle.vim/wiki/Vundle-for-Windows)。

### 插件安装

上面的操作如果没有问题：在用户主目录会有一个名称为 **vimfiles** 的文件夹。并且还有一个名称为 **_vimrc** 的文件。

![1](https://services.obiscr.com/file/图片/1-20220821082003453.png)

配置完成以后，打开Terminal，运行 `vim +PluginInstall`，如下图。当然第一遍操作没有这么快，因为要下载很多的东西。而且是从github下载。网速不好的话，会比较折腾。这部分一直下载不下来的可以从我分享出来的链接下载。下载完成以后直接替换你的 **vimfiles** 文件夹，在此执行 `vim +PluginInstall`，应该就可以了。

![2](https://services.obiscr.com/file/图片/2-20220821082020319.gif)

### 配置Go环境

在 [此处](https://dl.google.com/go/go1.19.windows-amd64.msi)，下载不了可以直接从我分享的连接下载。安装以后设置几个参数：
```go
go env -w GO111MODULE="on"

// 下面两条指令按照顺序执行
go env -w GOPROXY=https://goproxy.cn
go install golang.org/x/tools/gopls@latest
```

### YouCompleteMe 

[YouCompleteMe](https://github.com/ycm-core/YouCompleteMe) 按理也是插件安装的一部分，单独拿出来说是因为，这个配置实在是很麻烦。

插件安装完成以后，可以根据 [文档](http://ycm-core.github.io/YouCompleteMe/#windows) 来配置YouCompleteMe。

> 这边配置的时候，一定要认真。一步一步往下走，坑特别多。特别是需要安装的环境：
1. Visual Studio Build Tools 2017（我用的2019）
2. cmake
3. python
4. go
5. node 
6. npm

下面大概说一下我的安装流程。

首选确保上面的操作都没问题，环境也安装好了。然后到 **~\vimfiles\bundle\YouCompleteMe\third_party\ycmd** 目录，执行 `python .\build.py --all --verbose`。如果中间没遇到什么错误，就到这个目录 **~\vimfiles\bundle\YouCompleteMe** ，执行 `python3 install.py --all`，之后应该就可以使用了。

最后，确保Python插件已经支持。Terminal 输入 `vim --version` 显示如下。

```c
VIM - Vi IMproved 9.0 (2022 Jun 28, 编译于 Aug 19 2022 22:03:43)
MS-Windows 64 位控制台版本
包含补丁: 1-228
编译者 appveyor@APPVYR-WIN
巨型版本 无图形界面。  可使用(+)与不可使用(-)的功能:
+acl                +ex_extra           +multi_lang         -tag_any_white
+arabic             +extra_search       +mzscheme/dyn       -tcl
+autocmd            -farsi              -netbeans_intg      +termguicolors
+autochdir          +file_in_path       +num64              +terminal
+autoservername     +find_in_path       +packages           -termresponse
-balloon_eval       +float              +path_extra         +textobjects
+balloon_eval_term  +folding            +perl/dyn           +textprop
-browse             -footer             +persistent_undo    -tgetent
++builtin_terms     +gettext/dyn        +popupwin           +timers
+byte_offset        -hangul_input       -postscript         +title
+clientserver       +ipv6               +python/dyn         +vartabs
+clipboard          +job                +python3/dyn        +vertsplit
+cmdline_compl      +jumplist           +quickfix           +vim9script
+cmdline_hist       +keymap             +reltime            +viminfo
+cmdline_info       +lambda             +rightleft          +virtualedit
+comments           +langmap            +ruby/dyn           +visual
+conceal            +libcall            +scrollbind         +visualextra
+cryptv             +linebreak          +signs              +vreplace
+cscope             +lispindent         +smartindent        +vtp
+cursorbind         +listcmds           +sodium/dyn         +wildignore
+cursorshape        +localmap           +sound              +wildmenu
+dialog_con         +lua/dyn            +spell              +windows
+diff               +menu               +startuptime        +writebackup
+digraphs           +mksession          +statusline         -xfontset
-dnd                +modify_fname       -sun_workshop       -xim
-ebcdic             +mouse              +syntax             -xpm_w32
+emacs_tags         -mouseshape         +tag_binary         -xterm_save
+eval               +multi_byte_ime/dyn -tag_old_static
     系统 vimrc 文件: "$VIM\vimrc"
     用户 vimrc 文件: "$HOME\_vimrc"
 第二用户 vimrc 文件: "$HOME\vimfiles\vimrc"
 第三用户 vimrc 文件: "$VIM\_vimrc"
      用户 exrc 文件: "$HOME\_exrc"
  第二用户 exrc 文件: "$VIM\_exrc"
       defaults 文件: "$VIMRUNTIME\defaults.vim"
编译方式: cl -c /W3 /GF /nologo -I. -Iproto -DHAVE_PATHDEF -DWIN32  -DFEAT_CSCOPE -DFEAT_TERMINAL -DFEAT_SOUND  -DFEAT_JOB_CHANNEL -DFEAT_IPV6    -DHAVE_SODIUM -DDYNAMIC_SODIUM -DDYNAMIC_SODIUM_DLL=\"libsodium.dll\" /I "C:\libsodium\include" -DWINVER=0x0501 -D_WIN32_WINNT=0x0501 /source-charset:utf-8 /MP -DHAVE_STDINT_H /Ox /GL -DNDEBUG /Zl /MT /D_CRT_SECURE_NO_DEPRECATE /D_CRT_NONSTDC_NO_DEPRECATE -DFEAT_MBYTE_IME -DDYNAMIC_IME -DDYNAMIC_ICONV -DDYNAMIC_GETTEXT -DFEAT_LUA -DDYNAMIC_LUA -DDYNAMIC_LUA_DLL=\"lua54.dll\" -DFEAT_PYTHON -DDYNAMIC_PYTHON -DDYNAMIC_PYTHON_DLL=\"python27.dll\" -DFEAT_PYTHON3 -DDYNAMIC_PYTHON3 -DDYNAMIC_PYTHON3_DLL=\"python310.dll\" -DFEAT_MZSCHEME -I "C:\racket\include" -DMZ_PRECISE_GC -DDYNAMIC_MZSCHEME -DDYNAMIC_MZSCH_DLL=\"libracket3m_da32rk.dll\" -DDYNAMIC_MZGC_DLL=\"libracket3m_da32rk.dll\" -DFEAT_PERL -DPERL_IMPLICIT_CONTEXT -DPERL_IMPLICIT_SYS -DDYNAMIC_PERL -DDYNAMIC_PERL_DLL=\"perl532.dll\" -DFEAT_RUBY -DDYNAMIC_RUBY -DDYNAMIC_RUBY_DLL=\"x64-msvcrt-ruby300.dll\" -DRUBY_VERSION=30 -DFEAT_HUGE /Fd.\ObjCULYHRZAMD64/ /Zi
链接方式: link /nologo /opt:ref /LTCG oldnames.lib kernel32.lib advapi32.lib shell32.lib gdi32.lib  comdlg32.lib ole32.lib netapi32.lib uuid.lib user32.lib  /machine:AMD64   libcmt.lib   /nodefaultlib:lua54.lib  /STACK:8388608  /nodefaultlib:python27.lib /nodefaultlib:python310.lib    winmm.lib WSock32.lib Ws2_32.lib   /PDB:vim.pdb -debug
```

最主要要确保 python 的支持。如果前面是 + 应该是没有问题的。

```c
...
+python/dyn  
+python3/dyn
...
```

## 配置完成以后

![3](https://services.obiscr.com/file/图片/3-20220821082048974.png)

