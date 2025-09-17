is_interactive_shell; or return

function git-prune-merged-branches
    set -l default_branch (git symbolic-ref refs/remotes/origin/HEAD | sed 's|^refs/remotes/origin/||')
    set -l main_branch $argv[1]
    if test -z "$main_branch"
        set main_branch $default_branch
    end

    echo "Checking merged branches against main branch '$main_branch'..."

    set -l merged_branches
    for b in (git for-each-ref refs/heads --format="%(refname:short)" | grep -v $main_branch)
        if not git cherry $main_branch $b | grep -q "^+"
            set -a merged_branches $b
        end
    end

    set -l branches_to_delete
    for b in $merged_branches
        if read -P "Delete branch: $b? [y/N] " -n 1 reply; and test "$reply" = "y"
            set -a branches_to_delete $b
        end
    end

    if test -n "$branches_to_delete"
        git branch -D $branches_to_delete
    end
end

function git-cleanup
    echo "Pruning merged branches..."
    git-prune-merged-branches
    echo "GC and pruning..."
    git gc --prune=now  # clean up "loose objects": https://stackoverflow.com/q/21457407/5039
end

function git-absolute-path
    set -l fullpath (path resolve $argv[1])
    set -l gitroot (git rev-parse --show-toplevel; or return 1)
    if string match -q "$gitroot*" "$fullpath"
        string replace "$gitroot/" "" "$fullpath"
    end
end
