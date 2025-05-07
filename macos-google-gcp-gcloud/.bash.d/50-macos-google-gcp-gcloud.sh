is_interactive_shell || return

if is_installed gcloud; then
    source "$(brew --prefix)/share/google-cloud-sdk/path.bash.inc"
fi
