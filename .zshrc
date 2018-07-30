export TZ=America/New_York

export AUTO_TITLE_SCREENS="NO"

export PROMPT="
%{$fg[white]%}(%D %*) <%?> [%~] $program %{$fg[default]%}
%{$fg[cyan]%}%m %#%{$fg[default]%} "

export RPROMPT=

set-title() {
echo -e "\e]0;$*\007"
}

ssh() {
    set-title $*;
    /usr/bin/ssh -2 $*;
    set-title $HOST;
}

# COLORS 
alias tmux="TERM=xterm-256color tmux"

# Start tmux on connect
if [[ -z ${TMUX+x} ]]; then
    TOP_SESSION=`tmux ls | grep -o '^\d+'`
    `tmux detach`
    `tmux a $TOP_SESSION`
fi

# Say it with me: "I am a lazy asshole"
alias vi=vim
alias routes='vi ./config/routes.rb'
alias sz='source .zshrc'
alias st='tmux source-file ~/.tmux.conf'
alias clock_in='zsh BaketrisHomeDir/src/BaketrisHomeDir/scripts/countdown.zsh -d'

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

hours() {
    kinit_if_needed
    name=${1-$USERNAME}
    read -r today this_week <<< $(kcurl -m 2 -s -L https://chaces-lab.corp.amazon.com/tools/time/$name.json | jq -r '[.today,.this_week] | @tsv');
    left_today=`echo "sclae=2; $((8.00-$today))" | bc -l`
	left_today_rounded=`printf "%.2f" $left_today`
    left_week=`echo "sclae=2; $((40.00-$this_week))" | bc -l`
	left_week_rounded=`printf "%.2f" $left_week`
    echo "Hello $name, you have worked \e[92m$today \033[0mhours today and \e[92m$this_week \033[0mhours this week."
	echo "You will need to work \e[91m$left_today_rounded \033[0mmore hours today and \e[91m$left_week_rounded \033[0mmore hours this week."
}

chaces_hours() {
     members=( $(/usr/bin/ldapsearch -x -H ldap://ldap.amazon.com:389 -b "ou=posix groups,ou=infrastructure,o=amazon.com" -s sub -a always -z 1000 "(&(cn=chaces))" "memberuid" | grep '^memberuid' | grep -o -E '\S+$' | paste -sd ' ') )
     for member in "${members[@]}";
     do 
       if [ "$member" = "kumichae" ] || [ "$member" = "ditjason" ]
       then
          echo "  Fuck you $member. You have left us :(" 
       else
         hours $member
         fi  
     done
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
