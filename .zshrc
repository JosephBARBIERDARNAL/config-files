export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="%F{red}waiting...%f"

plugins=(
  git
  node
  bun
  npm
  web-search
  python
  rust
  macos
)

source $ZSH/oh-my-zsh.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export LANG=en_US.UTF-8


export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

. "$HOME/.local/bin/env"

export JAVA_HOME=$(/usr/libexec/java_home)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias activate='source ~/.activate_venv'
alias push='git add -A; git commit -m autopush; git push'
alias pull='git pull'
alias a='git add -A'
alias p='git push'
alias st='git status'
alias c='cd; cd l'
alias oz='positron ~/.zshrc'
alias dev='npm run dev'

q() {
  [[ -z "$*" ]] && return 1
  git commit -m "$*"
}


# translation
jt() {
  [[ -z "$*" ]] && return 1
  justq t "$*"
}

# correction
jc() {
  [[ -z "$*" ]] && return 1
  justq correct "$*"
}

# ask question
ja() {
  [[ -z "$*" ]] && return 1
  justq ask "$*"
}

export PATH="$HOME/verapdf:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '\t' autosuggest-accept

[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export ANDROID_HOME="/opt/homebrew/share/android-commandlinetools"
export NDK_HOME="$ANDROID_HOME/ndk/27.3.13750724"
export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"

eval "$(air generate-shell-completion zsh)"

eval "$(starship init zsh)"
