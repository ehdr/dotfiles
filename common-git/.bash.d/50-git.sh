is_interactive_shell || return

function git-prune-merged-branches () {
    default_branch="$(git symbolic-ref refs/remotes/origin/HEAD | sed 's|^refs/remotes/origin/||')"
    main_branch="${1:-$default_branch}"

    echo "Checking merged branches against main branch '$main_branch'..."

    merged_branches=""
    for b in $(git for-each-ref refs/heads --format="%(refname:short)" | grep -v ${main_branch}); do
        # git cherry prefixes each commit with "+" if it's not included and "-" if it is, so check if there are no "+" lines:
        if [[ ! $(git cherry ${main_branch} ${b} | grep "^+") ]]; then
            merged_branches="${merged_branches} ${b}"
        fi
    done

    branches_to_delete=""
    for b in ${merged_branches}; do
        if df_confirm "Delete branch: ${b}?"; then
            branches_to_delete="${branches_to_delete} ${b}"
        fi
    done

    if [ -n "${branches_to_delete}" ]; then
        git branch -D ${branches_to_delete}
    fi
}

function git-cleanup () {
    echo "Pruning merged branches..."
    git-prune-merged-branches
    echo "GC and pruning..."
    git gc --prune=now  # clean up "loose objects": https://stackoverflow.com/q/21457407/5039
}

function git-absolute-path () {
    fullpath=$([[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}")
    gitroot="$(git rev-parse --show-toplevel)" || return 1
    [[ "$fullpath" =~ "$gitroot" ]] && echo "${fullpath/$gitroot\//}"
}
