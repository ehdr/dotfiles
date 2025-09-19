set -g fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
    # Anything that produces output should go here

    set -g __fish_git_prompt_show_informative_status true
    set -g __fish_git_prompt_use_informative_chars true
    set -g __fish_git_prompt_showstashstate true
    set -g __fish_git_prompt_showcolorhints true
end
