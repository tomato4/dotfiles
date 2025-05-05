#!/usr/bin/zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  # source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Custom settings
export TERM="xterm-256color"
export EDITOR=nvim
export MANPAGER="nvim -c 'Man!' -o -"

# Custom variables
export DOTFILES=~/dotfiles
DOTFILES_ZSH=$DOTFILES/zsh
export USER_ID=$(id -u)
export USER_GROUP=$(id -g)
export OS="$(uname)"
[[ "$(uname)" == "Darwin" ]]
IS_MAC=$?

# Disable case sensitive completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# History setup:
HISTSIZE=1000
SAVEHIST=999
HISTFILE=~/.cache/zshhistory
setopt appendhistory
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)               # Include hidden files.

# Custom ZSH Binds
bindkey '^ ' autosuggest-accept

# change dir shortcut
setopt autocd

# fix special keys
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
bindkey "\e[1;3D" backward-word     # ⌥←
bindkey "\e[1;3C" forward-word      # ⌥→
bindkey "^[[1;9D" beginning-of-line # cmd+←
bindkey "^[[1;9C" end-of-line       # cmd+→

# Load aliases and shortcuts if existent.
[ -f "$DOTFILES_ZSH/zsh_alias" ] && source "$DOTFILES_ZSH/zsh_alias"

# Load ; should be last.
if [[ IS_MAC -eq 0 ]]; then
  ZSH_BASE="$(brew --prefix)/share"
  ZSH_AUTOSUGGESTIONS="$ZSH_BASE/zsh-autosuggestions/zsh-autosuggestions.zsh"
  ZSH_HIGHLIGHTING="$ZSH_BASE/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  AUTOJUMP="$ZSH_BASE/autojump/autojump.zsh"
else
  ZSH_BASE="/usr/share"
  ZSH_AUTOSUGGESTIONS="$ZSH_BASE/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
  ZSH_HIGHLIGHTING="$ZSH_BASE/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  AUTOJUMP="$ZSH_BASE/autojump/autojump.zsh"
fi

# Source all
source "$ZSH_AUTOSUGGESTIONS"
source "$ZSH_HIGHLIGHTING"
source "$AUTOJUMP"
source $DOTFILES_ZSH/powerlevel10k/powerlevel10k.zsh-theme

# fishlike history search
if [ -f "$DOTFILES_ZSH/zsh-history-substring-search/zsh-history-substring-search.zsh" ]
then
    source "$DOTFILES_ZSH/zsh-history-substring-search/zsh-history-substring-search.zsh"
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# source $DOTFILES/zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# welcome screen
fastfetch
