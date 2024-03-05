-- [[ Setting options ]]
-- See `:help vim.o`

local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 4 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 4 -- 2 spaces for indent width
opt.softtabstop = 4
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.smartindent = true

opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 2

-- line wrapping
opt.wrap = false -- disable line wrapping
opt.foldenable = false -- 启动 vim 时关闭折叠代码
opt.foldmethod = "indent" -- 基于缩进或语法进行代码折叠
opt.foldcolumn="1" -- " 设置折叠标志宽度
opt.foldlevel=0 -- " 指定折叠缩进级别

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

opt.iskeyword:append("-") -- consider string-string as whole word

opt.backup = false
opt.backupskip = { '/tmp/*', '/private/tmp/*' }


-- 设置undodir文件位置
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand('~/.vim/undodirvim')

-- 折叠
opt.foldenable=true
opt.foldmethod="expr"
opt.foldexpr="nvim_treesitter#foldexpr()"
opt.foldlevel=99

opt.showcmd=true


opt.colorcolumn="121" -- " 设置超过80长度提示

return {}
