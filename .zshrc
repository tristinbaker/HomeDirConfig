source /apollo/env/envImprovement/var/zshrc

export BRAZIL_WORKSPACE_DEFAULT_LAYOUT=short

export TZ=America/New_York
export PATH="$PATH:/apollo/env/GordianKnot/bin"

for f in SDETools envImprovement AmazonAwsCli OdinTools; do
    if [[ -d /apollo/env/$f ]]; then
        export PATH=$PATH:/apollo/env/$f/bin
    fi
done

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
alias e=emacs
alias bb=brazil-build

# Say it with me: "I am a lazy asshole"
alias vi=vim
alias cg='cd && cd Workspaces/CHACES_GeneralWebsite/src/CHACES_GeneralWebsite/rails-root/'
alias sp='cd && cd Workspaces/SupportWebsite/src/SupportWebsite/rails-root/'
alias sf='cd && cd Workspaces/ShuffleWebsite/src/ShuffleWebsite/rails-root/'
alias cl='cd && cd Workspaces/CHACES_LabWebsite/src/CHACES_LabWebsite/rails-root/'
alias bt='cd && cd BaketrisHomeDir/src/BaketrisHomeDir/'
alias ag='cd && cd Workspaces/AvantGuards/src/AvantGuardsWebsite/rails-root/'
alias routes='vi ./config/routes.rb'
alias sz='source .zshrc'
alias st='tmux source-file ~/.tmux.conf'
alias create_workspace='zsh ~/BaketrisHomeDir/src/BaketrisHomeDir/scripts/create_workspace.sh'
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

alt_caps_post() {
   message="{\"message\": `jq -R -s -a 'tostring'`}"
   curl -s "https://nuf5mb9kog.execute-api.us-east-1.amazonaws.com/beta/every-other-letter" -X POST -d $message | jq -r 'tostring' | rev | cut -c 1- | rev | cut_trailing_newline
 }

test_post() {
    content="{\"Content\": `jq -R -s -a 'tostring'`}"
    echo $content
    curl -X POST "https://hooks.chime.aws/incomingwebhooks/7218e10f-5107-4247-9cb0-ce8130ddb790?token=VjVxaGlrRTN8MXxHRHN6SHg2RGtlZEpQWEJDQjJFNkRlLU53UnRRRmJFWjB1UXZ6a1pkZFpF" -H "Content-Type:application/json" --data $content
}

music_post() {
    content="{\"Content\": `jq -R -s -a 'tostring'`}" 
    curl -X POST "https://hooks.chime.aws/incomingwebhooks/249f07b6-9980-4c7a-9289-4a6c3a753dbc?token=NnB2eWkwaVl8MXw1eWlGdlNtRUNnSEdOZXczMWM4aC1CZktpaDFqZVlvYlAxX0FkVjNybkhF" -H "Content-Type:application/json" --data $content
}

chaces_post() {
    content="{\"Content\": `jq -R -s -a 'tostring'`}" 
    echo $content
    curl -X POST "https://hooks.chime.aws/incomingwebhooks/83545802-1b3d-4162-b202-c863f4b4d1c8?token=RnVIcDg2NDJ8MXxEdU5HX1BsdjFQY3RvTi1HU3Bmdk9FbnpDM0ptQ1FubHZDMzhha2g2YXgw" -H "Content-Type:application/json" --data $content
}

alt_test_post() {
    alt_caps_post | test_post

}
alt_music_post() {
    alt_caps_post | music_post
}

alt_chaces_post() {
    alt_caps_post | chaces_post
}

wednesday_test_post() {
    my_dudes | test_post
}

papi_lookup() {
   user_id=${1-$USERNAME}
   kcurl -sX GET --header "Accept: application/json" "https://papi.integ.amazon.com/employee/login:$user_id?expand=all" | jq
}

random_employee() {
    ruby ~/BaketrisHomeDir/src/BaketrisHomeDir/scripts/random_employee.rb
}

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

kinit_if_needed() {
    if ! klist -s; then kinit -f; fi
}

my_dudes() {
    day=$(date +"%u")

    if ((day == 3)); then
        echo ":frog::frog::frog: It is Wednesday, my dudes! :frog::Frog::frog:"        
    else
        echo "It is not Wednesday, my dudes. :cry:"
    fi
}

autopaste() {
    paste.amazon.com $@ | remove_carriage_returns | cut_trailing_newline
}

remove_carriage_returns() {
    sed $'s/\r//'
}

cut_trailing_newline(){
    awk 'NR>1{print PREV} {PREV=$0} END{printf("%s",$0)}'
}

alias register_with_aaa='/apollo/env/AAAWorkspaceSupport/bin/register_with_aaa.py'
alias aaa=register_with_aaa
alias aaabb='aaa -a CHACES -t 6000 && bb server'
alias bba='brazil-build apollo-pkg'
alias bre='brazil-runtime-exec'
alias brc='brazil-recursive-cmd'
alias bws='brazil ws'
alias bbrs='brazil-build-rainbow server'
alias bwsuse='bws use --gitMode -p'
alias bwscreate='bws create -n'
alias brc=brazil-recursive-cmd
alias bbr='brc brazil-build'
alias bball='brc --allPackages'
alias bbb='brc --allPackages brazil-build'
alias bbra='bbr apollo-pkg' 
alias devdsk-backup='/apollo/env/DevDesktopS3Backup/bin/devdsk-backup' 

if [ -f ~/.zshrc-dev-dsk-post ]; then
    source ~/.zshrc-dev-dsk-post
fi

export PATH=$BRAZIL_CLI_BIN:$PATH
