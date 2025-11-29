DEFAULT_USER=`whoami`

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Prompt customization
setopt prompt_subst

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '%F{#a6e3a1}+%f'
zstyle ':vcs_info:git:*' unstagedstr '%F{#f9e2af}*%f'
zstyle ':vcs_info:git:*' formats ' %s(%F{#94e2d5}%b %f%u%c%m)'
zstyle ':vcs_info:git*+set-message:*' hooks git-remote-status

+vi-git-remote-status() {
  local ahead behind

  git rev-parse --abbrev-ref @{upstream} >/dev/null 2>&1 || return 0

  ahead=$(git rev-list --count @{upstream}..HEAD 2>/dev/null)
  behind=$(git rev-list --count HEAD..@{upstream} 2>/dev/null)

  hook_com[misc]=''

  (( ${ahead:-0} > 0 )) && hook_com[misc]+="%F{#a6e3a1}⇡${ahead}%f"
  (( ${behind:-0} > 0 )) && hook_com[misc]+="%F{#f38ba8}⇣${behind}%f"
}

PS1='%F{#b4befe}%2d%f$vcs_info_msg_0_ $ '

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
# DISABLE_UNTRACKED_FILES_DIRTY="true"

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
plugins=(
  git
  docker
  docker-compose
  macos
  zsh-autosuggestions
  fzf
  asdf
  aws
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8

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

# Android Studio
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Custom functions

alias dev="cd ~/dev"
alias _shrug="echo -n '¯\_(ツ)_/¯' | pbcopy"

# Create gitlab merge request for current branch
function gmr() {
    branch=$(git branch --show-current)
    host=$(git remote get-url origin | sed "s/[^@]*@//; s/.[^.]*$//; s/:/\//")
    open "https://$host/-/merge_requests/new?merge_request[source_branch]=$branch"
}
function gbc() {
    feature_branch=$(git branch --show-current)
    default_branch=$(git remote show origin | awk '/HEAD branch/ {print $NF}')
    git checkout $default_branch
    git pull
    git branch -D $feature_branch
}
alias ghweb="gh repo view --web"

# Add sbin to path
export PATH="/usr/local/sbin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Applications/google-cloud-sdk/path.zsh.inc' ]; then . '/Applications/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Applications/google-cloud-sdk/completion.zsh.inc' ]; then . '/Applications/google-cloud-sdk/completion.zsh.inc'; fi

# Flutter
export PATH="$PATH:/Applications/flutter/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"

# nvim
alias vim="nvim"
export VISUAL=nvim

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files'

# GPG signing
export GPG_TTY=$(tty)

# Golang
. ~/.asdf/plugins/golang/set-env.zsh

# Rust
source "$HOME/.cargo/env"

# Created by `pipx` on 2023-03-06 11:04:30
export PATH="$PATH:/Users/fmartin/.local/bin"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/fmartin/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# Direnv config
eval "$(direnv hook zsh)"

# Jira helper
function jira() {
    if [[ -z "${JIRA_SUBDOMAIN}" || -z "${JIRA_TEAM_NAME_SHORT}" ]]; then
        echo -n "Error: Please provide env vars JIRA_SUBDOMAIN and JIRA_TEAM_NAME_SHORT\n"
        return 1
    fi

    _jira_url="https://${JIRA_SUBDOMAIN}.atlassian.net"
    if [[ -z "${1}" ]]; then
        open "${_jira_url}"
    else
        open "${_jira_url}/browse/${JIRA_TEAM_NAME_SHORT}-${1}"
    fi
}

# Gradle aliases
alias gw="./gradlew"
alias gws="./gradlew --stop"
alias gwcb="./gradlew clean build"
alias gwb="./gradlew bootRun"

# Load project specific zsh config
function load_project_config() {
    local project_config=".project_zshrc"
    if [[ -f "$project_config" ]]; then
        source "$project_config"
    fi
}
autoload -Uz add-zsh-hook
add-zsh-hook chpwd load_project_config

# Lazy stuff
alias lg="lazygit"
alias ld="lazydocker"

eval "$(zoxide init zsh)"

# pnpm
export PNPM_HOME="/Users/fmartin/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Unbind forward-i-seach default key binding
bindkey -r '^S'
