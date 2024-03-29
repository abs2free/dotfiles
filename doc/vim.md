<!-- START doctoc generated TOC please keep comment here to allow auto update -->

<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [基础](#%E5%9F%BA%E7%A1%80)
  - [one](#one)
  - [two](#two)
  - [插入](#%E6%8F%92%E5%85%A5)
  - [删除](#%E5%88%A0%E9%99%A4)
  - [拷贝](#%E6%8B%B7%E8%B4%9D)
  - [其他](#%E5%85%B6%E4%BB%96)
- [进阶](#%E8%BF%9B%E9%98%B6)
  - [查找](#%E6%9F%A5%E6%89%BE)
  - [跳转](#%E8%B7%B3%E8%BD%AC)
  - [其他](#%E5%85%B6%E4%BB%96-1)
  - [`leader`](#leader)
  - [滚动缓冲区](#%E6%BB%9A%E5%8A%A8%E7%BC%93%E5%86%B2%E5%8C%BA)
- [{command} {text object or motions}](#command-text-object-or-motions)
  - [text object](#text-object)
  - [motions](#motions)
  - [combine with commands](#combine-with-commands)
  - [example](#example)
- [高级](#%E9%AB%98%E7%BA%A7)
  - [寄存器](#%E5%AF%84%E5%AD%98%E5%99%A8)
  - [文件](#%E6%96%87%E4%BB%B6)
  - [折叠](#%E6%8A%98%E5%8F%A0)
  - [标记](#%E6%A0%87%E8%AE%B0)
  - [标签](#%E6%A0%87%E7%AD%BE)
  - [自动补全](#%E8%87%AA%E5%8A%A8%E8%A1%A5%E5%85%A8)
- [Vimscript](#vimscript)
  - [基础](#%E5%9F%BA%E7%A1%80-1)
- [插件](#%E6%8F%92%E4%BB%B6)
  - [vundle](#vundle)
  - [nerdtree](#nerdtree)
  - [nerdcommenter](#nerdcommenter)
  - [ctrlp , ctrlp-funky](#ctrlp--ctrlp-funky)
  - [vim-fugitive](#vim-fugitive)
  - [vim-easymotion](#vim-easymotion)
  - [incsearch,incsearch-fuzzy,incsearch-easymotion](#incsearchincsearch-fuzzyincsearch-easymotion)
  - [undotree](#undotree)
  - [fzf](#fzf)
- [参考](#%E5%8F%82%E8%80%83)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## 基础

### one

| 快捷键     | 功能说明             |
| ------- | ---------------- |
| `h`     | 光标向左移动           |
| `j`     | 光标向下移动           |
| `k`     | 光标向上移动           |
| `l`     | 光标向右移动           |
| `<Esc>` | 按`ESC`回到Normal模式 |
| `:q`    | 退出               |
| `:q!`   | 退出不保存            |
| `:w`    | 保存               |
| `:wq`   | 保存并退出            |

<br>[⬆ Back to top](#table-of-contents)

### two

| 快捷键  | 功能说明                |
| ---- | ------------------- |
| `w`  | 移动到下一个单词的开头。        |
| `b`  | 移动到上一个单词的开头。        |
| `W`  | 跳过下一个单词             |
| `e`  | 移动到下一个单词的结尾。        |
| `ge` | 反向移动到上一个单词的结尾。      |
| `E`  | 跳过到下一个单词的结尾。        |
| `0`  | 到行头                 |
| `$`  | 到行尾                 |
| `^`  | 到本行第一个不是blank字符的位置  |
| `g_` | 到本行最后一个不是blank字符的位置 |

<br>[⬆ Back to top](#table-of-contents)

### 插入

| 快捷键       | 功能说明        |
| --------- | ----------- |
| `i`       | 在光标前插入      |
| `I`       | 插入到行头       |
| `a`       | 在光标后插入      |
| `o`  (小写) | 在当前行后插入一个新行 |
| `O`  (大写) | 在当前行前插入一个新行 |
| `A`       | 插入到行尾       |
| `r`       | 替换单个字符      |
| `R`       | 替换后面的字符     |

<br>[⬆ Back to top](#table-of-contents)

### 删除

| 快捷键 | 功能说明         |
| --- | ------------ |
| `x` | 删当前光标所在的一个字符 |
| `X` | 删当前光标前一个字符   |
| `d` | 删除           |
| `D` | 删除到行尾        |

<br>[⬆ Back to top](#table-of-contents)

### 拷贝

| 快捷键  | 功能说明     |
| ---- | -------- |
| `y`  | 拷贝       |
| `Y`  | 拷贝到行尾    |
| `yy` | 拷贝当前行    |
| `p`  | 粘贴到当前字符后 |
| `P`  | 粘贴到当前字符前 |

<br>[⬆ Back to top](#table-of-contents)

### 其他

| 快捷键                      | 功能说明      |
| ------------------------ | --------- |
| `.`                      | 重复上一次的命令  |
| `u`                      | `undo`    |
| `<C-r>`                  | `redo`    |
| `:e <path/to/file>`      | 打开文件      |
| `:saveas <path/to/file>` | 另存为       |
| `:help <command>`        | 显示相关命令的帮助 |

<br>[⬆ Back to top](#table-of-contents)

## 进阶

### 查找

| 快捷键       | 功能说明             |
| --------- | ---------------- |
| `/`       | 向后查找             |
| `?`       | 向后查找             |
| `<Enter>` | 提交查找             |
| `n`       | 下一个查找结果          |
| `N`       | 上一个查找结果          |
| `fa`      | 到下一个为a的字符处       |
| `;`       | 重复查找上次f命令所查找的字符  |
| `,`       | 重反转方向查找上次的字符查找命令 |

<br>[⬆ Back to top](#table-of-contents)

### 跳转

| 快捷键  | 功能说明         |
| ---- | ------------ |
| `gg` | 到第一行         |
| `G`  | 到最后一行        |
| `NG` | 到第N行         |
| `%`  | 跳转到匹配括号      |
| `zz` | 当前行置于屏幕正中央   |
| `H`  | 光标移动到窗口顶部    |
| `M`  | 光标移动到窗口顶部    |
| `L`  | 光标移动到窗口顶部    |
| `*`  | 移动光标到下一个匹配单词 |
| `#`  | 移动光标到上一个匹配单词 |

<br>[⬆ Back to top](#table-of-contents)

### 其他

| 快捷键               | 功能说明            |
| ----------------- | --------------- |
| `<`               | 左缩进             |
| `>`               | 右缩进             |
| `=`               | 自动给缩进           |
| `~`               | 大小写切换           |
| `gU`              | 变大写             |
| `gu`              | 变小写             |
| `J`               | 把所有的行连接起来（变成一行） |
| `<C-v>`           | 选择区块            |
| `<C-n>` , `<C-p>` | 自动提示            |
| `q:`              | 显示命令历史          |
| `q/`              | 显示搜索历史          |
| `ctrl+u`          | 向上滚屏查看          |
| `ctrl+d`          | 向下滚屏查看          |
| `:x , ZZ 或:wq`    | 保存并退出           |
| `:split`          | 创建分屏            |
| `:vsplit`         | 创建垂直分屏          |
| `s`               | 删除光标所在的字符并开始插入  |
| `S`               | 删除光标所在行并开始插入    |
| `"+y`             | 复制到系统剪贴板        |
| `"+p`             | 系统剪贴版的内容拷贝到vim  |

<br>[⬆ Back to top](#table-of-contents)

### `leader`

| 快捷键                      | 功能说明           |
| ------------------------ | -------------- |
| `,`                      | 快捷键 `<leader>` |
| `<leader>ev`             | 打开vimrc文件      |
| `<leader>sv`             | 重新加载vimrc文件    |
| `<leader>jk`             | `<esc>`快捷键     |
| `<leader>",',<,(,[,{,**` | 单词两端包围字符       |
| `<Leader>m`              | 在结对符之间跳转       |
| `<leader>gbk`            | 编码转gbk         |
| `<leader>utf`            | 编码转utf-8       |

<br>[⬆ Back to top](#table-of-contents)

### 滚动缓冲区

| 快捷键                | 功能说明 |
| ------------------ | ---- |
| `<ctrl-f(orward)>` | 向前   |
| `<ctrl-b(back)>`   | 向后   |
| `<ctrl-d(own)>`    | 向下   |
| `<ctrl-u(up)>`     | 向上   |

<br>[⬆ Back to top](#table-of-contents)

## {command} {text object or motions}

### text object

| 快捷键 | 功能说明       |
| --- | ---------- |
| `w` | words      |
| `s` | sentences  |
| `p` | paragraphs |
| `t` | tags       |

<br>[⬆ Back to top](#table-of-contents)

### motions

| 快捷键 | 功能说明          |
| --- | ------------- |
| `a` | all           |
| `i` | in            |
| `t` | til           |
| `f` | find forward  |
| `F` | find backword |

<br>[⬆ Back to top](#table-of-contents)

### combine with commands

| 快捷键 | 功能说明                                       |
| --- | ------------------------------------------ |
| `d` | delete (also cut)                          |
| `c` | change (delete , then place in insert mode |
| `y` | yark (copy)                                |
| `v` | visually select                            |

<br>[⬆ Back to top](#table-of-contents)

### example

| 快捷键   | 功能说明                                                           |
| ----- | -------------------------------------------------------------- |
| `diw` | delete in word                                                 |
| `caw` | change all word                                                |
| `yi)` | yank all text inside parentheses                               |
| `va"` | visually select all inside doublequotes Including doublequotes |
| `yt,` | 复制到逗号                                                          |
| `dt"` | 删除到双引号                                                         |

<br>[⬆ Back to top](#table-of-contents)

## 高级

### 寄存器

| 快捷键       | 功能说明                      |
| --------- | ------------------------- |
| `q{a-z}`  | 记录键入的字符，存入寄存器 {a-z}       |
| `q{A-Z}`  | 记录键入的字符，添加进寄存器 {a-z}      |
| `q`       | 终止记录                      |
| `@{a-z}`  | 执行寄存器 {a-z} 的内容 (N 次)     |
| `@@`      | 重复上次的 @{a-z} 操作 (N 次)     |
| `:@{a-z}` | 将寄存器 {a-z} 的内容当作 Ex 命令来执行 |
| `:@@`     | 重复上次的 :@{a-z} 操作          |

<br>[⬆ Back to top](#table-of-contents)

### 文件

| 快捷键       | 功能说明        |
| --------- | ----------- |
| `:bn`     | 下一个文件       |
| `:bp`     | 上一个文件       |
| `:ls`     | 列出打开的文件，带编号 |
| `:b{1~n}` | 切换至第n个文件    |
| `:bd`     | 关闭当前文件      |

<br>[⬆ Back to top](#table-of-contents)

### 折叠

| 快捷键  | 功能说明          |
| ---- | ------------- |
| `zc` | 关闭当前打开的折叠     |
| `zo` | 打开当前的折叠       |
| `zm` | 关闭所有折叠        |
| `zM` | 关闭所有折叠及其嵌套的折叠 |
| `zr` | 打开所有折叠        |
| `zR` | 打开所有折叠及其嵌套的折叠 |
| `zd` | 删除当前折叠        |
| `zE` | 删除所有折叠        |
| `zj` | 移动至下一个折叠      |
| `zk` | 移动至上一个折叠      |
| `zn` | 禁用折叠          |
| `zN` | 启用折叠          |

<br>[⬆ Back to top](#table-of-contents)

### 标记

| 快捷键            | 功能说明                   |
| -------------- | ---------------------- |
| `m{a-zA-Z}`    | 保存书签，小写的是文件书签,大写的是全局书签 |
| `'{a-zA-Z}`    | 跳转到某个书签                |
| `'0`           | 跳转入现在编辑的文件中上次退出的位置     |
| `''`           | 跳转如最后一次跳转的位置           |
| `'"`           | 跳转至最后一次编辑的位置           |
| `g'{mark}`     | 跳转到书签                  |
| `:delm {mark}` | 删除一个书签                 |
| `:delm!`       | 删除全部书签                 |
| `:marks`       | 显示系统全部书签               |

<br>[⬆ Back to top](#table-of-contents)

### 标签

| 快捷键                      | 功能说明                             |
| ------------------------    | -------------------------            |
| `:tabe[dit] {filename}`     | 在新标签页中打开 {filename}          |
| `<C-w>T`                    | 把当前窗口移到一个新标签页           |
| `:tabc[lose]`               | 关闭当前标签页及其中的所有窗口       |
| `:tabo[nly]`                | 只保留活动标签页，关闭所有其他标签页 |
| `:tabn[ext] {N}` or `{N}gt` | 切换到编号为 {N} 的标签页            |
| `:tabn[ext]` or `gt`        | 切换到下一标签页                     |
| `:tabp[revious]` or `gT`    | 切换到上一标签页                     |


<br>[⬆ Back to top](#table-of-contents)

### 自动补全

| 快捷键   | 功能说明                 |
| ----- | -------------------- |
| `]s`  | 跳到下一处拼写错误            |
| `[s`  | 跳到上一处拼写错误            |
| `z=`  | 为当前单词提供更正建议          |
| `zg`  | 把当前单词添加到拼写文件中        |
| `zw`  | 把当前单词从拼写文件中删除        |
| `zug` | 撤销针对当前单词的 zg 或 zw 命令 |

<br>[⬆ Back to top](#table-of-contents)

## Vimscript

### 基础

| 快捷键                         | 功能说明                         |
| --------------------------- | ---------------------------- |
| `" this is annotation line` | 添加注释                         |
| `set number/nonumber`       | 显示/关闭行号                      |
| `map/unmap`                 | 基本映射(增加/删除)                  |
| `nmap/vmap/imap`            | 模式映射(`normal/visual/insert`) |
| `*noremap`                  | 非递归映射(与`*map`系列的命令对应)        |

<br>[⬆ Back to top](#table-of-contents)

## 插件

### [vundle](https://github.com/vundlevim/vundle.vim)

| 快捷键                 | 功能说明                                                                   |
| ------------------- | ---------------------------------------------------------------------- |
| `:PluginList`       | lists configured plugins                                               |
| `:PluginInstall`    | installs plugins; append `!` to update or just :PluginUpdate           |
| `:PluginSearch foo` | searches for foo; append `!` to refresh local cache                    |
| `:PluginClean`      | confirms removal of unused plugins; append `!` to auto-approve removal |

<br>[⬆ Back to top](#table-of-contents)

### [nerdtree](https://github.com/scrooloose/nerdtree)

| 快捷键          | 功能说明                   |
| ------------ | ---------------------- |
| `<leader>e`  | `:NERDTreeFind<CR>`    |
| `<leader>nt` | `:NERDTreeFind<CR>`    |
| `o`          | 打开文件或目录                |
| `p`          | 回到上层目录                 |
| `P`          | 回到根目录                  |
| `m`          | 打开文件系统操作菜单，添加，删除，移动和复制 |
| `?`          | 打开帮助文档，再按一次就会关闭        |

<br>[⬆ Back to top](#table-of-contents)

### [nerdcommenter](https://github.com/scrooloose/nerdcommenter)

| 快捷键                | 功能说明              |
| ------------------ | ----------------- |
| `<leader>cc`       | 加注释               |
| `<leader>cu`       | 解开注释              |
| `<leader>c<space>` | 加上/解开注释, 智能判断     |
| `<leader>cy`       | 先复制, 再注解(p可以进行黏贴) |

<br>[⬆ Back to top](#table-of-contents)

### [ctrlp](https://github.com/kien/ctrlp.vim) , [ctrlp-funky](https://github.com/tacahiroy/ctrlp-funky)

| 快捷键               | 功能说明                            |
| ----------------- | ------------------------------- |
| `<C-p>`           | 启动文件查找功能，后续的所有操作都要使用这个操作        |
| `<C-f>` , `<C-b>` | 在files/buf/mru files/funky中来回切换 |
| `<C-d>`           | 只查找文件名，而不是全路径                   |
| `<C-j>` , `<C-k>` | 在查找列表中上下切换                      |

<br>[⬆ Back to top](#table-of-contents)

### [vim-fugitive](https://github.com/tpope/vim-fugitive)

| 快捷键             | 功能说明                       |
| --------------- | -------------------------- |
| `Git <command>` | `git <command>`            |
| `Gstatus`       | `git status`               |
| `Gwrite`        | `git add`                  |
| `Gcommit`       | `git commit`               |
| `Gpush`         | `git push`                 |
| `Gremove`       | `git rm`                   |
| `Gmove`         | `git mv`                   |
| `Gread`         | `git checkout -- filename` |
| `Gdiff`         | `git diff`                 |
| `Gbalme`        | `git blame`                |
| `Ggrep`         | `git grep`                 |
| `Glog`          | `git log`                  |

<br>[⬆ Back to top](#table-of-contents)

### [vim-easymotion](https://github.com/easymotion/vim-easymotion)

| 快捷键                 | 功能说明       |
| ------------------- | ---------- |
| `<leader><leader>w` | 跳转到当前光标前位置 |
| `<leader><leader>b` | 跳转到当前光标后位置 |
| `<leader><leader>s` | 搜索跳转       |
| `<leader><leader>j` | 行级跳转下      |
| `<leader><leader>k` | 行级跳转上      |
| `<leader><leader>h` | 行级跳转左      |
| `<leader><leader>l` | 行级跳转右      |
| `<leader><leader>.` | 重复上一次动作    |

<br>[⬆ Back to top](#table-of-contents)

### [incsearch](https://github.com/haya14busa/incsearch.vim),[incsearch-fuzzy](https://github.com/haya14busa/incsearch-fuzzy.vim),[incsearch-easymotion](https://github.com/haya14busa/incsearch-easymotion.vim)

| 快捷键        | 功能说明    |
| ---------- | ------- |
| `/`        | 向前查找    |
| `?`        | 向后查找    |
| `<Space>/` | 全局模糊查找  |
| `<Space>/` | 向前模糊查查找 |
| `<Space>?` | 向后模糊查查找 |
| `<Ctrl-j>` | 向下查找    |
| `<Ctrl-k>` | 向上查找    |

<br>[⬆ Back to top](#table-of-contents)

### [undotree](https://github.com/mbbill/undotree)

| 快捷键                | 功能说明                           |
| ------------------ | ------------------------------ |
| `mkdir ~/.undodir` | 创建本地缓存目录                       |
| `<leader>u`        | 打开undotree面板                   |
| `>num<`            | current change                 |
| `{num}`            | change to redo                 |
| `[num]`            | the last change                |
| `  s  `            | saved changes                  |
| `  S  `            | last saved change              |
| `<cr>`             | Revert to current              |
| `<2-LeftMouse>`    | Revert to current              |
| `u`                | Undo                           |
| `<c-r>`            | Redo                           |
| `<`                | Revert to previous saved state |
| `>`                | Revert to next saved state     |
| `J`                | Revert to previous state       |
| `K`                | Revert to next state           |
| `D`                | Toggle diff panel              |
| `T`                | Toggle relative timestamp      |
| `C`                | Clear undo history             |
| `<tab>`            | Set Focus to editor            |
| `q`                | Close this panel               |
| `?`                | Toggle quick help              |

<br>[⬆ Back to top](#table-of-contents)

### [fzf](https://github.com/junegunn/fzf)

| 快捷键             | 功能说明           |
| --------------- | -------------- |
| `<leader>f`     | 快速搜索当前工程目录下的文件 |
| `<leader>b`     | 快速搜索buffer     |
| `<Esc> 或 <C-c>` | 退出 fzf         |
| `               | <leader>A`     |

<br>[⬆ Back to top](#table-of-contents)

## 参考

[vim中文手册](http://vimcdoc.sourceforge.net/doc/help.html) 
[简明 VIM 练级攻略](https://coolshell.cn/articles/5426.html) 
[笨方法学Vimscript](http://learnvimscriptthehardway.onefloweroneworld.com/) 
