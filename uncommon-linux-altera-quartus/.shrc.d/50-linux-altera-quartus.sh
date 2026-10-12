# Altera Quartus II
if [ -d "$HOME/opt/altera/quartusii/current/quartus/bin" ]; then
    PATH=$(path_prepend "$PATH" "$HOME/opt/altera/quartusii/current/quartus/bin")
fi

## Altera Quartus II
QUARTUS_ROOTDIR="$HOME/opt/altera/quartusii/current/quartus"
