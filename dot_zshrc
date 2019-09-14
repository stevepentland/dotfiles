# shellcheck disable=SC2034
# shellcheck disable=1091
# shellcheck disable=1090

#-------------------------------Exports------------------------------#
export TERM="xterm-256color"
export WORKON_HOME=~/envs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.bin
export XDG_DATA_DIRS=$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:/home/steve/.local/share/flatpak/exports/share

#-------------------------------Options------------------------------#

#=============================Directories============================#
setopt auto_pushd
setopt pushd_ignore_dups

#===============================History==============================#
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY

#=============================Key Bindings===========================#
bindkey "^[[1;5D" backward-word # control left
bindkey "^[[1;5C" forward-word  # control right
bindkey "^ " autosuggest-accept	# accept suggestion with ctrl+space
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" history-search-backward
bindkey "\e[6~" history-search-forward
bindkey "\e[3~" delete-char
bindkey "\e[2~" overwrite-mode
bindkey "\e[5C" forward-word
bindkey "\e[5D" backward-word
bindkey "\e[1;5C" forward-word
bindkey "\e[1;5D" backward-word
bindkey "\e[8~" end-of-line
bindkey "\eOc" forward-word
bindkey "\eOd" backward-word
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line


#-------------------------POWERLEVEL9K setup-------------------------#
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="╭"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="╰\uF460\uF460\uF460 "
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs node_version rust_version go_version virtualenv)
POWERLEVEL9K_NODE_VERSION_BACKGROUND='172'
POWERLEVEL9K_NODE_VERSION_FOREGROUND='000'
POWERLEVEL9K_VIRTUALENV_BACKGROUND='022'
POWERLEVEL9K_VIRTUALENV_FOREGROUND='046'
POWERLEVEL9K_GO_VERSION_FOREGROUND='000'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_DELIMITER=..

if [ -z "$MAKING_DEMO" ]; then
	POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status battery time)
else
	POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
fi

#------------------------------Sources-------------------------------#
# shellcheck source=/etc/profile
source ~/.zplug/init.zsh
source /etc/profile

#-------------------------------Zplug--------------------------------#
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme
zplug "pkulev/zsh-rustup-completion"
zplug "DarrinTisdale/zsh-aliases-exa"
zplug "zsh-users/zsh-autosuggestions", use:zsh-autosuggestions.plugin.zsh
zplug "zsh-users/zsh-completions", use:zsh-completions.plugin.zsh
zplug "plugins/gitfast", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh
zplug "b4b4r07/enhancd", use:init.sh
zplug "nocttuam/autodotenv"
zplug 'mfaerevaag/wd', as:command, use:"wd.sh", hook-load:"wd() { . $ZPLUG_REPOS/mfaerevaag/wd/wd.sh }"
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug load

#-------------------------------Aliases------------------------------#
alias cls='clear'
alias code='code-insiders'
alias cronlog='sudo cat /var/log/cron.log'
alias server='ssh steve@server'
alias ls='exa --color=always --group-directories-first'
alias df='df -x squashfs -x tmpfs -H'
alias copy='xclip -selection clipboard'
alias paste='xclip -selection clipboard -o'
alias vim='nvim'
alias grep='rg'
alias python='python3'
alias pip='pip3'

if [ -f /usr/bin/bat ]; then
	alias cat='bat'
fi
#------------------------------Functions-----------------------------#
makeDemo() {
	if [ -z "${MAKING_DEMO}" ]; then
		MAKING_DEMO=true
	fi

	source ~/.zshrc
}

doneDemo() {
	unset MAKING_DEMO
	source ~/.zshrc
}

#--------------------------------GPG SSH-----------------------------#
export SSH_AUTH_SOCK=${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.ssh

#----------------------------Virtualenvwrapper-----------------------#
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
	source /usr/local/bin/virtualenvwrapper.sh
elif [ -f /usr/bin/virtualenvwrapper.sh ]; then
	source /usr/bin/virtualenvwrapper.sh
fi

#----------------------------------NVM-------------------------------#
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

#---------------------------------Editor-----------------------------#
# TODO: Expand to check whether nvim is installed
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim

#------------------------------Zstyle Changes------------------------#
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
