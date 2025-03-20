# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/home/glimberg/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
##ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"
###ZSH_THEME="agnoster"
###ZSH_THEME="amuse"

# POWERLEVEL9K settings
# https://github.com/Powerlevel9k/powerlevel9k/wiki/Stylizing-Your-Prompt
# https://github.com/Powerlevel9k/powerlevel9k/blob/master/README.md
# examples
# https://github.com/Powerlevel9k/powerlevel9k/wiki/Show-Off-Your-Config
POWERLEVEL9K_MODE='nerdfont-complete'
#POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
#POWERLEVEL9K_SHORTEN_DELIMITER=""
#POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=''
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{blue}\u256D\u2500%F{white}"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{blue}\u2570\uf460%F{white} "

# - POWERLEVEL9K custom
_mower_connected(){
    if iwconfig 2>/dev/null | grep -q "SSID:\"Automower";
    then
        echo -n "%{%F{029}%}\uf618" # \uf230 is 
    elif iwconfig 2>/dev/null | grep -q "SSID:\"Mower";
    then
        echo -n "%{%F{029}%}\uf618" # \uf230 is 
    else
        echo -n "%{%F{238}%}\uf617" # \uf230 is 
    fi
}

_sourced_ros_target(){
ROS_STRING=ROS
    if [[ ${ROS_VERSION} -eq 2 ]];
    then
      if [[ -n ${PROJECT_NAME} ]];
      then
        echo -n "%{%F{097}%}\uf00a ROS2 (${PROJECT_NAME})" # \uf230 is  008 darkgrey
      elif [[ -n ${ROS_WORKSPACE} ]];
      then
        echo -n "%{%F{097}%}\uf00a ROS2 ($(basename ${ROS_WORKSPACE}))" # \uf230 is  008 darkgrey
      else
        echo -n "%{%F{097}%}\uf00a ROS2 " # \uf230 is  008 darkgrey
      fi
    elif [[ -n ${ROS_MASTER_URI} ]];
    then
        if [[ "${ROS_MASTER_URI}" == *"localhost"* ]] || [[ "${ROS_MASTER_URI}" == *"127\.0\.0\.1"* ]];
        then
            echo -n "%{%F{028}%}\uf00a ROS ($(basename ${ROS_WORKSPACE}))" # \uf230 is  028 green
        else
            echo -n "%{%F{031}%}\uf00a ROS ($(basename ${ROS_WORKSPACE}))" # \uf230 is  031 blue
        fi
    elif [[ -n ${ROS_WORKSPACE} ]];
    then
        echo -n "%{%F{008}%}\uf00a ROS ${ROS_WORKSPACE}))" # \uf230 is  008 darkgrey
    else
        echo -n "%{%F{008}%}\uf00a ROS" # \uf230 is  008 darkgrey
    fi
}

POWERLEVEL9K_CUSTOM_MOWER_CONNECTED="_mower_connected"
POWERLEVEL9K_CUSTOM_ROS_TARGET="_sourced_ros_target"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv os_icon user root_indicator custom_mower_connected custom_ros_target dir dir_writable_joined vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time status background_jobs_joined date time_joined disk_usage ram load battery)
# os icon
POWERLEVEL9K_OS_ICON_BACKGROUND="clear"
# user
POWERLEVEL9K_USER_DEFAULT_BACKGROUND="clear"
POWERLEVEL9K_USER_SUDO_BACKGROUND="clear"
POWERLEVEL9K_USER_ROOT_BACKGROUND="clear"
# root_indicator
POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND="red"
POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND="white"
# custum
POWERLEVEL9K_CUSTOM_MOWER_CONNECTED_BACKGROUND="clear"
POWERLEVEL9K_CUSTOM_ROS_TARGET_BACKGROUND="clear"
# dir
POWERLEVEL9K_DIR_HOME_BACKGROUND="clear"
POWERLEVEL9K_DIR_HOME_FOREGROUND="12"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="clear"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="blue"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND="clear"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="red"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="clear"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"
POWERLEVEL9K_DIR_ETC_BACKGROUND="clear"
POWERLEVEL9K_DIR_ETC_FOREGROUND="magenta"
# vcs
POWERLEVEL9K_SHOW_CHANGESET="true"
POWERLEVEL9K_VCS_CLEAN_BACKGROUND="clear"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="clear"
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="clear"
POWERLEVEL9K_VCS_CLEAN_FOREGROUND="green"
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="yellow"
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="yellow"
POWERLEVEL9K_VCS_ACTIONFORMAT_FOREGROUND="red"
# execution_time
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='clear'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='magenta'
# status
POWERLEVEL9K_STATUS_OK_BACKGROUND="clear"
POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="clear"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"
# background jobs
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND='clear'
POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND='green'
# date
POWERLEVEL9K_DATE_FORMAT="%D"
POWERLEVEL9K_DATE_BACKGROUND="clear"
POWERLEVEL9K_DATE_FOREGROUND="white"
# time
POWERLEVEL9K_TIME_BACKGROUND="clear"
POWERLEVEL9K_TIME_FOREGROUND="white"
# disk_usage
POWERLEVEL9K_DISK_USAGE_NORMAL_BACKGROUND="clear"
POWERLEVEL9K_DISK_USAGE_NORMAL_FOREGROUND="green"
POWERLEVEL9K_DISK_USAGE_WARNING_BACKGROUND="clear"
POWERLEVEL9K_DISK_USAGE_WARNING_FOREGROUND="yellow"
POWERLEVEL9K_DISK_USAGE_CRITICAL_BACKGROUND="clear"
POWERLEVEL9K_DISK_USAGE_CRITICAL_FOREGOUNR="red"
# ram
POWERLEVEL9K_RAM_BACKGROUND="clear"
POWERLEVEL9K_RAM_FOREGROUND="green"
# load
POWERLEVEL9K_LOAD_NORMAL_BACKGROUND="clear"
POWERLEVEL9K_LOAD_NORMAL_FOREGROUND="green"
POWERLEVEL9K_LOAD_WARNING_BACKGROUND="clear"
POWERLEVEL9K_LOAD_WARNING_FOREGROUND="yellow"
POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND="clear"
POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND="red"
# battery
POWERLEVEL9K_BATTERY_LOW_BACKGROUND="clear"
POWERLEVEL9K_BATTERY_LOW_FOREGROUND="yellow"
POWERLEVEL9K_BATTERY_CHARGING_BACKGROUND="clear"
POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND="purple"
POWERLEVEL9K_BATTERY_CHARGED_BACKGROUND="clear"
POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND="green"
POWERLEVEL9K_BATTERY_DISCONNECTED_BACKGROUND="clear"
POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND="cyan"
POWERLEVEL9K_BATTERY_LOW_THRESHOLD=15
POWERLEVEL9K_BATTERY_VERBOSE=false
POWERLEVEL9K_BATTERY_STAGES=""

## end of powerlevel9k settings


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
 DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
## oh-my-zsh plugins
plugins=(
  aliases
  catimg
  colored-man-pages
  dircycle
  dirhistory
  git
  history
  pip
  rsync
  thefuck
  z
  virtualenv
)

## oh-my-zsh custom plugins
plugins+=(k)                        # https://github.com/supercrabtree/k
# plugins+=(zsh-autocomplete)         # https://github.com/marlonrichert/zsh-autocomplete
plugins+=(zsh-autosuggestions)      # https://github.com/zsh-users/zsh-autosuggestions
plugins+=(zsh-syntax-highlighting)  # https://github.com/zsh-users/zsh-syntax-highlighting

source $ZSH/oh-my-zsh.sh

# User configuration

#bindkey -v

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vim'
 fi

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
alias zshconfig="vim ~/.zshrc"
alias vimconfig="vim ~/.vimrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#alias -s {yml,yaml}=vim
#alias -g G='| grep -i'
#alias ls='ls --color=tty'
#alias grep='grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'

alias gdto="git difftool"
alias gmto="git mergetool"

alias gitlog="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset %C(bold #262680)<%cn>%Creset' --abbrev-commit"
alias gitlogp="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset %C(bold #262680)<%cn>%Creset' --abbrev-commit -p"

## Nodejs
#VERSION=v10.16.3
#DISTRO=linux-x64
#export PATH=/usr/local/lib/nodejs/node-$VERSION-$DISTRO/bin:$PATH

# export ROS_DOMAIN_ID=23

## terminal functions

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export MPLBACKEND=TkAgg


function _commands() {
  awk '{a[$2]++}END{for(i in a){print a[i] " " i}}'
}
function mdv() {
  pandoc $1 > /tmp/$1.html
  xdg-open /tmp/$1.html
}
alias topten="history | _commands | sort -rn | head"

alias printenvandshell="( setopt posixbuiltin; set; ) | less"

alias wtf="fuck"

export LC_NUMERIC="en_US.UTF-8"

#unset -f sourced_ros_target                                                                                                                                                                                                                 
#unset -f mower_connected 
#unset -f commands

