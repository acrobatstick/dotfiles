export DRI_PRIME=1
export XDG_SESSION_TYPE=wayland
export WAYLAND_DISPLAY=wayland-1

# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="cypher"
ZLE_RPROMPT_INDENT=0

plugins=(
  git
  zsh-autosuggestions
)

source "$ZSH/oh-my-zsh.sh"

# Aliases
alias vi=nvim

# gvm
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# SDKMAN (must be near the end)
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# wal
(cat ~/.cache/wal/sequences &)

# Functions
goto() {
  cd "$(dh goto "$1")"
}

git-lines() {
  git ls-files | xargs wc -l
}

kitty-reload() {
  kill -SIGUSR1 "$(pidof kitty)"
}

# --------------------
# PATH
# --------------------

export GOPATH="$HOME/go"
export BUN_INSTALL="$HOME/.bun"

export PATH="$HOME/.local/bin:$GOPATH/bin:$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.asdf/bin:$HOME/.asdf/shims:$PATH"
export PATH="$HOME/.turso:$HOME/.spicetify:$PATH"
export PATH="$HOME/Programs/nsq/build:$PATH"

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
