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

# App Environment Variables
# -------------------------
export PYTHONPATH=${SPARK_HOME}/python
export PYSPARK_DRIVER_PYTHON="jupyter"
export PYSPARK_DRIVER_PYTHON_OPTS="notebook"
export PYSPARK_PYTHON="python"
export NPM_PACKAGES="${HOME}/.npm-packages"
export MICRO_TRUECOLOR=1
export COLORTERM=truecolor

# Set PATH
# ---------------------------- 
SYSTEM_PATH=${HOME}/bin:${HOME}/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
PROGRAM_PATH=${SPARK_HOME}:${PROGRAM_HOME}/Anaconda/bin:${NPM_PACKAGES}/bin
MY_PATH=${HOME}/bin:${HOME}/.local/bin
export PATH=".:${MY_PATH}:${PROGRAM_PATH}:${SYSTEM_PATH}"

# App Hacks
# --------------------------

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# Alias
# -----
alias h=history
alias cls=clear
alias vi=micro
alias mi=micro
alias sudo="sudo -E"
alias docker="sudo docker"
alias apt="sudo apt"
alias grf="ssh rbseshad@slc15grf.us.oracle.com"
alias cxv="ssh rbseshad@slc09cxv.us.oracle.com"
alias cwv="ssh rbseshad@slc09cwv.us.oracle.com"
