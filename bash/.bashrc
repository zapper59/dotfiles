umask 077


#!/bin/bash

#Remove any aliases that may have been already created
. ~/.bash_profile

unalias -a

alias src='. ~/.bash_profile'
alias checkjar='find . "(" -name "*.jar" -o -name "*.zip" ")" -exec zip -T -q {} ";"'
alias build='showbuildservers | grep Richardson'
alias vi='vim'

#Eclipse Aliases
#alias eclipse="/nobackup/bririche/eclipse/eclipse -data /nobackup/bririche/workspace -vm /auto/cmtools/i686-pc-linux-gnu/jdk/jdk1.7.0_76/bin &>/dev/null 2>&1 &"

alias soapui='exec /ws/bririche-rcd/bin/soapui/bin/soapui.sh &>/dev/null 2>&1 &'
#Shortcut Aliases
alias vimrc='vim ~/.vimrc'
alias vib='vim ~/.bash_profile'
alias vibrc='vim ~/.bashrc'
alias grep='grep --color=auto'
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
alias ssh54='ssh root@rcdn6-vm63-54'
alias ssh214='ssh root@rcdn6-vm97-214'
alias ssh91='ssh root@rcdn6-vm63-91'
alias ssh210='ssh root@rcdn6-vm63-210'
alias ssh174='ssh root@rcdn6-vm63-174'
alias ssh175='ssh root@rcdn6-vm63-175'
alias sshpi='ssh pi@64.101.154.133'

#ls color
alias ls='ls --color -a'
alias sl='ls --color'
alias ll="ls -lah"
alias la="ll"

#l10n
#alias l10n='cd /auto/l10n/IPCBU-L10n/CUCM86/dictionaries/'
alias l10n='cd /auto/l10n/IPCBU-L10n/CUCM90/dictionaries/'

alias showbuildservers='showbuildservers | grep Richardson'
alias sshbuild='ssh se032c-94-154'

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

if [[ -z "$(which gradle)" ]]; then
	alias gradle="./gradlew --daemon"
fi

alias cmi_bearer="/auto/irelease/ncs-tools/token/bin/token -u rchads166Admin@FuncCust.com -t admin"

#Environment modification aliases
alias myenv="source ~/scripts/my_env"
alias simple="source ~/scripts/simple_env"
alias legacy="source ~/scripts/legacy_env"
alias nolegacy="source ~/scripts/nolegacy_env"

alias hook='scp -p -P 29418 bririche@ncs-gerrit.cisco.com:hooks/commit-msg .git/hooks/; chmod u+x .git/hooks/commit-msg'
alias gr='git pull --rebase'
alias gp='gr && git push origin HEAD:refs/for/master --no-thin'
alias gdraft='git pull --rebase && git push origin HEAD:refs/drafts/master --no-thin'
alias gl='git log --pretty=oneline'

alias sandbox='sandbox@bastion-util-01-his-public-direct-600.huron-alpha.com'

alias localrepo='source ~/scripts/localrepo'
alias remoterepo='source ~/scripts/remoterepo'

source ~/scripts/bash_ps1

alias sbuild="/nobackup/bririche/java/JavaFXSceneBuilder2.0/JavaFXSceneBuilder2.0 &"

alias create_ws="/auto/ncs/bin/create_ws"

alias listPrinters="vim /lusr/share/etc/printcap"
alias tmux="unset bashrcrun && tmux"

alias javadecompile="java -jar ~/projects/jd-core-java/build/libs/jd-core-java-1.2.jar"
