# tmux-imap

## Installation

1.) install and setup the IMAP check perl script.

    cp imap-check.pl ~
    cp imap-config.pl.example ~/imap-config.pl
    # edit your imap settings
    vim ~/imap-config.pl
    # test it
    ~/imap-check.pl

2.) Update your TMUX config:

Here is an example excerpt from my config:

    ###########################
    # Plugins
    ###########################

    # plugins
    set -g @plugin 'tmux-plugins/tmux-battery'
    set -g @plugin 'gergap/tmux-imap'
    #set -g status-right 'Batt: #{battery_icon} #{battery_percentage} #{battery_remain} #[fg=green]#H#[default] %a %h-%d %H:%M '
    set -g status-right '#{mail_icon} Batt: #{battery_icon} #{battery_percentage} #{battery_remain} #[fg=green]#H#[default] %a %h-%d %H:%M '
    set -g status-right-length 60

    # Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
    run '~/.tmux/plugins/tpm/tpm'

