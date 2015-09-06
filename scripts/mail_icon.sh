#!/usr/bin/env bash

# script local variables
new_mail_icon="✉ "
no_mail_icon="-"

print_icon() {
    local status=$1
    if [ "$status" == "0" ]; then
        printf "$new_mail_icon($status) "
    else
        printf "#[fg=green]$new_mail_icon($status) #[default]"
    fi
}

main() {
    local status=$(~/imap-check.pl)
    print_icon "$status"
}

main

