# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/raghu/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
fpath=($fpath "/home/raghu/.zfunctions")
### 
### # rbseshad: Space theme customizations
### SPACESHIP_PROMPT_ORDER=(user dir host git hg package node ruby elm elixir xcode swift golang php rust haskell julia docker aws venv conda pyenv dotnet ember kubecontext exec_time line_sep battery vi_mode jobs exit_code char)
### SPACESHIP_RPROMPT_ORDER=(time)
### SPACESHIP_CHAR_SYMBOL='>'
### SPACESHIP_CHAR_SUFFIX=' '
### SPACESHIP_TIME_SHOW=true
### SPACESHIP_DIR_TRUNC=0
### 
### # -----------------------------------------------------------------------------
### # # RBSESHAD: Powerlevel9K customization
### # # -----------------------------------------------------------------------------
### # POWERLEVEL9K_PROMPT_ON_NEWLINE=true
### # POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(host dir vcs)
### #
### # POWERLEVEL9K_DIR_HOME_BACKGROUND='070'
### # POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='070'
### # POWERLEVEL9K_DIR_ETC_BACKGROUND='070'
### # POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='070'
### #
### # POWERLEVEL9K_DIR_HOME_FOREGROUND='233'
### # POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='233'
### # POWERLEVEL9K_DIR_ETC_FOREGROUND='233'
### # POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='233'
### #
### # POWERLEVEL9K_HOST_REMOTE_BACKGROUND='026'
### # POWERLEVEL9K_HOST_REMOTE_FOREGROUND='white'
### # POWERLEVEL9K_HOST_LOCAL_BACKGROUND='026'
### # POWERLEVEL9K_HOST_LOCAL_FOREGROUND='white'
### #
### # POWERLEVEL9K_VCS_CLEAN_FOREGROUND='white'
### # POWERLEVEL9K_VCS_CLEAN_BACKGROUND='dodgerblue3'
### # POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='white'
### # POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='130'
### # POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='white'
### # POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='094'
### # POWERLEVEL9K_VCS_CLOBBERED_BACKGROUND='124'
### # POWERLEVEL9K_VCS_CLOBBERED_FOREGROUND='white'
### #
### # POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
### # POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="⮁ "
### #
### # POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='233233'
### # # -----------------------------------------------------------------------------
### 
### # Set Spaceship ZSH as a prompt
### #autoload -U promptinit; promptinit
### #prompt powerlevel9k
### 
### # -----------------------------------------------------------------------------
### # RBSESHAD: Powerlevel9K customization
### # -----------------------------------------------------------------------------
### POWERLEVEL9K_PROMPT_ON_NEWLINE=true
### POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(host dir vcs)
### 
### POWERLEVEL9K_DIR_HOME_BACKGROUND='070'
### POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='070'
### POWERLEVEL9K_DIR_ETC_BACKGROUND='070'
### POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='070'
### 
### POWERLEVEL9K_DIR_HOME_FOREGROUND='233'
### POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='233'
### POWERLEVEL9K_DIR_ETC_FOREGROUND='233'
### POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='233'
### 
### POWERLEVEL9K_HOST_REMOTE_BACKGROUND='026'
### POWERLEVEL9K_HOST_REMOTE_FOREGROUND='white'
### POWERLEVEL9K_HOST_LOCAL_BACKGROUND='026'
### POWERLEVEL9K_HOST_LOCAL_FOREGROUND='white'
### 
### POWERLEVEL9K_VCS_CLEAN_FOREGROUND='white'
### POWERLEVEL9K_VCS_CLEAN_BACKGROUND='dodgerblue3'
### POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='white'
### POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='130'
### POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='white'
### POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='094'
### POWERLEVEL9K_VCS_CLOBBERED_BACKGROUND='124'
### POWERLEVEL9K_VCS_CLOBBERED_FOREGROUND='white'
### 
### POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
### POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="⧽ "
### 
### POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='233233'
### # -----------------------------------------------------------------------------
### 

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
source ~/.profile
