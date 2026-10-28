# ~/.zprofile: Executed for Zsh login shells

# Source ~/.profile to inherit system environment, user PATH additions, etc.
if [ -f "$HOME/.profile" ]; then
    emulate sh -c 'source "$HOME/.profile"'
fi
