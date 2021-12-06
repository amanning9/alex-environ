opin() {
    export PERSIST_OP=1
    opon
}

opout() {
    unset PERSIST_OP
    opoff
}

opon() {
    op list vaults 2>&1 > /dev/null || unset OP_SESSION_my
    if [[ -z $OP_SESSION_my ]]; then
        eval $(op signin my)
    fi
}

opoff() {
    if [[ -z $PERSIST_OP ]]
    then
        op signout
    fi
}
