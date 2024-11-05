# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk


zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-history-substring-search
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light djui/alias-tips
zinit light romkatv/powerlevel10k

zinit snippet OMZL::git.zsh
zinit snippet OMZL::history.zsh
zinit snippet OMZL::prompt_info_functions.zsh

zinit snippet OMZP::common-aliases
zinit snippet OMZP::command-not-found
zinit snippet OMZP::git
zinit snippet OMZP::history
zinit snippet OMZP::golang
zinit snippet OMZP::python
zinit snippet OMZP::pyenv
zinit snippet OMZP::virtualenv

zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zinit light trapd00r/LS_COLORS
autoload -Uz compinit
compinit
autoload -U colors
colors

export LANG=en_US.UTF-8
export LANGUAGE=
export LC_CTYPE="en_US.UTF-8"
export LC_NUMERIC=lzh_TW
export LC_TIME=lzh_TW
export LC_COLLATE="en_US.UTF-8"
export LC_MONETARY=lzh_TW
export LC_MESSAGES="en_US.UTF-8"
export LC_PAPER=lzh_TW
export LC_NAME=lzh_TW
export LC_ADDRESS=lzh_TW
export LC_TELEPHONE=lzh_TW
export LC_MEASUREMENT=lzh_TW
export LC_IDENTIFICATION=lzh_TW
export LC_ALL=

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


### goenv
export GOENV_ROOT="$HOME/.goenv"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$GOENV_ROOT/bin:$GOENV_ROOT/shims:$PATH"
eval "$(goenv init -)"
