# to flex on all users
#neofetch


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
ENABLE_CORRECTION="true"

source ~/antigen.zsh
antigen use oh-my-zsh

# plugins
antigen bundle git
# colured man pages
antigen bundle ael-code/zsh-colored-man-pages
#antigen bundle command-not-found
#antigen bundle gsamokovarov/jump
antigen bundle common-aliases
antigen bundle git-extras
antigen bundle git-flow
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-history-substring-search
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=white'
antigen bundle agkozak/zsh-z
antigen bundle jeffreytse/zsh-vi-mode
#antigen bundle marlonrichert/zsh-autocomplete
#antigen bundle zsh-users/zsh-completions


# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme romkatv/powerlevel10k

# Tell Antigen that you're done.
antigen apply

# To customize prompt, run p10k configure or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
alias config='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'
alias n='nvim'
alias stt='speedtest'
