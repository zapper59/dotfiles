#!/bin/bash

export C_DRIVE="/cygdrive/c/"
export LS_COLORS=${LS_COLORS}:*.jar=31

export GIT_HOME="/auto/cmtools/i686-pc-linux-gnu/git/1.7.8.1/bin"
#export JAVA_HOME="/auto/cmtools/i686-pc-linux-gnu/jdk/jdk1.7.0_55"
#export JAVA_HOME="/c/ProgramData/Oracle/Java/javapath/java"
export GROOVY_HOME="/auto/cmtools/i686-pc-linux-gnu/groovy/2.1.7"
export ANT_HOME="/auto/cmtools/i686-pc-linux-gnu/apache-ant/1.8.2"
export MAVEN_HOME="/auto/cmtools/i686-pc-linux-gnu/apache-maven/3.2.5"
export GRADLE_HOME="/auto/irelease/apps/gradle-2.5"
#export GRADLE_HOME="/ws/bririche-rcd/bin/gradle-2.4"
#export GRADLE_HOME="/ws/bririche-rcd/bin/gradle-2.4"
export GRADLE_USER_HOME="/ws/bririche-rcd/gradle_home"
export SOAPUI_HOME="/ws/bririche-rcd/bin/soapui"
export SQUIRREL_SQL_HOME="/ws/bririche-rcd/bin/squirrel-sql"
export JMETER_HOME="/ws/bririche-rcd/bin/apache-jmeter"
export NODEJS_HOME="/auto/irelease/apps/nodejs"
export MIKTEX_HOME="${C_DRIVE}Program Files/miktex/miktex"

export LOGSTASH_HOME="/nobackup/bririche/bin/logstash-1.4.2"
export GRAPHITE_HOME="/nobackup/bririche/bin/graphite-web-0.9.10"
export ELASTICSEARCH_HOME="/nobackup/bririche/bin/elasticsearch-1.2.1"

#The TOMCAT vars are for the ant tomcat tasks
export TOMCAT_MANAGER_URL=http://rcdn6-vm63-54:8080/manager #localhost:8080
export TOMCAT_MANAGER_USER=tomcat
export TOMCAT_MANAGER_PASSWORD=tomcat
export EDITOR="vim"
export NODEJS="$NODEJS_HOME/bin"

export CCASE_HOST_TYPE=auto
export CC_DISABLE_COPYRIGHT_CHECK=1

#For selenium testing
#export FIREFOX_PROFILE=/users/bririche/.mozilla/firefox/dqzr99nk.default #dqzr99nk.default #kkysf46j.bririche
#export FIREFOX_HOME=/ws/bririche-rcd/bin/firefox

#BEGIN ENV FROM EXAMPLE BUILD
export CCASE_HOST_TYPE=auto
export CC_DIFF_OPTS="-C 5"
export CC_DISABLE_COPYRIGHT_CHECK=1
export HISTFILESIZE=30000
export HISTSIZE=30000
export LANG=C       #!@ Do not edit this line !@
export LC_ALL=C
export ORG_GRADLE_PROJECT_LOCAL_REPOSITORY_DIR="/ws/bririche-rcd/gradleLocal"

if [ -z "$LD_LIBRARY_PATH" ]; then
	LD_LIBRARY_PATH=$HOME/libs
else
	LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/libs
fi
export LD_LIBRARY_PATH

#END EXAMPLE BUILD ENV

#For dbl2j
export VOSMFIBUILDDIR=/view/bririche-cc_mainline-cct-vos/vob/vos/Common/build #run make all
#End for dbl2j

export MANPATH=\
/usr/share/man:\
/usr/atria/doc/man:\
/usr/cisco/man:\
/usr/local/share/man:\
/usr/X11R6/man:\
/usr/local/man:\
/router/man:\
/usr/kerberos/man

#TODO: refactor into a common script ########################
function pathAppend() {
	local match=$1
#	if [[ ! $PATH =~ $match ]]; then
	if test "echo $PATH | grep $match"; then
		PATH="$PATH:${match}"
	fi
}

function pathPrepend() {
	local match=$1
#	if [[ ! $PATH =~ $match ]]; then
	if test "echo $PATH | grep $match"; then
		PATH="${match}:$PATH"
	fi
}

function pathRemove() {
	PATH=$(echo $PATH | sed -e "s@$1@@g")
}
#############################################################

#Remove any cruft that may already be on the path
PATH=$PATH:/bin:/usr/bin:/usr/local/bin:/usr/cisco/bin

pathPrepend "$NODEJS_HOME/bin"
pathPrepend "$JMETER_HOME/bin"
pathPrepend "$SQUIRREL_SQL_HOME"
pathPrepend "$SOAPUI_HOME/bin"
pathPrepend "$GRADLE_HOME/bin"
pathPrepend "$MAVEN_HOME/bin"
pathPrepend "$ANT_HOME/bin"
pathPrepend "$GROOVY_HOME/bin"
#pathPrepend "$JAVA_HOME/bin"
pathPrepend "$GIT_HOME"
pathPrepend "/ws/bririche-rcd/bin"
pathPrepend "/nobackup/bririche/bin"
pathPrepend "~/scripts"
pathPrepend "/sbin"
#pathPrepend "/c/Python34"
pathPrepend "~/AppData/Roaming/Python/Python36/Scripts"
pathPrepend "${C_DRIVE}Program Files/paint.net"
#pathAppend "/auto/ipcbu-builds/Published/UserScriptsNG"
pathPrepend "$MIKTEX_HOME/bin"
pathPrepend "${C_DRIVE}adb"

PATH=$(echo $PATH | sed -e "s@:\+@:@g" | sed -e 's@\(^:\|:$\)@@g')
export PATH

export CMAKE_C_COMPILER=gcc
export CMAKE_CXX_COMPILER=c++

source ~/.bashrc
