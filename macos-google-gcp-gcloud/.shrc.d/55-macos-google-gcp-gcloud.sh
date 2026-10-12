is_interactive_shell || return

if is_installed gcloud; then
    source "${HOMEBREW_PREFIX}/share/google-cloud-sdk/path.${DF_SHELL}.inc"
fi
