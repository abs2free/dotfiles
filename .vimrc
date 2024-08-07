"==============================================================================
" File: .vimrc
"===============================================================================


"-------------------------------------------------------------------------------
" Identify platform 
"-------------------------------------------------------------------------------
silent function! OSX()
return has('macunix')
endfunction

silent function! LINUX()
return has('unix') && !has('macunix') && !has('win32unix')
endfunction

silent function! WINDOWS()
return  (has('win32') || has('win64')) || has("multi_byte")
endfunction


"-------------------------------------------------------------------------------
" Basic 基本配置
"-------------------------------------------------------------------------------
" 定义快捷键的前缀，即 <Leader>
let mapleader=","

" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 开启实时搜索功能
set incsearch
" 高亮显示搜索结果
set hlsearch

" 搜索时大小写不敏感
set ignorecase

" 关闭兼容模式
set nocompatible

" vim 自身命令行模式智能补全
set wildmenu wildmode=full
" 利用通配符进行缓冲区跳转
set wildchar=<Tab> wildcharm=<C-Z>
" 设置快捷键
noremap <c-n> :b <c-z>

" 禁止光标闪烁
set gcr=a:block-blinkon0

" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 总是显示状态栏
set laststatus=2

" 显示光标当前位置
set ruler

" 开启行号显示
set number
" 相对展示行号
set relativenumber

" 高亮显示当前行/列
set cursorline
set cursorcolumn


" 禁止折行
set nowrap
" 设置自动折行
"set wrap

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" 将制表符扩展为空格
set expandtab

" 设置编辑时制表符占用空格数
set tabstop=4

" 设置格式化时制表符占用空格数
set shiftwidth=4

" 让vim 把连续数量的空格视为一个制表符
set softtabstop=4

" 设置vim显示字体
set guifont=YaHei\ Consolas\ Hybrid\ 11.5

" 编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

" 文件格式
set fileformats=unix,mac,dos
set termencoding=utf-8

" 语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn

" 启动 vim 时折叠代码
"set foldenable
" 启动 vim 时关闭折叠代码
set nofoldenable
" 基于缩进或语法进行代码折叠
set foldmethod=indent
"set foldmethod=syntax
" 设置折叠标志宽度
set foldcolumn =1
" 指定折叠缩进级别
set foldlevel =0


"-------------------------------------------------------------------------------
" 高级配置 
"-------------------------------------------------------------------------------
" 编码转gbk
noremap <leader>gbk :e ++enc=gbk<CR>
noremap <leader>utf :e ++enc=utf-8<CR>

" Ctrl-A 选中所有内容
"noremap <silent>  <Leader>a  gg v G

" 多窗口操作
noremap <C-J> <C-W>j<C-W>
noremap <C-K> <C-W>k<C-W>
noremap <C-L> <C-W>l<C-W>
noremap <C-H> <C-W>h<C-W>

" For clever completion with the :find command
set path+=**

" Search
set ignorecase smartcase
set grepprg=grep\ -IrsnH

if WINDOWS()
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

" 缩写 ,ctrl-v取消效果
iab @i wscrlhs@gmail.com

" 设置对齐线 excellent
 set list listchars=nbsp:¬,tab:»·,trail:·,extends:>

" 自启动设置 
"autocmd vimenter * NERDTree

" ctrl+s 实现保存功能
nmap <C-S> :w<CR>
vmap <C-S> <C-C>:w<CR>
imap <C-S> <Esc>:w<CR>

filetype plugin on

" 剪贴板 
" 复制和粘贴: `"*y` 和 `"*p` 来进行复制（yank) 和 粘贴（paste)
" 设置了下面后，可以直接使用y和p
" set clipboard=unnamed
" 可视模式下复制到剪贴板
set clipboard=unnamed,autoselect
set guioptions+=a

"打开文件时恢复光标位置
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>

set history=10000

" %% 轻松展开当前文件所在的目录
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'

" 对以选中的内容进行查找
" * 正向查找
" # 反向查找
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR> 
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
function! s:VSetSearch()
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

" css 自动补全
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" tab 快捷命令
noremap <silent><tab>m :tabnew<cr>
noremap <silent><tab>e :tabclose<cr>
noremap <silent><tab>n :tabn<cr>
noremap <silent><tab>p :tabp<cr>
noremap <silent><leader>t :tabnew<cr>
noremap <silent><leader>g :tabclose<cr>
noremap <silent><leader>1 :tabn 1<cr>
noremap <silent><leader>2 :tabn 2<cr>
noremap <silent><leader>3 :tabn 3<cr>
noremap <silent><leader>4 :tabn 4<cr>
noremap <silent><leader>5 :tabn 5<cr>
noremap <silent><leader>6 :tabn 6<cr>
noremap <silent><leader>7 :tabn 7<cr>
noremap <silent><leader>8 :tabn 8<cr>
noremap <silent><leader>9 :tabn 9<cr>
noremap <silent><leader>0 :tabn 10<cr>
noremap <silent><s-tab> :tabnext<CR>
inoremap <silent><s-tab> <ESC>:tabnext<CR>


"-------------------------------------------------------------------------------
"  函数
"-------------------------------------------------------------------------------
"拼写检查
"if has('spell')
"  setglobal spelllang=en_us
"  setglobal spellfile=~/.vim/spell/en.utf-8.add
"  "if &rtp =~# 'Dropbox.Code.vim'
"  "  setglobal spellfile^=~/Dropbox/Code/vim/spell/en.utf-8.add
"  "endif
"  let g:spellfile_URL = 'http://ftp.vim.org/vim/runtime/spell'
"  autocmd FileType help if &buftype ==# 'help' | setlocal nospell | endif
"endif


"统计中文字数
"function! ChineseCount() range
"	let save = @z
"	silent exec 'normal! gv"zy'
"	let text = @z
"	let @z = save
"	silent exec 'normal! gv'
"	let cc = 0
"	for char in split(text, '\zs')
"		if char2nr(char) >= 0x2000
"			let cc += 1
"		endif
"	endfor
"	echo "Count of Chinese charasters is:"
"	echo cc
"endfunc
"
"vnoremap <F7> :call ChineseCount()<cr>

"-------------------------------------------------------------------------------
" 插件管理 
" PlugInstall [name ...] [#threads]	Install plugins
" PlugUpdate [name ...] [#threads]	Install or update plugins
" PlugClean[!]	Remove unlisted plugins (bang version will clean without prompt)
" PlugUpgrade	Upgrade vim-plug itself
" PlugStatus	Check the status of plugins
" PlugDiff	Examine changes from the previous update and the pending changes
" PlugSnapshot[!] [output path]	Generate script for restoring the current snapshot of the plugins
" vim-plug 
" 安装  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"-------------------------------------------------------------------------------
set rtp+=/usr/local/opt/fzf
call plug#begin()

Plug 'VundleVim/Vundle.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'enricobacis/vim-airline-clock'
Plug 'airblade/vim-gitgutter'
Plug 'godlygeek/tabular'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'AndrewRadev/splitjoin.vim'
Plug 'junegunn/vim-emoji'
Plug 'majutsushi/tagbar'
Plug 'Valloric/YouCompleteMe'
Plug 'ervandew/supertab'
Plug 'dstein64/vim-startuptime'
Plug 'chr4/nginx.vim'
Plug 'kshenoy/vim-signature'
Plug 'morhetz/gruvbox'

Plug 'christoomey/vim-tmux-navigator'
Plug 'preservim/vimux'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'tacahiroy/ctrlp-funky'

Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

Plug 'plasticboy/vim-markdown'

Plug 'tpope/vim-fugitive'

Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'

Plug 'mbbill/undotree'


Plug 'vim-autoformat/vim-autoformat'

" 这个插件需要私人定制 https://keelii.com/2018/08/26/vim-plugin-ultisnips-advanced-tips/
"Plug 'SirVer/ultisnips'

Plug 'honza/vim-snippets'
"Plug 'wscrlhs/vim-snippets'

Plug 'tpope/vim-surround'

Plug 'rhysd/git-messenger.vim'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }

" <leader>cc 注释当前行和选中行
" <leader>cn 没有发现和\cc有区别
" <leader>c<空格> 如果被选区域有部分被注释，则对被选区域执行取消注释操作，其它情况执行反转注释操作
" <leader>cm 对被选区域用一对注释符进行注释，前面的注释对每一行都会添加注释
" <leader>ci 执行反转注释操作，选中区域注释部分取消注释，非注释部分添加注释
" <leader>cs 添加性感的注释，代码开头介绍部分通常使用该注释
" <leader>cy 添加注释，并复制被添加注释的部分
" <leader>c$ 注释当前光标到改行结尾的内容
" <leader>cA 跳转到该行结尾添加注释，并进入编辑模式
" <leader>ca 转换注释的方式，比如： /**/和//
" <leader>cl \cb 左对齐和左右对其，左右对其主要针对/**/
" <leader>cu 取消注释
Plug 'preservim/nerdcommenter'

Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'voldikss/vim-floaterm'

" 不再使用的
"Plug 'vimwiki/vimwiki'
"Plug 'itchyny/calendar.vim'

Plug 'airblade/vim-rooter'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" 插件列表结束
call plug#end()



"===============================================================================
       "配置项
"-------------------------------------------------------------------------------
" Airline 
"-------------------------------------------------------------------------------
if isdirectory(expand("~/.vim/plugged/vim-airline/"))
    " 设置状态栏主题风格
    "let g:airline_theme='solarized'
    let g:airline_theme='serene'
    "let g:airline_theme='distinguished'

    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|' " Must be first line
    let g:airline#extensions#tabline#formatter = 'unique_tail'
    let g:airline#extensions#clock#updatetime = 1000
    let g:airline#extensions#clock#format = '%H:%M:%S'
endif


"-------------------------------------------------------------------------------
" Vim-Color 
"-------------------------------------------------------------------------------
"if isdirectory(expand("~/.vim/plugged/gruvbox/"))
    " 配色方案
    "set background=light
    set background=dark
    let g:solarized_termcolors=256
    let g:solarized_termtrans=1
    let g:solarized_contrast="normal"
    let g:solarized_visibility="normal"
    "colorscheme solarized                                                                               │    │
    colorscheme gruvbox
"endif


"-------------------------------------------------------------------------------
" Nerdtree 
"-------------------------------------------------------------------------------
if isdirectory(expand("~/.vim/plugged/nerdtree/"))
    map <C-e> <plug>NERDTreeTabsToggle<CR>
    map <leader>e :NERDTreeFind<CR>
    nmap <leader>nt :NERDTreeFind<CR>

    let NERDTreeShowBookmarks=1
    let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
    let NERDTreeChDirMode=0
    let NERDTreeQuitOnOpen=1
    let NERDTreeMouseMode=2
    let NERDTreeShowHidden=1
    let NERDTreeKeepTreeInNewTab=1
    let g:nerdtree_tabs_open_on_gui_startup=0

    let g:NERDTreeGitStatusIndicatorMapCustom= {
                \ "Modified"  : "✹",
                \ "Staged"    : "✚",
                \ "Untracked" : "✭",
                \ "Renamed"   : "➜",
                \ "Unmerged"  : "═",
                \ "Deleted"   : "✖",
                \ "Dirty"     : "✗",
                \ "Clean"     : "✔︎",
                \ 'Ignored'   : '☒',
                \ "Unknown"   : "?"
                \ }

    " NERDTress File highlighting
     function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
     exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
     exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
     endfunction

    call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
    call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
    call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
    call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
    call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
    call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
    call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
endif

"-------------------------------------------------------------------------------
" TagBar 
"-------------------------------------------------------------------------------
    if isdirectory(expand("~/.vim/plugged/tagbar/"))
        nnoremap <silent> <leader>tt :TagbarToggle<CR>

    autocmd VimEnter * nested :TagbarOpen
    endif



"-------------------------------------------------------------------------------
" Easymotion 
"-------------------------------------------------------------------------------
if isdirectory(expand("~/.vim/plugged/vim-easymotion/"))
    let g:EasyMotion_smartcase = 1

    " keep cursor colum when JK motion
    "let g:EasyMotion_startofline = 0

    " 全局设置成单个<leader>
    "map <Leader> <Plug>(easymotion-prefix)

    map <Leader><leader>h <Plug>(easymotion-linebackward)
    map <Leader><Leader>j <Plug>(easymotion-j)
    map <Leader><Leader>k <Plug>(easymotion-k)
    map <Leader><leader>l <Plug>(easymotion-lineforward)

    " 重复上一次操作, 类似repeat插件, 很强大
    map <Leader><leader>. <Plug>(easymotion-repeat)
endif


"-------------------------------------------------------------------------------
" Incsearch 
"-------------------------------------------------------------------------------
if isdirectory(expand("~/.vim/plugged/incsearch.vim/"))
    let g:incsearch#auto_nohlsearch = 1
    map n  <Plug>(incsearch-nohl-n)
    map N  <Plug>(incsearch-nohl-N)
    map *  <Plug>(incsearch-nohl-*)
    map #  <Plug>(incsearch-nohl-#)
    map g* <Plug>(incsearch-nohl-g*)
    map g# <Plug>(incsearch-nohl-g#)

    " You can use other keymappings like <C-l> instead of <CR> if you want to
    " use these mappings as default search and somtimes want to move cursor with
    " EasyMotion.
    function! s:incsearch_config(...) abort
        return incsearch#util#deepextend(deepcopy({
                    \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
                    \   'keymap': {
                    \     "\<CR>": '<Over>(easymotion)'
                    \   },
                    \   'is_expr': 0
                    \ }), get(a:, 1, {}))
    endfunction
    noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
    noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
    noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

    "function! s:config_easyfuzzymotion(...) abort
    "    return extend(copy({
    "                \   'converters': [incsearch#config#fuzzyword#converter()],
    "                \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
    "                \   'keymap': {"\<CR>": '<Over>(easymotion)'},
    "                \   'is_expr': 0,
    "                \   'is_stay': 1
    "                \ }), get(a:, 1, {}))
    "endfunction
    "noremap <silent><expr> <Space>/  incsearch#go(<SID>config_easyfuzzymotion())
    "noremap <silent><expr> <Space>?  incsearch#go(<SID>config_easyfuzzymotion({'command': '?'}))
    "noremap <silent><expr> <Space>g/ incsearch#go(<SID>config_easyfuzzymotion({'is_stay': 1}))
endif


"-------------------------------------------------------------------------------
" YouCompleteMe 
"-------------------------------------------------------------------------------
if isdirectory(expand("~/.vim/plugged/YouCompleteMe/"))
    if OSX()
        let g:acp_enableAtStartup = 0

        " enable completion from tags
        let g:ycm_collect_identifiers_from_tags_files = 1

        " remap Ultisnips for compatibility for YCM
        let g:UltiSnipsExpandTrigger = '<C-j>'
        let g:UltiSnipsJumpForwardTrigger = '<C-j>'
        let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
        let g:ycm_key_invoke_completion = '<c-z>'

        " Enable omni completion.
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
        autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
        autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

       " 颜色配置
       "highlight Pmenu ctermfg=12 ctermbg=0 guifg=#ffffff guibg=#000000
       "highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black
       "highlight Conceal guifg=White guibg=Red
       " 由于YCM的警告语句在黑色终端下配色很模糊，修改成较为高亮的蓝底黑字
       "highlight link YcmWarningSection Pmenu

        " Haskell post write lint and check with ghcmod
        " $ `cabal install ghcmod` if missing and ensure
        " ~/.cabal/bin is in your $PATH.
        if !executable("ghcmod")
            autocmd BufWritePost *.hs GhcModCheckAndLintAsync
        endif

        " For snippet_complete marker.
        if !exists("g:spf13_no_conceal")
            if has('conceal')
                set conceallevel=2 concealcursor=i
            endif
        endif

        " Disable the neosnippet preview candidate window
        " When enabled, there can be too much visual noise
        " especially when splits are used.
        set completeopt-=preview

        " lsp-service
        let s:lsp = '/Users/wscrlhs/work/github/lsp-examples'
        let g:ycm_language_server = [
            \   {
            \     'name': 'php',
            \     'cmdline': [ 'php', expand( s:lsp . '/php/vendor/bin/php-language-server.php' ) ],
            \     'filetypes': [ 'php' ],
            \     'lua': ['.', ':'],
            \   },
            \ ]
    endif
endif


"-------------------------------------------------------------------------------
" Undotree 
"-------------------------------------------------------------------------------
" set backup
if has('persistent_undo')
    " Maximum number of changes that can be undone
    set undolevels=1000

    " Maximum number lines to save for undo on a buffer reload
    set undoreload=100000

    set undodir=~/.vim/undodir
    set undofile " Maintain undo history between sessions

endif

if isdirectory(expand("~/.vim/plugged/undotree/"))
    nnoremap <Leader>u :UndotreeToggle<CR>

    " If undotree is opened, it is likely one wants to interact with it.
    let g:undotree_SetFocusWhenToggle=1

endif

"-------------------------------------------------------------------------------
" Ctrlp 
"-------------------------------------------------------------------------------
"if isdirectory(expand("~/.vim/plugged/ctrlp.vim/"))
    "let g:ctrlp_working_path_mode = 'ra'
    "nnoremap <silent> <C-p> :CtrlP<CR>
    "nnoremap <silent> <C-m> :CtrlPMRU<CR>
    "nnoremap <silent> <C-b> :CtrlPBuffer<CR>
    ""nnoremap <silent> <C-m> :CtrlPMixed<CR>
    "let g:ctrlp_custom_ignore = {
                "\ 'dir':  '\.git$\|\.hg$\|\.svn$',
                "\ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

    "" CtrlP extensions
    "let g:ctrlp_extensions = ['funky']

    ""ctrlp-funky
    "nnoremap <Leader>fu :CtrlPFunky<Cr>
    "" narrow the list down with a word under cursor
    "nnoremap <Leader>uu :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
    "" f you want to have this highlight feature
    "let g:ctrlp_funky_matchtype = 'path'
    "let g:ctrlp_funky_syntax_highlight = 1
"endif


"-------------------------------------------------------------------------------
" LeaderF
"-------------------------------------------------------------------------------
if isdirectory(expand("~/.vim/plugged/LeaderF/"))
    " don't show the help in normal mode
    let g:Lf_HideHelp = 1
    let g:Lf_UseCache = 0
    let g:Lf_UseVersionControlTool = 0
    let g:Lf_IgnoreCurrentBufferName = 1
    " popup mode
    let g:Lf_WindowPosition = 'popup'
    let g:Lf_PreviewInPopup = 1
    let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
    let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
    let g:Lf_CommandMap = {'<C-K>': ['<Up>'], '<C-J>': ['<Down>']}

    let g:Lf_NormalCommandMap = {
         \ "*":      {
         \               "<C-Down>": "<C-J>",
         \               "<C-Up>":   "<C-K>"
         \           },
         \ "File":   {
         \               "q":     "<Esc>",
         \               "a":     "<C-A>",
         \               "<Esc>": "<C-W>",
         \           },
         \ "Buffer": {},
         \ "Mru":    {},
         \ "Tag":    {},
         \ "BufTag": {},
         \ "Function": {},
         \ "Line":   {},
         \ "History":{},
         \ "Help":   {},
         \ "Rg":     {},
         \ "Gtags":  {},
         \ "Colorscheme": {}
         \}

     let g:Lf_ShortcutF = "<leader>ff"
     nnoremap <silent> <Leader>rg :Leaderf rg<CR>
     nnoremap <silent> <Leader>mru :Leaderf mru<CR>
     noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
     noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
     noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
     noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

     noremap<C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
     noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>

     " search visually selected text literally
     xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
     noremap go :<C-U>Leaderf! rg --recall<CR>

endif

"-------------------------------------------------------------------------------
" fzf
"-------------------------------------------------------------------------------
    nnoremap <leader>f :Files<CR>
    nnoremap <silent> <Leader>ag :Ag <CR>
    nnoremap <leader>rg :Rg <cr>
    nnoremap <leader>tg :Tags<CR>
    nnoremap <leader>m :Marks<CR>
    nnoremap <leader>b :Buffers<CR>
    nnoremap <leader>h :History

    " An action can be a reference to a function that processes selected lines
    function! s:build_quickfix_list(lines)
      call setqflist(map(copy(a:lines), '{ "filename": v:val, "lnum": 1 }'))
      copen
      cc
    endfunction

    let g:fzf_action = {
      \ 'ctrl-q': function('s:build_quickfix_list'),
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

    " Default fzf layout
    " - Popup window (center of the current window)
    let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true } }


    " Customize fzf colors to match your color scheme
    " - fzf#wrap translates this to a set of `--color` options
    let g:fzf_colors =
    \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

    " Enable per-command history
    " - History files will be stored in the specified directory
    " - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
    "   'previous-history' instead of 'down' and 'up'.
    let g:fzf_history_dir = '~/.local/share/fzf-history'

    " [Buffers] Jump to the existing window if possible
    let g:fzf_buffers_jump = 1
    " [[B]Commits] Customize the options used by 'git log':
    let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
    " [Tags] Command to generate tags file
    let g:fzf_tags_command = 'ctags -R'
    " [Commands] --expect expression for directly executing the command
    let g:fzf_commands_expect = 'alt-enter,ctrl-x'


    " Custom statusline
    function! s:fzf_statusline()
    " Override statusline as you like
    highlight fzf1 ctermfg=161 ctermbg=251
    highlight fzf2 ctermfg=23 ctermbg=251
    highlight fzf3 ctermfg=237 ctermbg=251
    setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
    endfunction

    autocmd! User FzfStatusLine call fzf_statusline()


"-------------------------------------------------------------------------------
" Vim-Go 
" :GoRun :GoBuild :GoInstall
"
" :GoDef          # goto definition of object under cursor
" gd              # also has the same effect
" Ctrl-O / Ctrl-I # hop back to your source file/return to definition
"
" :GoDoc          # opens up a side window for quick documentationn
" K               # also has the same effect
"
"
" :GoTest         # run every *_test.go file and report results
" :GoTestFunc     # or just test the function under your cursor
" :GoCoverage     # check your test coverage
" :GoAlternate	# switch bewteen your test case and implementation
"
" :GoImport       # manage and name your imports
" :GoImportAs
" :GoDrop
"
" :GoRename       # precise renaming of identifiers
"
" :GoLint         # lint your code
" :GoVer
" :GoErrCheck
"
" :GoAddTags      # manage your tags
" :GoRemoveTags
"-------------------------------------------------------------------------------
    let g:go_def_mode='gopls'
    let g:go_info_mode='gopls'

    let g:go_fmt_command = "goimports"
    let g:go_fmt_fail_silently = 1
    let g:go_fmt_autosave = 1

    let g:go_addtags_transform = "camelcase"
    let g:go_highlight_types = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_function_calls = 1
    let g:go_highlight_operators = 0
    let g:go_highlight_extra_types = 1
    let g:go_highlight_build_constraints = 1
    " Automatically get signature/type info for object under cursor
    let g:go_auto_type_info = 1

    
    let g:go_metalinter_autosave = 0
    let g:go_metalinter_command = "golangci-lint"
    let g:go_metalinter_autosave_enabled = ['vet', 'staticcheck', 'gosimple']
    "let g:go_metalinter_deadline = "5s"
    let g:go_fmt_experimental = 1

    " highlight same variable in view
    let g:go_auto_sameids = 1
    let g:go_list_type = "quickfix"
    let g:go_test_timeout = '10s'
    autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

    nnoremap <leader>c :cclose<CR>
    autocmd FileType go nmap <leader>r  <Plug>(go-run)

    "let g:go_debug=['lsp']
    
    " 我自定义的
    "noremap <leader>gl :GoLint<CR>
    noremap <leader>gf :GoFmt<CR> 
    noremap <leader>gl :GoMetaLinter<CR>

    " In the quickfix window, <CR> is used to jump to the error under the
    " cursor, so undefine the mapping there.
    "autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
    " quickfix window 正下方位置
    autocmd FileType qf wincmd J


"-------------------------------------------------------------------------------
" vim-markdown 
"-------------------------------------------------------------------------------
    "The following commands are useful to open and close folds:
    "
    "zr: reduces fold level throughout the buffer
    "zR: opens all folds
    "zm: increases fold level throughout the buffer
    "zM: folds everything all the way
    "za: open a fold your cursor is on
    "zA: open a fold your cursor is on recursively
    "zc: close a fold your cursor is on
    "zC: close a fold your cursor is on recursively
    
    let g:vim_markdown_folding_style_pythonic = 1
    let g:vim_markdown_toc_autofit = 1
    let g:vim_markdown_json_frontmatter = 1


"-------------------------------------------------------------------------------
" vim-fugitive 
"-------------------------------------------------------------------------------
    " Fugitive Conflict Resolution
    nnoremap <leader>gd :Gvdiff!<CR>
    "nnoremap gdh :diffget //2<CR>
    "nnoremap gdl :diffget //3<CR>




"-------------------------------------------------------------------------------
" vim-snippets
"-------------------------------------------------------------------------------
    "let g:UltiSnipsExpandTrigger="<leader><space>"
    let g:UltiSnipsExpandTrigger="<leader><tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"
    let g:UltiSnipsSnippetDirectories=["UltiSnips", "plugged/vim-snippets"]


""------------------------------------------------------------------------------
" vim - emoji
"-------------------------------------------------------------------------------
    set completefunc=emoji#complete



"-------------------------------------------------------------------------------
" vim-wiki
" Basic key bindings
" <Leader>ww -- Open default wiki index file.
" <Leader>wt -- Open default wiki index file in a new tab.
" <Leader>ws -- Select and open wiki index file.
" <Leader>wd -- Delete wiki file you are in.
" <Leader>wr -- Rename wiki file you are in.
" <Enter> -- Follow/Create wiki link.
" <Shift-Enter> -- Split and follow/create wiki link.
" <Ctrl-Enter> -- Vertical split and follow/create wiki link.
" <Backspace> -- Go back to parent(previous) wiki link.
" <Tab> -- Find next wiki link.
" <Shift-Tab> -- Fid previous wiki link.
" Advanced key bindings
" Refer to the complete documentation at :h vimwiki-mappings to see many more bindings.
"-------------------------------------------------------------------------------
"   " calendar
"    map <F8> :Calendar<cr>
"    autocmd FileType calendar nmap <buffer> <CR> :<C-u>call vimwiki#diary#calendar_action(b:calendar.day().get_day(), b:calendar.day().get_month(), b:calendar.day().get_year(), b:calendar.day().week(), "V")<CR>
"
"    let g:vimwiki_list = [{'path': '~/doc/vim/vimwiki/', 'ext': '.md', 'syntax': 'markdown'}]

    " <leader>ww 在当前窗口打开维基首页
    " <leader>wt 在新tab打开维基首页
    " <leader>w<leader>w 打开/新建当天日记
    " <leader>w<keader>t 在新tab打开/新建当天日记
    " <leader>ws 选择维基项目（详见下面的“多个维基项目”一节）


"-------------------------------------------------------------------------------
" markdown-preview
"-------------------------------------------------------------------------------
    nmap <C-s> <Plug>MarkdownPreview
    nmap <M-s> <Plug>MarkdownPreviewStop
   " nmap <C-p> <Plug>MarkdownPreviewToggle


"-------------------------------------------------------------------------------
" git-messenger
"-------------------------------------------------------------------------------
    nmap <Leader>gm <Plug>(git-messenger)


"-------------------------------------------------------------------------------
" floaterm
"-------------------------------------------------------------------------------
    let g:floaterm_width = 0.95
    let g:floaterm_height = 0.95
    noremap <leader>lg :FloatermNew lazygit<CR>


"-------------------------------------------------------------------------------
" vimux
"-------------------------------------------------------------------------------
    map <Leader>gt :call VimuxRunCommand("go test -run " .go#util#TestName()." -v")<CR>

    let g:VimuxOrientation = "h"

    " Prompt for a command to run
    map <Leader>vp :VimuxPromptCommand<CR>

    " Run last command executed by VimuxRunCommand
    map <Leader>vl :VimuxRunLastCommand<CR>

    " Inspect runner pane
    map <Leader>vi :VimuxInspectRunner<CR>

    " Close vim tmux runner opened by VimuxRunCommand
    map <Leader>vq :VimuxCloseRunner<CR>

    " Interrupt any command running in the runner pane
    map <Leader>vx :VimuxInterruptRunner<CR>

    " Zoom the runner pane (use <bind-key> z to restore runner pane)
    map <Leader>vz :call VimuxZoomRunner()<CR>

    " Clear the terminal screen of the runner pane.
    map <Leader>v<C-l> :VimuxClearTerminalScreen<CR>

"-------------------------------------------------------------------------------
" 防止覆盖,在末尾配置
"-------------------------------------------------------------------------------
    "add the '$' sign as change command indicator
    set cpoptions+=$
    
    " 显示输入的命令
    set showcmd
    
    " 支持使用鼠标
    set mouse=a
    
    " 打开英语单词的拼写检查 excellent
    "set spell spelllang=en_us
    
    " 设置超过80长度提示
    set colorcolumn=121

    " so $VIMRUNTIME/syntax/colortest.vim
    hi ColorColumn ctermbg=yellow

    " The IME to invoke for managing input languages (macos, fcitx, ibus, xkb-switch)
    let g:barbaric_ime = 'macos'

    let g:python3_host_prog="/usr/local/bin/python3"

"-------------------------------------------------------------------------------
" 参考 
"-------------------------------------------------------------------------------
  " https://www.jianshu.com/p/bb91582317ed
