" Vundle 插件管理器
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" 导入插件
Bundle 'https://github.com/vim-scripts/vundle'
Bundle 'https://github.com/Lokaltog/vim-powerline'
"Bundle 'https://github.com/nathanaelkane/vim-indent-guides'
Bundle 'https://github.com/vim-scripts/a.vim'
Bundle 'https://github.com/vim-scripts/fcitx.vim'
Bundle 'https://github.com/scrooloose/nerdcommenter'
" 自动提示关键字
Bundle 'https://github.com/Shougo/neocomplete.vim'
Bundle 'https://github.com/vim-scripts/SuperTab'
" 语法检查
Bundle 'https://github.com/scrooloose/syntastic'
" 快速移动
Bundle 'Lokaltog/vim-easymotion'
" 高亮方案
Bundle 'lsdr/monokai'

" Taglist插件的Tags文件地址
set tags=tags;
set autochdir
filetype plugin indent on
filetype on

" 文件编码
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,big5,cp936,cp932,shift-jis,eus-jp,iso-2022-jp
set termencoding=utf-8
set encoding=utf-8
set fileformats=unix,dos,mac
" 行号
set nu!
" 语法高亮
syntax enable
syntax on
" 实时搜索
set incsearch
" 隐藏菜单(Gvim)
set wildmenu
" 始终显示状态栏
set laststatus=2
" 高亮搜索结果
set hlsearch
" 状态栏显示列号
set ruler
" 状态栏显示命令
set showcmd
" 颜色和背景
set background=dark
colorscheme koehler
let g:Powerline_colorscheme='solarized256'
" 搜索模式里忽略大小写
set ignorecase        
" 如果搜索模式包含大写字符，不使用 'ignorecase'选项。
set smartcase        
" 自动把内容写回文件 
set autowrite        
" 提权强制写入
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!


" Fcitx插件要求的
set timeoutlen=0

" 缩进设置
set smartindent
" 不将Tab展开为Space, 主要写Makefile用
set noexpandtab
set cindent
set tabstop=4
set softtabstop=4 
set shiftwidth=4
" 显示缩进导引线
"let g:indent_guides_enable_on_vim_startup=1
"let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" 基于缩进或语法进行代码折叠
" set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时展开折叠代码
set nofoldenable

" 自定义快捷键前导符
" let mapleader=";"
" nmap <Leader>y "+y
" nmap <Leader>p "+p


" Taglist插件的Tags文件地址
set tags=tags;
set autochdir
" 自动打开Taglist
let Tlist_Auto_Open=1
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1 
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" 自动语法模板
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" 自动补全SuperTab设定
let g:SuperTabRetainCompletionType=2
" 0 - 不记录上次的补全方式
" 1 - 记住上次的补全方式,直到用其他的补全命令改变它
" 2 - 记住上次的补全方式,直到按ESC退出插入模式为止
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplete#close_popup()
"inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
set completeopt+=longest
let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" end of neo complete

" 快速移动设定
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

""set guifont=WenQuanYi\ Zen\ Hei\ Mono\ 12

func! CompileScss()
	exec "w"
	let compilecmd="!sass %:%<\.css"
	exec compilecmd
endfunc
func! CompileCode()
	exec "w"
	if &filetype == "scss"
		exec "call CompileScss()"
	endif
endfunc
map <F5> :call CompileCode()<CR>
imap <F5> <ESC>:call CompileCode()<CR>
vmap <F5> <ESC>:call CompileCode()<CR>
