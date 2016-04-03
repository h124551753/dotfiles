" ----------------------------------------------------------------------------
" Vim-Plug:Plgin management and setting
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Ready go ===> Make sure you use single quotes
" ----------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')
let mapleader = ','
let g:mapleader = ','
let g:plug_timeout = 100

" ----------------------------------------------------------------------------
" vim plugin bundle control, command model
" :PlugInstall     install
" :PlugInstall!    update
" :PlugClean       remove plugin not in list
" ----------------------------------------------------------------------------

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround' | Plug 'tpope/vim-repeat'
Plug 'junegunn/vim-github-dashboard', { 'on': ['GHDashboard', 'GHActivity'] }
Plug 'kovisoft/paredit', { 'for': ['clojure', 'scheme'] }
Plug 'junegunn/vader.vim',  { 'on': 'Vader', 'for': 'vader' }
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --gocode-completer' }
Plug 'Chiel92/vim-autoformat', {'on': 'Autoformat'}
Plug 'scrooloose/syntastic'
Plug 'kien/ctrlp.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-unimpaired'
Plug 'eventualbuddha/vim-protobuf'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/DrawIt'
Plug 'sheerun/vim-polyglot'
Plug 'kien/rainbow_parentheses.vim'
Plug 'rking/ag.vim'
Plug 'shime/vim-livedown'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Lokaltog/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'kshenoy/vim-signature'
Plug 'majutsushi/tagbar'
Plug 'rizzatti/dash.vim'
Plug 'sjl/gundo.vim', {'on': 'GundoToggle'}
Plug 'terryma/vim-expand-region'
Plug 'plasticboy/vim-markdown'
" Plug 'Yggdroot/indentLine'
Plug 'aceofall/gtags.vim'

" c&cpp
Plug 'octol/vim-cpp-enhanced-highlight'

" javascript
Plug 'pangloss/vim-javascript', {'branch': 'develop'}
Plug 'marijnh/tern_for_vim', {'do': 'npm install'}
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'heavenshell/vim-jsdoc', {'for': ['javascript', 'jsx']}
Plug 'burnettk/vim-angular'
Plug 'mxw/vim-jsx'
Plug 'cakebaker/scss-syntax.vim'

" go
Plug 'fatih/vim-go'
Plug 'nsf/gocode'

" erlang {{{
Plug 'vim-erlang/vim-erlang-runtime',      { 'for': 'erlang'}
Plug 'vim-erlang/vim-erlang-compiler',     { 'for': 'erlang'}
Plug 'vim-erlang/vim-erlang-omnicomplete', { 'for': 'erlang'}
Plug 'vim-erlang/vim-erlang-tags',         { 'for': 'erlang'}
Plug 'ten0s/syntaxerl',                    { 'for': 'erlang'}
"}}}
"
" lua {{{
Plug 'xolox/vim-misc',         { 'for': 'lua' }
Plug 'xolox/vim-lua-ftplugin', { 'for': 'lua' }
Plug 'xolox/vim-lua-inspect',  { 'for': 'lua' }
"}}}
"
" themes
Plug 'chrisbra/Colorizer'
Plug 'bling/vim-airline'
Plug 'chrisbra/Colorizer'
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/seoul256.vim'
Plug 'tomasr/molokai'

"Load local plugins
if filereadable(expand("~/.vim/vimrc.bundles.local"))
  source ~/.vim/vimrc.bundles.local
endif
call plug#end()


" ===>
" don't bother with vi compatibility
set nocompatible

" enable syntax highlighting
syntax enable

"检测文件类型
filetype on
"针对不同的文件类型采用不同的缩进格式
filetype indent on
"允许插件
filetype plugin on
"启动自动补全
filetype plugin indent on

set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set backupcopy=yes                                           " see :help crontab
set clipboard=unnamed                                        " yank and paste with the system clipboard
set directory-=.                                             " don't store swapfiles in the current directory
set encoding=utf-8
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set laststatus=2                                             " always show statusline
set list                                                     " show trailing whitespace
set number                                                   " show line numbers
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set showcmd
set smartcase                                                " case-sensitive search if any caps
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full
set binary
set noeol                                                    " no end of line at the end of the file
set hlsearch                                                 " highlight search
set guifont=Droid\ Sans\ Mono\ for\ Powerline:h14
set guifont=Anonymous\ Pro\ for\ Powerline:h16

" Show “invisible” characters
set list
set list listchars=tab:\¦\                                   " for indentline plugin
set listchars=tab:▸\ ,trail:▫
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
"set lcs=tab:▸\ ,trail:·
set cursorcolumn
set cursorline
set completeopt=longest,menu                                 "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)

" tab相关变更
set tabstop=4     " 设置Tab键的宽度        [等同的空格个数]
set shiftwidth=4  " 每一次缩进对应的空格数
set softtabstop=4 " 按退格键时可以一次删掉 4 个空格
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
set expandtab     " 将Tab自动转化成空格    [需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set shiftround    " 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'

" FileEncode Settings 文件编码,格式
"==========================================
" 设置新文件的编码为 UTF-8
set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
"set langmenu=zh_CN.UTF-8
"set enc=2byte-gb18030
" 下面这句只影响普通模式 (非图形界面) 下的 Vim。
set termencoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" 如遇Unicode值大于255的文本，不必等到空格再折行。
set formatoptions+=m
" 合并两行中文时，不在中间加空格：
set formatoptions+=B
" A buffer becomes hidden when it is abandoned
set hidden
set wildmode=list:longest
set ttyfast


" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif


" macos vs linux clipboard
if has("mac")
  set clipboard+=unnamed
else
  set clipboard=unnamedplus
endif


" keyboard shortcuts
inoremap jj <ESC>
set pastetoggle=<leader>2

" normal norecursive map
nnoremap <leader>p :CtrlP<CR>
nnoremap <leader>a :Ag<space>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>f :CtrlPMRU<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>] :TagbarToggle<CR>
nnoremap <leader>0 :GundoToggle<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
nnoremap <Leader>s :call ToggleErrors()<cr>
nnoremap <leader>w :w<CR>
nnoremap <leader>it :IndentLinesToggle<CR>
nnoremap <silent> <leader>k :Dash<CR>
nnoremap ss :split<CR>
nnoremap sv :vsplit<CR>

" * splits maps {{{
nmap <c-s> <Plug>(choosewin)
nnoremap sc <C-W>c
nnoremap sh <C-W>h
nnoremap sj <C-W>j
nnoremap sk <C-W>k
nnoremap sl <C-W>l
nnoremap ss :split<CR>
nnoremap sv :vsplit<CR>
nnoremap <M-<> <C-W><
nnoremap <M->> <C-W>>
"}}}

" ag {{{
nnoremap <Leader>aa :Ag!<space>
nnoremap <Leader>aw :Ag! -w<space>
nnoremap <Leader>aq :Ag -Q<space>
nnoremap <Leader>as :Ag ''<left>
nmap g? <plug>(Grepper)
xmap g? <plug>(Grepper)
cmap ` <plug>(GrepperNext)
"}}}


"
nnoremap <Leader>gl :Extradite<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>ga :Gcommit --amend<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gpp :Gpush<CR>
" not pushing anything without user confirmation on purporse
nnoremap <Leader>gpf :Gpush -f
nnoremap <Leader>gpd :Gpush --dry<CR>
nnoremap <Leader>gpr :Gpull --rebase<CR>
nnoremap <Leader>gfc :Git checkout %<CR>
nnoremap <Leader>gfr :Gremove<CR>
nnoremap <Leader>gP :Git push -u origin<space>
nnoremap <silent> <Leader>g1 :Git diff<CR>
nnoremap <silent> <Leader>g2 :Git diff --staged<CR>
nnoremap <Leader>gb :MerginalToggle<CR>
"}}}

"nmap <leader><space> :FixWhitespace<cr>
nmap <leader>S :FixWhitespace<cr>
nmap \ <Plug>CtrlSFCwordPath<CR>

" 默认map命令影响到普通模式和可视模式
map <Leader>l <Plug>(EasyAlign)
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
map <Leader><leader>. <Plug>(easymotion-repeat)
nmap s <Plug>(easymotion-s)
nmap t <Plug>(easymotion-s2)

noremap <leader>gh :! open https://github.com<CR>
noremap <leader>gg :! open https://google.com<CR>
noremap <leader>g :GitGutterToggle<CR>
noremap <silent><leader>/ :nohls<CR> " 去掉搜索高亮
noremap <leader>nep:set noexpandtab<CR>  " tcl keymapping
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

cnoremap w!! %!sudo tee > /dev/null %

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :vsp $MYVIMRC<CR>

" Don't copy the contents of an overwritten selection.
vnoremap p "_dP

vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

" tab/buffer相关

" 切换前后buffer
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>
" 使用方向键切换buffer
noremap <left> :bp<CR>
noremap <right> :bn<CR>

" TODO: 配置成功这里, 切换更方便, 两个键
" nnoremap <C-S-tab> :tabprevious<CR>
" nnoremap <C-tab>   :tabnext<CR>
" inoremap <C-S-tab> <Esc>:tabprevious<CR>i
" inoremap <C-tab>   <Esc>:tabnext<CR>i
" nnoremap <C-Left> :tabprevious<CR>
" nnoremap <C-Right> :tabnext<CR>

" normal模式下切换到确切的tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

nnoremap <C-N>     :tabnew<CR>
inoremap <C-N>     <Esc>:tabnew<CR>

nmap <Leader>cp :!xclip -i -selection clipboard % <CR><CR>
nnoremap <Leader>bk :!mkdir -p vim_backup; cp % vim_backup/%_bk --backup=numbered <CR>

func DiffWithSaved()
    let ft=&filetype
    diffthis
    vnew | r # | normal! 1Gdd
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . ft
endfunc
com DiffSaved call DiffWithSaved()
nnoremap <Leader>df :call DiffWithSaved()<CR>


" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


" Go crazy!
if filereadable(expand("~/.vimrc.local"))
  " In your .vimrc.local, you might like:
  " set whichwrap+=<,>,h,l,[,] " Wrap arrow keys between lines
  " autocmd! bufwritepost .vimrc source ~/.vimrc
  source ~/.vimrc.local
endif


" =========================> plugins config <===============================================
" Track the engine.
" Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
" Plugin 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" git submodule update --init --recursive
" let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsExpandTrigger       = '<C-j>'
let g:UltiSnipsJumpForwardTrigger  = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
let g:UltiSnipsSnippetDirectories  = ['UltiSnips']
let g:UltiSnipsSnippetsDir         = '~/.vim/UltiSnips'
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" YouCompleteMe
" remap Ultisnips for compatibility for YCM
let g:ycm_goto_buffer_command      = 'horizontal-split'
let g:ycm_global_ycm_extra_conf    = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'


" syntastic'
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_enable_highlighting=1

" 最轻量
" let g:syntastic_python_checkers=['pyflakes'] " 使用pyflakes

" 中等
" error code: http://pep8.readthedocs.org/en/latest/intro.html#error-codes
let g:syntastic_python_checkers=['pyflakes', 'pep8'] " 使用pyflakes,速度比pylint快
let g:syntastic_python_pep8_args='--ignore=E501,E225,E124,E712'

" 重量级, 但是足够强大, 定制完成后相当个性化
" pylint codes: http://pylint-messages.wikidot.com/all-codes
" let g:syntastic_python_checkers=['pyflakes', 'pylint'] " 使用pyflakes,速度比pylint快
" let g:syntastic_python_checkers=['pylint'] " 使用pyflakes,速度比pylint快
" let g:syntastic_python_pylint_args='--disable=C0111,R0903,C0301'

let g:syntastic_javascript_checkers = ['jsl', 'jshint']
let g:syntastic_html_checkers=['tidy', 'jshint']
" 修改高亮的背景色, 适应主题
highlight SyntasticErrorSign guifg=white guibg=black

" to see error location list
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 5

function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction


" vim-easymotion
let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
" ,, + w  跳转
" ,, + fe  查找'e',快速跳转定位到某个字符位置
" ,,j      快速决定移动到下面哪行(比用行号/j移动快)
" ,,k      快速移动到上面哪行
" ,,l      本行, 向后快速移动
" ,,h      本行, 向前快速移动
" ,,.      重复上一次easymotion命令


" vim-easy-align
if !exists('g:easy_align_delimiters')
  let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }


" Yggdroot/indentLine
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_start_level = 2
" let g:indent_guides_guide_size = 1
" let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'tagbar', 'unite']


" Colorizer
let g:colorizer_auto_color = 1
let g:colorizer_auto_filetype='less,sass,scss,js,css,html'
let g:colorizer_syntax = 1


" vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'


" vim-signature
" m[a-zA-Z]   打标签
" '[a-zA-Z]   跳转到标签位置
" '. 最后一次变更的地方
" '' 跳回来的地方
" m<space>    去除所有标签


" ctrlp.vim
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window = 'order:ttb,max:20'
"let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1


" 类似sublimetext的搜索
" ctrlsf.vim
" In CtrlSF window:
" 回车/o, 打开
" t 在tab中打开(建议)
" T - Lkie t but focus CtrlSF window instead of opened new tab.
" q - Quit CtrlSF window.
" let g:ctrlsf_position = 'below'
" let g:ctrlsf_winsize = '30%'
let g:ctrlsf_auto_close = 0
let g:ctrlsf_confirm_save = 0
" Note: cannot use <CR> or <C-m> for open
" Use : <sapce> or <tab>
let g:ctrlsf_mapping = {
    \ "open"  : "<Space>",
    \ "openb" : "O",
    \ "tab"   : "t",
    \ "tabb"  : "T",
    \ "prevw" : "p",
    \ "quit"  : "q",
    \ "next"  : "<C-J>",
    \ "prev"  : "<C-K>",
    \ "pquit" : "q",
    \ }


function! AutoSetFileHead()
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
    endif

    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call append(1, "\# encoding: utf-8")
    endif

    if &filetype == 'lua'
        call setline(1, "--[[")
        call append(line("."),   "  ".expand("%"))
        call append(line(".")+1, "")
        call append(line(".")+2, "  Created on : ".strftime("%F %R"))
        call append(line(".")+3, "      Author : "."xuehao.zhou")
        call append(line(".")+4, "     Version : "."fwm_2.0.0")
        call append(line(".")+5, "--]]")
        normal G
        normal d^
        normal x
    endif

    if &filetype == 'c'
        call setline(1, "/*")
        call append(line("."),   " * ".expand("%"))
        call append(line(".")+1, " *")
        call append(line(".")+2, " * Created on : ".strftime("%F %R"))
        call append(line(".")+3, " *     Author : "."xuehao.zhou")
        call append(line(".")+4, " *    Version : "."fwm_2.0.0")
        call append(line(".")+5, " *   Modify by: ".expand("xxxxxx@gmail.com"))
        call append(line(".")+6, " */")
    endif

    if &filetype == 'h'
        call setline(1, "/*")
        call append(line("."),   " * ".expand("%"))
        call append(line(".")+1, " *")
        call append(line(".")+2, " * Created on : ".strftime("%F %R"))
        call append(line(".")+3, " *     Author : "."xuehao.zhou")
        call append(line(".")+4, " *    Version : "."fwm_2.0.0")
        call append(line(".")+5, " */")
        call append(line(".")+6, "")
        call append(line(".")+7, "")
        call append(line(".")+8, "\#ifndef ".toupper(substitute(expand("%"), '\.', "_", "g"))."_")
        call append(line(".")+9, "\#define ".toupper(substitute(expand("%"), '\.', "_", "g"))."_")
        call append(line(".")+10, "")
        call append(line(".")+11, "")
        call append(line(".")+12, "\#endif")
    endif

    normal G
endfunc

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" Automatic commands
if has("autocmd")
  " COOL HACKS
  " Make sure Vim returns to the same line when you reopen a file.
  augroup line_return
      au!
      au BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \     execute 'normal! g`"zvzz' |
          \ endif
  augroup END


  autocmd BufNewFile,BufRead *.h  setlocal filetype=h
  autocmd BufNewFile *.[ch],*.lua,*.sh,*.py exec ":call AutoSetFileHead()"

  " Highlight TODO, FIXME, NOTE, etc.
  if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
  endif

  " md is markdown
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile *.md set spell
  autocmd VimResized * :wincmd =
  autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript " Treat .json files as .js
  autocmd BufNewFile,BufRead *.md setlocal filetype=markdown " Treat .md files as Markdown
  autocmd FileType python,c,c++,lua set tabstop=4 shiftwidth=4 expandtab ai
  autocmd FileType ruby,javascript,sh,go,html,css,scss set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
  autocmd BufRead,BufNew *.md,*.mkd,*.markdown  set filetype=markdown.mkd
  autocmd FileType c,cpp,erlang,go,lua,javascript,python,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
  au FileType scss setl sw=2 sts=2 et
  au FileType html setl sw=2 sts=2 et
  au FileType css setl sw=2 sts=2 et
  au FileType elm setl sw=2 sts=2 et
  au FileType go setl sw=2 sts=2 et
  au FileType clojure RainbowParenthesesActivate
  au Syntax * RainbowParenthesesLoadRound
endif


" rainbow_parentheses
" \ ['black',       'SeaGreen3'], "exclude this line
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
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


" vim-airline
" airline
if !exists("g:airline_symbols")
  let g:airline_symbols = {}
endif
let g:airline_theme="powerlineish"
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#empty_message  =  "no .git"
let g:airline#extensions#whitespace#enabled    =  0
let g:airline#extensions#syntastic#enabled     =  1
let g:airline#extensions#tabline#enabled       =  1
let g:airline#extensions#tabline#tab_nr_type   =  1 " tab number
let g:airline#extensions#tabline#fnamecollapse =  1 " /a/m/model.rb
let g:airline#extensions#hunks#non_zero_only   =  1 " git gutter


if (&t_Co == 256 || has('gui_running'))
	if ($TERM_PROGRAM == 'iTerm.app')
		let g:molokai_original = 1
		colorscheme molokai
	else
		let g:solarized_termtrans=1
		let g:solarized_contrast="normal"
		let g:solarized_visibility="normal"
		colorscheme solarized
	endif
endif


" PROGRAMMING LANGUAGES
" vim-go settings
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" vim-go bindings
augroup FileType go
  au!
  au FileType go nmap gd <Plug>(go-def)
  au FileType go nmap <Leader>dd <Plug>(go-def-vertical)

  au FileType go nmap <Leader>dv <Plug>(go-doc-vertical)
  au FileType go nmap <Leader>db <Plug>(go-doc-browser)

  au FileType go nmap <Leader>i <Plug>(go-info)

  au FileType go nmap <leader>r <Plug>(go-run)
  au FileType go nmap <leader>b <Plug>(go-build)
  au FileType go nmap <leader>t <Plug>(go-test)
augroup END

" General file runners for various languages
function! LangRunner()
  if(&ft=="python")
    nnoremap <leader>r :!python2 %<cr>
  elseif(&ft=="ruby")
    nnoremap <leader>r :!ruby %<cr>
  elseif(&ft=="javascript")
    nnoremap <leader>r :!node %<cr>
  elseif(&ft=="php")
    nnoremap <leader>r :!php %<cr>
  elseif(&ft=="c")
    nnoremap <leader>r :!make run<cr>
  endif
endfunction

au BufEnter * call LangRunner()


" octol/vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

" ----------------------------------------------------------------------------
" vim-jsx
" ----------------------------------------------------------------------------
let g:jsx_ext_required = 0 " Allow JSX in normal JS files"

" ----------------------------------------------------------------------------
" vim-jsdoc
" ----------------------------------------------------------------------------
let g:jsdoc_default_mapping = 0
autocmd FileType javascript nnoremap <Leader><Leader>d :JsDoc<CR>

" ----------------------------------------------------------------------------
" tern_for_vim
" ----------------------------------------------------------------------------
let tern_show_signature_in_pum = 1
let tern_show_argument_hints = 'on_hold'
autocmd FileType javascript nnoremap <leader>d :TernDef<CR>
autocmd FileType javascript setlocal omnifunc=tern#Complete


" ----------------------------------------------------------------------------
" vim-autoformat
"require: npm install -g js-beautify
" ----------------------------------------------------------------------------
autocmd FileType javascript,json,html,css,scss noremap <buffer>  <leader><leader>f :Autoformat<cr>

" erlang {{{
augroup erlang_au
  au BufNewFile,BufRead sys.config set ft=erlang
  au FileType erlang setlocal sw=4 ts=4 sts=4 expandtab
  au FileType erlang let b:switch_custom_definitions =
        \ [
        \   {
        \     '<<"\([^"]*\)">>':                  '"\1"',
        \     '\%(<<\)\@<!"\([^"]*\)"\%(>>\)\@!': '<<"\1">>',
        \   }
        \ ]
augroup END
" Has annoying signs and better let syntaxerl take care of this using standard
" syntastic
let g:erlang_show_errors = 0
let g:syntastic_erlang_checkers = ['syntaxerl']
" Checker's don't work for android so we'll just disable them
let g:syntastic_java_checkers = []
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
" }}}
"
" python {{{
au FileType python setlocal sw=4 ts=4 sts=4
let g:syntastic_python_checkers = ['python', 'pyflakes'] " pylint removed
let g:pymode_lint_write          = 0
let g:pymode_run_key             = 'R'
let g:pymode_folding             = 0
let g:pymode_rope                = 0
let g:pymode_lint_checker        = 'pyflakes'
let g:pymode_lint                = 0
let g:pymode_rope_lookup_project = 0
" don't show the annoying docs unless necessary
autocmd FileType python setlocal completeopt-=preview
let g:jedi#goto_assignments_command = "<c-x><c-a>"
let g:jedi#goto_definitions_command = "<c-x><c-d>"
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#rename_command = "<c-x><c-r>"
let g:jedi#usages_command = "<c-x><c-u>"
" }}}
" gtags
" cscope
set cscopetag                  " 使用 cscope 作为 tags 命令
set cscopeprg='gtags-cscope'   " 使用 gtags-cscope 代替 cscope
" gtags
let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1