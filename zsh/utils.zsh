# helper functions

function mac2ip() {
    arp -a | sed -n "s/.*(\(.*\)) at "$1".*/\1/p"
}

# chip / pocket chip

alias chipip="mac2ip \"7c:c7:9:b7:e6:f7\""
alias ssh2chip="ssh chip@\"`chipip`\""
