#!/bin/bash

# 创建 custom/plugins 目录（如果不存在）
mkdir -p ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins
mkdir -p ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes

# 安装插件
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/MichaelAquilina/zsh-auto-notify.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/auto-notify

git clone https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions

git clone https://github.com/zsh-users/zsh-history-substring-search.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

# 安装 powerlevel10k 主题
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# 提示用户重启终端
echo "安装完成！请重启终端或执行 'source ~/.zshrc' 使更改生效。"
