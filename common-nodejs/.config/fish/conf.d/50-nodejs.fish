is_installed nvm; or return

set -gx NVM_DIR (test -z "$XDG_CONFIG_HOME"; and printf %s "$HOME/.nvm"; or printf %s "$XDG_CONFIG_HOME/nvm")

if test -s "$NVM_DIR/nvm.sh"
    source "$NVM_DIR/nvm.sh"
end
