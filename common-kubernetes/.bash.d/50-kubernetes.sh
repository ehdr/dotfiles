is_interactive_shell || return

alias k=kubectl
alias kn=kubens
alias kx=kubectx
alias mk='minikube kubectl --'

function kgpg { kubectl get pods --sort-by=.metadata.creationTimestamp | egrep ${@:-''}; }
function kgpg1p {
    result=$(kgpg $*)
    if [ -z "$result" -o "$(echo "$result" | grep -c '^')" != "1" ]; then
        >&2 echo "Need exactly one match, but got:"
        >&2 echo
        >&2 echo "$result"
        return 1;
    fi
    echo "$result" | cut -d' ' -f1
}
function klg { pod=$(kgpg1p $*); (set -x; kubectl logs "$pod"; ) }
function kesg { pod=$(kgpg1p $*); (set -x; kubectl exec -it "$pod" sh; ) }
