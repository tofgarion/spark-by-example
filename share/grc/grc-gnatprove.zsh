if (( $+commands[grc] )); then
    function gnatprove(){
        =grc --colour=auto gnatprove "$@"
    }
fi
