is_interactive_shell || return

function ghopen () {
    if [ "$1" = "-m" ]; then
        local default_branch="$(git symbolic-ref refs/remotes/origin/HEAD | sed 's|^refs/remotes/origin/||')"
        local commit="$default_branch"
        shift
    else
        local commit="$(git rev-parse HEAD)"
    fi
    open "https://github.com/$(git ls-remote --get-url origin | perl -pe 's/^git\@github\.com:(.+?)(\.git)?$/$1/')/tree/${commit}/$(git-absolute-path ${1:-.})"
}
