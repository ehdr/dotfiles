is_interactive_shell; or return

abbr -a k kubectl
abbr -a kn kubens
abbr -a kx kubectx
abbr -a mk 'minikube kubectl --'

function kgpg
    kubectl get pods --sort-by=.metadata.creationTimestamp | grep -E $argv
end

function kgpg1p
    set -l result (kgpg $argv)
    if test -z "$result" -o (echo "$result" | wc -l) -ne 1
        echo "Need exactly one match, but got:" >&2
        echo >&2
        echo "$result" >&2
        return 1
    end
    echo "$result" | cut -d' ' -f1
end

function klg
    set -l pod (kgpg1p $argv)
    and set -x
    and kubectl logs "$pod"
end

function kesg
    set -l pod (kgpg1p $argv)
    and set -x
    and kubectl exec -it "$pod" sh
end
