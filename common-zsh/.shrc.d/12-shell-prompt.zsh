is_interactive_shell || return

if [ -n "$LOGNAME" -a "$LOGNAME" = "$(whoami)" ]; then
    _df_prompt_color=cyan
    _df_prompt_character='$'
elif [ -n "$USER" -a "$USER" = "root" ]; then
    _df_prompt_color=blue
    _df_prompt_character='#'
else
    _df_prompt_color=magenta
    _df_prompt_character='$'
fi

setopt prompt_subst

if is_color_capable_shell; then
    PROMPT='${debian_chroot}$(pwd_tail)$(git_stashes)%(?.%F{$_df_prompt_color}.%F{red})${_df_prompt_character}%f '
else
    PROMPT='${debian_chroot}$(pwd_tail)$(git_stashes)${_df_prompt_character} '
fi
