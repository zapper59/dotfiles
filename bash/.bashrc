#!/bin/bash

#This feels like a bad idea and will probably break things
if [[ $- == *i* ]]; then
  clear
fi

#Remove any aliases that may have been already created
. ~/.bash_profile

unalias -a

alias src='. ~/.bash_profile'
alias checkjar='find . "(" -name "*.jar" -o -name "*.zip" ")" -exec zip -T -q {} ";"'

alias vi='vim'

#Eclipse Aliases
alias eclipse="/nobackup/bririche/eclipse/eclipse -data /nobackup/bririche/workspace -vm /auto/cmtools/i686-pc-linux-gnu/jdk/jdk1.7.0_76/bin &>/dev/null 2>&1 &"

alias soapui='exec /ws/bririche-rcd/bin/soapui/bin/soapui.sh &>/dev/null 2>&1 &'
#Shortcut Aliases
alias vimrc='vim ~/.vimrc'
alias vib='vim ~/.bash_profile'
alias vibrc='vim ~/.bashrc'
alias grep='grep --color=auto'
alias search='grep -niI --exclude *.o --exclude *.asm --exclude *.sym -r ./ -e'
alias searchmore='grep -nir ./ -e'
alias tf='tail -f'
alias push='pushd .'
alias pop='popd'
alias sjv='source ~/scripts/SwitchJavaVersion'

#can probably make this a function... but quick and dirty works for now
alias up='cd ..'
alias up2='cd ../..'
alias up3='cd ../../..'
alias up4='cd ../../../..'
alias up5='cd ../../../../..'
alias up6='cd ../../../../../..'
alias up7='cd ../../../../../../..'
alias up8='cd ../../../../../../../..'
alias up9='cd ../../../../../../../../..'
alias up10='cd ../../../../../../../../../..'

#SSH Aliases
alias sshpi='ssh pi@64.101.154.133'

#ls color
alias ls='ls --color -a'
alias sl='ls --color'
alias ll="ls -lah"
alias la="ll"

alias gradlend="gradle --no-daemon"
alias gradle="gradle --daemon"
alias gce="gradle --daemon cleanEclipse eclipse"
alias gcbce="gradle --daemon clean build; gradle --daemon cleanEclipse eclipse"
alias gcb="gradle --daemon clean build"
alias gall="gradle --daemon --refresh-dependencies clean build cleanEclipse eclipse"
alias ginc="gradle --daemon sonarRunner -Dsonar.analysis.mode=incremental"
alias nukegradle="gall"
alias gw="gradle wrapper && ./gradlew wrapper"
alias maven="mvn"

#Environment modification aliases
alias myenv="source ~/scripts/my_env"
alias simple="source ~/scripts/simple_env"
alias legacy="source ~/scripts/legacy_env"
alias nolegacy="source ~/scripts/nolegacy_env"

alias gr='git pull --rebase'
alias gp='gr && git push origin HEAD:refs/for/master --no-thin'
alias gdraft='git pull --rebase && git push origin HEAD:refs/drafts/master --no-thin'
alias gl='git log --pretty=oneline'
#gl() {
#  $( [ -z "$1" ] && git log --pretty=oneline -10 || git log --pretty=oneline $1 )
#}

alias sandbox='sandbox@bastion-util-01-his-public-direct-600.huron-alpha.com'

alias localrepo='source ~/scripts/localrepo'
alias remoterepo='source ~/scripts/remoterepo'

source ~/scripts/bash_ps1
source ~/scripts/.git-completion.bash
#source ~/scripts/bash_ps1_2

alias sbuild="/nobackup/bririche/java/JavaFXSceneBuilder2.0/JavaFXSceneBuilder2.0 &"

alias create_ws="/auto/ncs/bin/create_ws"

export GRADLE_HOME="${C_DRIVE}Program Files/gradle-4.0/bin"
export PATH=$GRADLE_HOME:$PATH
export PATH="${C_DRIVE}Program Files/netcat-1.11":$PATH


alias nukegradle="gradle --refresh-dependencies clean cleaneclipse eclipse build"

if [[ $- == *i* ]]; then
  echo "hello from bashrc"
fi

#alias clear="printf \"\033c\""

alias python='C:\\Python27\python.exe'
alias start='cygstart'
alias open='cygstart'
pow() {
  if [ -z "$1" ]
  then
    cygstart powershell.exe -NoExit
  else
    cygstart powershell.exe -NoExit -Command $1
  fi
}
alias mkdir='mkdir -pv'
alias fromhex='xxd -r -p'
#start() {
#  cmd /C "start $(cygpath.exe -w $1)"
#}
alias sublime_text='vim'
set completion-ignore-case On
