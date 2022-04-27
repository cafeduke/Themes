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
alias lsdir="ls -d */"
alias egrep="egrep --color=auto"

# SSH connections
tab-name Ubuntu
