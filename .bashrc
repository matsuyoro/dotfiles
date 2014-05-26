


# .rvmを読み込む
# RVM rvm => rbenv に移行するのでコメントアウト！？
# [ -s ${HOME}/.rvm/scripts/rvm ] && source ${HOME}/.rvm/scripts/rvm

# rbenv 
# rbenv自体はインストールしているが、brewでrubyとjrubyがインストールされているようだけど。。確認する
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
if which rbenv > /dev/null; then
    export RBENV_ROOT="${HOME}/.rbenv"
    export PATH=${RBENV_ROOT}/shims:${PATH}
    eval "$(rbenv init -)";
fi

################
# 開発関係アナウンス
################

# cocos2dx テンプレートクリエイト
echo mycocos_create -project MyGame2 -package com.MyCompany.AwesomeGame -language cpp
alias mycocos_create='python create_project.py'


################
# user alias
################

alias mygrep='find ./ -type f -print | xargs grep -n '

# 大文字小文字区別なしver
alias mygrep_ul='find ./ -type f -print | xargs grep -nir '
alias mywget='wget -r -L -l 10 '
alias myh_save='cat ~/.bash_history >> ~/myTemp/bash_history'

################
# 環境設定カスタマイズ 
################

# bash_history
HISTSIZE=2000       # 現在使用中のbashが保持する履歴数
HISTFILESIZE=2000   # 履歴ファイルに保存される履歴数

################
# user command 
################

# ターミナル検索追加
# --------------------------------------
# Google search from terminal
# --------------------------------------
echo "ターミナル検索 g test  [-c/-f/-s]" 
g(){
    if [ $(echo $1 | egrep "^-[cfs]$") ]; then
        local opt="$1"
            shift
            fi
            local url="https://www.google.co.jp/search?q=${*// /+}"
            local app="/Applications"
            local c="${app}/Google Chrome.app"
            local f="${app}/Firefox.app"
            local s="${app}/Safari.app"
            case ${opt} in
            "-c")   open "${url}" -a "$c";;
    "-f")   open "${url}" -a "$f";;
    "-s")   open "${url}" -a "$s";;
    *)      open "${url}";;
    esac
}

# .secret_bashrcを読み込む
if [ -f ~/.secret_bashrc ] ; then
. ~/.secret_bashrc
fi

