# ~/.zshrc - Zsh configuration migrated from ~/.bashrc & ~/.bash_aliases

# Environment & PATH setup
export PATH="$HOME/.atuin/bin:$HOME/.local/bin:$HOME/bin:$PATH"

# History Configuration
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# Enable Completion System
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Load Zsh Plugins (Debian package locations)
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Load Zsh Aliases & Custom Functions
if [ -f ~/.zsh_aliases ]; then
    source ~/.zsh_aliases
elif [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# Initialize Tools & Integrations
# Mise (Dev tools & environment manager)
if command -v mise &>/dev/null; then
    eval "$(mise activate zsh)"
fi

# 1. Starship Prompt (Fast Rust-based prompt)
if command -v starship &>/dev/null; then
    eval "$(starship init zsh)"
fi

# 2. Zoxide (Smarter cd replacement)
if command -v zoxide &>/dev/null; then
    eval "$(zoxide init zsh)"
fi

# 3. FZF (Fuzzy Finder & Ripgrep integration)
if [ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]; then
    source /usr/share/doc/fzf/examples/key-bindings.zsh
fi
if [ -f /usr/share/doc/fzf/examples/completion.zsh ]; then
    source /usr/share/doc/fzf/examples/completion.zsh
fi
if command -v rg &>/dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!{.git,node_modules}*"'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

# 4. Atuin (Magical shell history search)
if command -v atuin &>/dev/null; then
    eval "$(atuin init zsh)"
fi

# 5. Native Kubectl Autocomplete for 'k' alias
if command -v kubectl &>/dev/null; then
    alias k=kubectl
    source <(kubectl completion zsh)
    compdef __start_kubectl k 2>/dev/null
fi


# Quality of Life Aliases
alias ls='ls --color=auto'
alias ll='ls -la'
alias la='ls -A'
alias aaSourceZshrc="source ~/.zshrc"

