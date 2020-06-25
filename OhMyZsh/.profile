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
export ANACONDA_HOME=${PROGRAMS_HOME}/Anaconda
export JAVA_HOME=${PROGRAMS_HOME}/jdk
export NODEJS_HOME=${PROGRAMS_HOME}/NodeJS
export PYTHON_HOME=${ANACONDA_HOME}
export JGET_HOME=${HOME}/Oracle/Products/JGet_H2
export MICRO_TRUECOLOR=1
export COLORTERM=truecolor

if [[ ! "${PATH}" =~ "^\.:" ]]
then
   echo "Setting PATH=$PATH"
   
   # set PATH so it includes user's private bin if it exists
   if [ -d "$HOME/bin" ] ; then
       PATH="$HOME/bin:$PATH"
   fi
   
   # set PATH so it includes user's private bin if it exists
   if [ -d "$HOME/.local/bin" ] ; then
       PATH="$HOME/.local/bin:$PATH"
   fi

   export PATH=".:${PATH}:${JGET_HOME}/bin:${ANACONDA_HOME}/bin:${NODEJS_HOME}/bin"
   export LS_COLORS=$LS_COLORS:'ow=1;34:tw=1;34'
fi

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

# SSH connections
alias grf="ssh rbseshad@slc15grf.us.oracle.com"
alias cxv="ssh rbseshad@slc09cxv.us.oracle.com"
alias cwv="ssh rbseshad@slc09cwv.us.oracle.com"

# Dir shortcuts
alias otd="cd ${HOME}/Oracle/Products/OTD"
alias ohs="cd ${HOME}/Oracle/Products/OHS"
alias learn="cd ${HOME}/GitProjects/Learn"
alias k8s="cd ${HOME}/GitProjects/Learn/K8s"

tab-name Ubuntu

