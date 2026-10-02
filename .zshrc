export ZSH="$HOME/.oh-my-zsh"

plugins=(
  git
  bun
  rust
  macos
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#421173,bold"

. "$HOME/.local/bin/env"

export LANG=en_US.UTF-8
export JAVA_HOME=$(/usr/libexec/java_home)
export NVM_DIR="$HOME/.nvm"
export PATH="/Users/josephbarbier/verapdf:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

_load_nvm() {
  unset -f nvm node npm npx
  [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
}

nvm() {
  _load_nvm
  nvm "$@"
}

node() {
  _load_nvm
  node "$@"
}

npm() {
  _load_nvm
  npm "$@"
}

# Useful aliases
alias activate='source ~/.activate_venv'
alias push='git add -A; git commit -m autopush; git push'
alias pull='git pull'
alias a='git add -A'
alias p='git push'
alias gmain='git checkout main'
alias c='cd; cd l'
alias oz='positron ~/.zshrc'
alias dev='npm run dev'

# alias for git commits
q() {
  [[ -z "$*" ]] && return 1
  git commit -m "$*"
}


export PATH="/Users/josephbarbier/verapdf:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# rust error verbosity
export RUST_BACKTRACE=1

export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
bindkey '\t' autosuggest-accept

# Android development
export ANDROID_HOME="/opt/homebrew/share/android-commandlinetools"
export NDK_HOME="$ANDROID_HOME/ndk/27.3.13750724"
export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"

# Load secrets if they exist
if [ -f "$HOME/.secrets" ]; then
  source "$HOME/.secrets"
fi

eval "$(starship init zsh)"

# Syntax highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# tokei with percentages
tk() {
  tokei \
    --exclude '*.json' \
    --exclude '*.xml' \
    --exclude '*.md' \
    --exclude '*.markdown' \
    --exclude '*.toml' \
    --exclude '*.txt' \
    --exclude '*.svg' \
    --output json |
  jq -r '
    to_entries |
    map(
      select(
        .key != "Total" and
        (.value | type == "object" and has("code"))
      ) |
      {
        lang: .key,
        lines: (.value.code + .value.comments + .value.blanks)
      }
    ) |
    (map(.lines) | add) as $total |
    sort_by(-.lines) |
    ["LANGUAGE", "LINES", "PERCENT"],
    (.[] | [.lang, .lines, "\((.lines / $total * 10000 | round) / 100)%"]),
    ["TOTAL", $total, "100%"] |
    @tsv
  ' | column -t
}
