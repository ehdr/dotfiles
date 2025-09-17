set -g fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
    # Anything that produces output should go here

    set -g __fish_git_prompt_showstashstate true
    set -g __fish_git_prompt_showcolorhints true
    set -g __fish_git_prompt_use_informative_chars true

    function fish_prompt_loading_indicator -a last_prompt
        echo -n "$last_prompt" | sed -r 's/\x1B\[[0-9;]*[JKmsu]//g' | read -zl uncolored_last_prompt
        echo -n (set_color brblack)"$uncolored_last_prompt"(set_color normal)
    end
end
