# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.

#umask 022

##
# Dependent Softwares
#   - zsh, oh-my-zsh, powerlevel10k
#   - Java
#   - Python
#   - Vim
#   - Micro
##

# echo "Sourcing $HOME/.profile"

# Home Dir
# --------
export PROGRAM_HOME=${HOME}/Programs

# Environment Variables
# ---------------------
export PROGRAMS_HOME=${HOME}/Programs
export JAVA_HOME=${PROGRAMS_HOME}/jdk
export PYTHON_HOME=${ANACONDA_HOME}
export MICRO_TRUECOLOR=1
export COLORTERM=truecolor
export LS_COLORS=$LS_COLORS:'ow=1;34:tw=1;34'

# Path Environment variable
# -------------------------

# Core OS path
PATH_CORE=".:${HOME}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:${HOME}/.local/bin"

# Dirs in user's bin
PATH_BIN_DIR="${HOME}/bin/duke-git"

# Dynamically add directories in PROGRAMS_HOME
PATH_PROGRAM=""
for currProgram in $(ls ${PROGRAMS_HOME})
do
  if [[ -d ${PROGRAMS_HOME}/${currProgram}/bin ]]
  then
    PATH_PROGRAM="${PATH_PROGRAM}:${PROGRAMS_HOME}/${currProgram}/bin"
  fi
done
# Other dirs
PATH_OTHER="${JGET_HOME}/bin"
export PATH="${PATH_CORE}:${PATH_BIN_DIR}:${PATH_PROGRAM}:${PATH_OTHER}"

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
alias hgrep="history | sort -nr -k 1 | sort -u -k 2 | sort -n -k 1 | grep"
alias egrep="egrep --color=auto"

# Default tab name
# ----------------
tab-name Ubuntu

# -------------------------------------------------------------------------------------------------
# Oracle config
# -------------------------------------------------------------------------------------------------

# SSH connections
alias grf="ssh rbseshad@slc15grf.us.oracle.com"
alias gqy="ssh rbseshad@slc15gqy.us.oracle.com"
alias aqq="ssh rbseshad@slc13aqq.us.oracle.com"
alias cxv="ssh rbseshad@slc09cxv.us.oracle.com"
alias cwv="ssh rbseshad@slc09cwv.us.oracle.com"
alias rc1="ssh rbseshad@rbseshad-1.subnet1ad1phx.devweblogicphx.oraclevcn.com"
alias pc1="ssh rbseshad@prevenka-1.subnet3ad3phx.devweblogicphx.oraclevcn.com"
alias poolc1="ssh rbseshad@phx11854d1.subnet5ad1phx.devweblogicphx.oraclevcn.com"
alias poolc2="ssh rbseshad@phx1183e90.subnet4ad1phx.devweblogicphx.oraclevcn.com"
alias arm="ssh rbseshad@phx3a18qa11.subnet4.devweblogic2phx.oraclevcn.com"

# Dir changes
alias ps6="cd $HOME/Oracle/Products/OHS/12.2.1.6.0/src/apache"
alias ps5="cd $HOME/Oracle/Products/OHS/12.2.1.5.0/src/apache"
alias ps4="cd $HOME/Oracle/Products/OHS/12.2.1.4.0/src/apache"
alias ps3="cd $HOME/Oracle/Products/OHS/12.2.1.3.0/src/apache"
alias myenv="source ~/bin/myenv.sh"

# Dir shortcuts
alias otd="cd ${HOME}/Oracle/Products/OTD"
alias ohs="cd ${HOME}/Oracle/Products/OHS"
