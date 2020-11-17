# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    echo "Sourcing ${HOME}/.bashrc"
	. "$HOME/.bashrc"	 
    fi
fi

# Home Dir
# --------
export PROGRAM_HOME=${HOME}/Programs
export SPARK_HOME=${PROGRAM_HOME}/Spark

# Environment Variables
# ---------------------
export PROGRAMS_HOME=${HOME}/Programs
export JAVA_HOME=${PROGRAMS_HOME}/jdk
export PYTHON_HOME=${ANACONDA_HOME}
export JGET_HOME=${HOME}/Oracle/Products/JGet
export MICRO_TRUECOLOR=1
export COLORTERM=truecolor

export PATH_CORE=".:${HOME}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:${HOME}/.local/bin"
export PATH_BIN_DIR="${HOME}/bin/duke-git"
PATH_PROGRAM=""
for currProgram in $(ls ${PROGRAMS_HOME})
do
  if [[ -d ${PROGRAMS_HOME}/${currProgram}/bin ]]
  then
    PATH_PROGRAM="${PATH_PROGRAM}:${PROGRAMS_HOME}/${currProgram}/bin"
  fi
done      
export PATH_OTHER="${JGET_HOME}/bin"

export PATH="${PATH_CORE}:${PATH_BIN_DIR}:${PATH_PROGRAM}:${PATH_OTHER}"
export LS_COLORS=$LS_COLORS:'ow=1;34:tw=1;34'

# Alias
# -----
alias h="history"
alias c="clear"
alias sudo="sudo -E"
alias docker="sudo docker"
alias docker-compose="sudo docker-compose"
alias sysctl="sudo systemctl"
alias apt="sudo apt"
alias mi="micro"
alias vi="vim"
alias snap="sudo snap"
alias hgrep="history | grep"
alias lsdir="ls -d */"
alias egrep="egrep --color=auto"
# SSH connections
alias grf="ssh rbseshad@slc15grf.us.oracle.com"
alias cxv="ssh rbseshad@slc09cxv.us.oracle.com"
alias cwv="ssh rbseshad@slc09cwv.us.oracle.com"
alias rc1="ssh rbseshad@rbseshad-1.subnet1ad1phx.devweblogicphx.oraclevcn.com"
alias pc1="ssh rbseshad@prevenka-1.subnet3ad3phx.devweblogicphx.oraclevcn.com"

# Dir changes
alias ps5="cd $HOME/Oracle/Products/OHS/12.2.1.5.0/src/apache"
alias ps4="cd $HOME/Oracle/Products/OHS/12.2.1.4.0/src/apache"
alias ps3="cd $HOME/Oracle/Products/OHS/12.2.1.3.0/src/apache"

# Dir shortcuts
alias otd="cd ${HOME}/Oracle/Products/OTD"
alias ohs="cd ${HOME}/Oracle/Products/OHS"
alias learn="cd ${HOME}/GitProjects/Learn"
alias k8s="cd ${HOME}/GitProjects/Learn/K8s"
alias fix-term="cd /home/raghu/Programs/UbuntuUtils/GnomeTerminalPatch && install.sh"
tab-name Ubuntu

