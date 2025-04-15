"-------------------------------------------------------------------------------
" Basic 基本配置
"-------------------------------------------------------------------------------
" 定义快捷键的前缀，即 <Leader>
let mapleader=","

" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

set autoread

" 开启实时搜索功能
set incsearch
" 高亮显示搜索结果
set hlsearch
" 启用终端真彩色显示，提高代码可读性
set termguicolors

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
"set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 在插入模式下，按下 Tab 键时插入的空格数
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

" 设置对齐线 excellent
 set list listchars=nbsp:¬,tab:»·,trail:·,extends:>

filetype plugin on

" 剪贴板 
" 复制和粘贴: `"*y` 和 `"*p` 来进行复制（yank) 和 粘贴（paste)
" 设置了下面后，可以直接使用y和p
" set clipboard=unnamed
" 可视模式下复制到剪贴板
set clipboard=unnamed,unnamedplus " 同时使用两者
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
noremap <silent><leader>tt :tabnew<cr>
noremap <silent><leader>g :tabclose<cr>
noremap <silent><leader>1 :tabn 1<cr>
noremap <silent><leader>2 :tabn 2<cr>
noremap <silent><leader>3 :tabn 3<cr>
noremap <silent><leader>4 :tabn 4<cr>
noremap <silent><leader>5 :tabn 5<cr>
noremap <silent><s-tab> :tabnext<CR>
inoremap <silent><s-tab> <ESC>:tabnext<CR>

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
"Plug 'Valloric/YouCompleteMe'
Plug 'ervandew/supertab'
Plug 'dstein64/vim-startuptime'
Plug 'chr4/nginx.vim'
Plug 'kshenoy/vim-signature'
Plug 'morhetz/gruvbox'
Plug 'christoomey/vim-tmux-navigator'
Plug 'preservim/vimux'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'mbbill/undotree'
Plug 'vim-autoformat/vim-autoformat'
Plug 'honza/vim-snippets'
"Plug 'wscrlhs/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'rhysd/git-messenger.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
Plug 'preservim/nerdcommenter'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'voldikss/vim-floaterm'
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"typescript
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
"Plug 'jparise/vim-graphql'        " GraphQL syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug '907th/vim-auto-save'
Plug 'andrewstuart/vim-kubernetes'
Plug 'dyng/ctrlsf.vim'


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
if isdirectory(expand("~/.vim/plugged/gruvbox/"))
    " 配色方案
	"set background=light
	set background=dark
    let g:solarized_termcolors=256
    let g:solarized_termtrans=1
    let g:solarized_contrast="normal"
    let g:solarized_visibility="normal"
    "colorscheme solarized
    colorscheme gruvbox
	"let g:gruvbox_contrast_dark="soft"
endif


"-------------------------------------------------------------------------------
" Nerdtree 
"-------------------------------------------------------------------------------
if isdirectory(expand("~/.vim/plugged/nerdtree/"))
    map <C-e> <plug>NERDTreeTabsToggle<CR>
    map <leader>e :NERDTreeFind<CR>
	" 自启动设置 
	"autocmd vimenter * NERDTree

    let g:NERDTreeIgnore = ['^node_modules$']

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
        nnoremap <silent> <leader>t :TagbarToggle<CR>

    "autocmd VimEnter * nested :TagbarOpen
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
if isdirectory(expand("~/.vim/plugged/ctrlp.vim/"))
    let g:ctrlp_working_path_mode = 'ra'
    nnoremap <silent> <C-p> :CtrlP<CR>
    "nnoremap <silent> <C-m> :CtrlPMRU<CR>
    nnoremap <silent> <leader>b :CtrlPBuffer<CR>
    "nnoremap <silent> <C-b> :CtrlPBuffer<CR>
    nnoremap <silent> <C-m> :CtrlPMixed<CR>
    let g:ctrlp_custom_ignore = {
                \ 'dir':  '\.git$\|\.hg$\|\.svn$',
                \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

    " CtrlP extensions
    let g:ctrlp_extensions = ['funky', 'line']

    "let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
                            "\ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']

    "ctrlp-funky
    nnoremap <Leader>fu :CtrlPFunky<Cr>
    " narrow the list down with a word under cursor
    nnoremap <Leader>uu :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
    " f you want to have this highlight feature
    let g:ctrlp_funky_matchtype = 'path'
    let g:ctrlp_funky_syntax_highlight = 1
    let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
endif


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
if isdirectory(expand("~/.vim/plugged/vim-go/"))

    "let g:go_def_mode='gopls'
    "let g:go_info_mode='gopls'

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

	let g:go_debug_workdir = '.'

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

endif

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
" markdown-preview
"-------------------------------------------------------------------------------
    nmap <C-s> <Plug>MarkdownPreviewToggle
    "nmap <M-s> <Plug>MarkdownPreviewStop
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
    map <Leader>gr :call VimuxRunCommand("go run " . bufname("%"))<CR>
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
" fzf
"-------------------------------------------------------------------------------
    nnoremap <leader>o :Files!<CR>
    nnoremap <silent> <Leader>ag :Ag <CR>
    nnoremap <leader>rg :Rg!<CR>
    nnoremap <leader>tg :Tags<CR>
    nnoremap <leader>m :Marks<CR>
    nnoremap <leader>b :Buffers<CR>
    nnoremap <leader>h :History<CR>
    nnoremap <leader>l :Lines<CR>
    nnoremap <leader>a :CtrlSF -R ""<Left>

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
	" 一些增强功能
	let g:fzf_preview_window = ['right:60%', 'ctrl-/'] " 设置预览窗口，并在右侧显示 60% 宽度，使用 ctrl-/ 切换预览窗口的显示和隐藏
	"let g:fzf_preview_center = 'hidden' " 默认隐藏预览窗口


	" Gruvbox Dark 风格的 fzf 颜色配置
	let g:fzf_colors = {
	\ 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
	\ 'hl':      ['#b16286', 'Comment'],
	\ 'fg+':     ['#ebdbb2', 'CursorLine', 'CursorColumn', 'Normal'],
	\ 'bg+':     ['#3c3836', 'Normal', 'Normal'],
	\ 'hl+':     ['#fb4934', 'Normal'],
	\ 'info':    ['#fabd2f', 'Normal'],
	\ 'border':  ['#928374', 'Normal'],
	\ 'prompt':  ['#83a598', 'Normal'],
	\ 'marker':  ['#fe8019', 'Normal'],
	\ 'spinner': ['#8ec07c', 'Normal'],
	\ 'header':  ['#83a598', 'Normal'],
	\ }

    "" Customize fzf colors to match your color scheme
    "" - fzf#wrap translates this to a set of `--color` options
    "let g:fzf_colors =
    "\ { 'fg':      ['fg', 'Normal'],
      "\ 'bg':      ['bg', 'Normal'],
      "\ 'hl':      ['fg', 'Comment'],
      "\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      "\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      "\ 'hl+':     ['fg', 'Statement'],
      "\ 'info':    ['fg', 'PreProc'],
      "\ 'border':  ['fg', 'Ignore'],
      "\ 'prompt':  ['fg', 'Conditional'],
      "\ 'pointer': ['fg', 'Exception'],
      "\ 'marker':  ['fg', 'Keyword'],
      "\ 'spinner': ['fg', 'Label'],
    "  \ 'header':  ['fg', 'Comment'] }

    " Enable per-command history
    " - History files will be stored in the specified directory
    " - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
    "   'previous-history' instead of 'down' and 'up'.
    let g:fzf_history_dir = '~/.local/share/fzf-history'
	" 使用 fd 命令 (需要安装 fd: brew install fd) 速度更快
	if executable('fd')
	  let g:fzf_files_command = 'fd -t f'
	  let g:fzf_dir_command = 'fd -t d'
	endif

    " [Buffers] Jump to the existing window if possible
    let g:fzf_buffers_jump = 1
    " [[B]Commits] Customize the options used by 'git log':
    let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
    " [Tags] Command to generate tags file
    let g:fzf_tags_command = 'ctags -R'
    " [Commands] --expect expression for directly executing the command
    let g:fzf_commands_expect = 'alt-enter,ctrl-x'

	nnoremap <silent> <C-p>: Files«CR>
	nnoremap <silent> <C-g> :GFiles<CR>
	"noremap <silent> <C-o> :Buffers<CR>
	"noremap <C-f> :Rg!


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
" coc
"-------------------------------------------------------------------------------

    " Location of the coc-settings.json file
    let g:coc_config_home = "~/.config/vem"

    let g:coc_global_extensions = [
      \ 'coc-snippets',
      \ 'coc-pairs',
      \ 'coc-tsserver',
      \ 'coc-eslint', 
      \ 'coc-prettier', 
      \ 'coc-json', 
      \ 'coc-go',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-yaml',
      \ 'coc-highlight',
      \ ]
    " from readme
    " if hidden is not set, TextEdit might fail.
    set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
    set updatetime=300

    " don't give |ins-completion-menu| messages.
    set shortmess+=c

    " always show signcolumns
    set signcolumn=yes

    command! -nargs=0 Prettier :CocCommand prettier.formatFile

    " function name(type args) { }
    "假設使用如上的語法片段，需要修改 name, type, args 名稱
    "語法片段如果有設計好的話，一開始會選取 name ，修改完後
    "跳下一個選取 type，然後是 args，預設是 <Ctrl-j> 跳下一個"
    "" Use <C-j> for jump to next placeholder, it's default of coc.nvim
    let g:coc_snippet_next = '<c-j>'

    "" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
    let g:coc_snippet_prev = '<c-k>'

    " Use tab for trigger completion with characters ahead and navigate
    " NOTE: There's always complete item selected by default, you may want to enable
    " no select by `"suggest.noselect": true` in your configuration file
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config
    inoremap <silent><expr> <TAB>
          \ coc#pum#visible() ? coc#pum#next(1) :
          \ CheckBackspace() ? "\<Tab>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

    " Make <CR> to accept selected completion item or notify coc.nvim to format
    " <C-g>u breaks current undo, please make your own choice
    inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                                  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    function! CheckBackspace() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()
    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
    " Coc only does snippet and additional edit on confirm.
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    " Or use `complete_info` if your vim support it, like:
    "inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

    " Use `[g` and `]g` to navigate diagnostics
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)
    " Remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
    " Use K to show documentation in preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>
    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

    " Highlight symbol under cursor on CursorHold
    autocmd CursorHold * silent call CocActionAsync('highlight')

   " " Remap for rename current word
    "nmap <F2> <Plug>(coc-rename)
    "" Remap for format selected region
    "xmap <leader>f  <Plug>(coc-format-selected)
    "nmap <leader>f  <Plug>(coc-format-selected)
    "augroup mygroup
      "autocmd!
      "" Setup formatexpr specified filetype(s).
      "autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      "" Update signature help on jump placeholder
      "autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    "augroup end

    "" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
    "xmap <leader>a  <Plug>(coc-codeaction-selected)
    "nmap <leader>a  <Plug>(coc-codeaction-selected)
    "" Remap for do codeAction of current line
    "nmap <leader>ac  <Plug>(coc-codeaction)
    "" Fix autofix problem of current line
    "nmap <leader>qf  <Plug>(coc-fix-current)
    "" Create mappings for function text object, requires document symbols feature of languageserver.
    "xmap if <Plug>(coc-funcobj-i)
    "xmap af <Plug>(coc-funcobj-a)
    "omap if <Plug>(coc-funcobj-i)
    "omap af <Plug>(coc-funcobj-a)
    "" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
    ""nmap <silent> <C-d> <Plug>(coc-range-select)
    ""xmap <silent> <C-d> <Plug>(coc-range-select)
    "" Use `:Format` to format current buffer
    "command! -nargs=0 Format :call CocAction('format')

    "" Use `:Fold` to fold current buffer
    "command! -nargs=? Fold :call     CocAction('fold', <f-args>)

    "" use `:OR` for organize import of current buffer
    "command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

    "" Add status line support, for integration with other plugin, checkout `:h coc-status`
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

    " Using CocList
    " Show all diagnostics
    nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions
    nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
    " Show commands
    nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document
    nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols
    nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list
    nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


"-------------------------------------------------------------------------------
" autosave
"-------------------------------------------------------------------------------
    " enable AutoSave on Vim startup
    let g:auto_save = 0  
    let g:auto_save_events = ["InsertLeave", "TextChanged"]
    "" do not display the auto-save notification
    "let g:auto_save_silent = 1  

"-------------------------------------------------------------------------------
" vim-kubernetes
"-------------------------------------------------------------------------------

	au FileType yaml nmap <leader>ka :KubeApply<CR>
	au FileType yaml nmap <leader>kd :KubeDelete<CR>

	au FileType yaml nmap <leader>kad :KubeApplyDir<CR>
	au FileType yaml nmap <leader>kdd :KubeDeleteDir<CR>


"-------------------------------------------------------------------------------
" 自定义函数
"-------------------------------------------------------------------------------

	" 清除所有的寄存器
	function! ClearRegisters()
		let regs='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"'
		let i=0
		while (i<strlen(regs))
			exec 'let @'.regs[i].'=""'
			let i=i+1
		endwhile
	endfunction

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

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
