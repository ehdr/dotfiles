## Set up PATH for Xcode utilities
PATH=$(path_prepend "$PATH" "/Applications/Xcode.app/Contents/Developer/usr/bin")

## Set up Java JDK
export JAVA_HOME=$(/usr/libexec/java_home)


is_interactive_shell || return

export CLICOLOR=1
