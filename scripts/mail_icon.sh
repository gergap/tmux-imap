#!/usr/bin/env bash

# script local variables
new_mail_icon="✉ "
no_mail_icon="-"

print_icon() {
    local status=$1
    if [ "$status" == "0" ]; then
        printf "$new_mail_icon($status) "
    elif [ "$status" == "N/A" ]; then
        printf "#[fg=red]$new_mail_icon($status) #[default]"
    else
        printf "#[fg=green]$new_mail_icon($status) #[default]"
    fi
}

main() {
    status=$(cat ~/imap-status.txt) || status="N/A"
    print_icon "$status"
}

main

