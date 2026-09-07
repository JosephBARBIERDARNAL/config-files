
export ZSH="$HOME/.oh-my-zsh"


plugins=(
  git
  node
  bun
  npm
  python
  rust
  macos
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export LANG=en_US.UTF-8

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#421173,bold"


export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

. "$HOME/.local/bin/env"

export JAVA_HOME=$(/usr/libexec/java_home)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Useful aliases
alias activate='source ~/.activate_venv'
alias push='git add -A; git commit -m autopush; git push'
alias pull='git pull'
alias a='git add -A'
alias p='git push'
alias gmail='git checkout main'
alias c='cd; cd l'
alias oz='positron ~/.zshrc'
alias dev='npm run dev'

q() {
  [[ -z "$*" ]] && return 1
  git commit -m "$*"
}


export PATH="/Users/josephbarbier/verapdf:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# rust error verbosity
export RUST_BACKTRACE=1

export ZSH_AUTOSUGGEST_STRATEGY=(completion history)
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '\t' autosuggest-accept

# bun completions
[ -s "/Users/josephbarbier/.bun/_bun" ] && source "/Users/josephbarbier/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Turso
export PATH="$PATH:/Users/josephbarbier/.turso"
export PATH="/Users/josephbarbier/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/Users/josephbarbier/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
# Add quarto to the path
if [[ -d /Users/josephbarbier/Applications/quarto/bin ]]; then
  export PATH="/Users/josephbarbier/Applications/quarto/bin:$PATH"
fi

# Android development
export ANDROID_HOME="/opt/homebrew/share/android-commandlinetools"
export NDK_HOME="$ANDROID_HOME/ndk/27.3.13750724"
export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"

# Load secrets if they exist
if [ -f "$HOME/.secrets" ]; then
  source "$HOME/.secrets"
fi

eval "$(air generate-shell-completion zsh)"

eval "$(starship init zsh)"

# Syntax highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
