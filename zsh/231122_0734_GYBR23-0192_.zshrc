# -------------------------------------------------------------------------------------------------
#
# +++ Startup Commands +++
#
# -------------------------------------------------------------------------------------------------
# neofetch
zsh -c 'neofetch'

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

# -------------------------------------------------------------------------------------------------
# History Config
# ------------------------------------------------------------------------------------------------
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

# -------------------------------------------------------------------------------------------------
### Aliases
# -------------------------------------------------------------------------------------------------
alias code="code .&"
alias exa="exa --icons -laa"

# GIT
alias gs="git status"
alias gsi="git status --ignored"
alias gl="git log"
alias glo="git log --oneline"
alias gigh="
git init && \
git config user.name filiapdo && \
git config user.email filipeaparecido@gmail.com
"

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

# ---------------------------------------------- eof ----------------------------------------------

