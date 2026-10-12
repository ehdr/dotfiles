is_interactive_shell || return

function LS () { ls -d ${*}${*+/}[A-Z]*; }
function l. () { ls -d ${*}${*:+/}.*; }
