# -------------------------------------------------------------------------------------------------
#
# +++ zsh + Powerlevel10k Configs +++
#
# -------------------------------------------------------------------------------------------------
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# -------------------------------------------------------------------------------------------------
#
# +++ Custom Configs +++
#
# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
# Source configs
# -------------------------------------------------------------------------------------------------
# It suggests commands as you type based on history and completions 
# (https://github.com/zsh-users/zsh-autosuggestions)
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#324ab2,bold,underline"

# -------------------------------------------------------------------------------------------------
# History Config
# -------------------------------------------------------------------------------------------------
HISTFILE=~/.zhistory
HISTSIZE=SAVEHIST=100000
setopt sharehistory
setopt extendedhistory

# -------------------------------------------------------------------------------------------------
# Binding Keys
# -------------------------------------------------------------------------------------------------
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char

# ^[[1~^[[4~^
bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line

# -------------------------------------------------------------------------------------------------
### Aliases
# -------------------------------------------------------------------------------------------------
# go (packages)
#alias air="\$(go env GOPATH)/bin/air"
#alias sqlc="\$(go env GOPATH)/bin/sqlc"
#alias goose="\$(go env GOPATH)/bin/goose"
#alias templ="\$(go env GOPATH)/bin/templ"

# exa
alias exa="exa --icons -laa"

# vim opens nvim
alias vim="nvim"

# git
alias gigh="echo 'initiating git config for Git Hub account...'
\git init 
\git config user.name filipeapdo 
\git config user.email filipeaparecido@gmail.com"

alias gs="git status"
alias gsi="git status --ignored"
alias gl="git log"
alias glo="git log --oneline"

# fzf and cd
alias fdcd="cd \$(fd -t d | fzf)"
alias facd="cd \$(fd -H | fzf)"

# fzf and open vim
alias ffnv="nvim \$(fd | fzf)"
alias fdnv="nvim \$(fd -t d | fzf)"
alias fanv="nvim \$(fd -H | fzf)"

# fzf on history
alias ffh="history 1 | fzf"

# -------------------------------------------------------------------------------------------------
# ASDF
# -------------------------------------------------------------------------------------------------
. "$HOME/.asdf/asdf.sh"

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)

# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

# -------------------------------------------------------------------------------------------------
# Docker
# -------------------------------------------------------------------------------------------------

# -------------------------------------------------------------------------------------------------
# PATH
# -------------------------------------------------------------------------------------------------
# go packages' binaries
export PATH=$(go env GOPATH)/bin:$PATH

# ---------------------------------------------- eof ----------------------------------------------
