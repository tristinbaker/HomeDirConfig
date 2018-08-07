export TZ=America/New_York

export AUTO_TITLE_SCREENS="NO"

export PROMPT="
%{$fg[white]%}(%D %*) <%?> [%~] $program %{$fg[default]%}
%{$fg[cyan]%}%m %#%{$fg[default]%} "

set-title() {
echo -e "\e]0;$*\007"
}

# COLORS 
alias tmux="TERM=xterm-256color tmux"

# Say it with me: "I am a lazy asshole"
alias vi=vim
alias routes='vi ./config/routes.rb'
alias sz='cd && source .zshrc && cd -'
alias st='tmux source-file ~/.tmux.conf'
alias gits='git status'
alias gita='git add .'
alias controllers='vim app/controllers/'
alias models='vim app/models/'
alias views='vim app/views/'
alias ls='ls --color=auto'
alias pgadmin='sh ~/HomeDirConfig/scripts/pgadmin.sh'

# Fun stuff
alias lyrics='zsh ~/BaketrisHomeDir/src/BaketrisHomeDir/scripts/lyrics.sh'
alias taste='zsh ~/BaketrisHomeDir/src/BaketrisHomeDir/scripts/taste.sh -i'
alias weather='zsh ~/BaketrisHomeDir/src/BaketrisHomeDir/scripts/weather.sh'
alias todo='zsh ~/BaketrisHomeDir/src/BaketrisHomeDir/scripts/todo.sh'
alias stocks='zsh ~/BaketrisHomeDir/src/BaketrisHomeDir/scripts/stocks.sh'
alias 2048='zsh ~/BaketrisHomeDir/src/BaketrisHomeDir/scripts/2048.sh'
alias minesweeper='zsh ~/BaketrisHomeDir/src/BaketrisHomeDir/scripts/minesweeper.sh'
alias periodic='zsh ~/BaketrisHomeDir/src/BaketrisHomeDir/scripts/periodic_table.sh'
alias zalgo='ruby ~/BaketrisHomeDir/src/BaketrisHomeDir/scripts/zalgo.rb'

cheat() {
    if [ "$1" != "" ]
    then
        if [ "$2" != "" ]
        then 
            curl cht.sh/"$1"/"$2"
        fi
    fi
}

my_dudes() {
    day=$(date +"%u")

    if ((day == 3)); then
        echo ":frog::frog::frog: It is Wednesday, my dudes! :frog::Frog::frog:"        
    else
        echo "It is not Wednesday, my dudes. :cry:"
    fi
}

remove_carriage_returns() {
    sed $'s/\r//'
}

cut_trailing_newline(){
    awk 'NR>1{print PREV} {PREV=$0} END{printf("%s",$0)}'
}
