set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8

if test -r ~/.env.local
    source ~/.env.local
end
