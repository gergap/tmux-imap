# tmux-imap

## Installation

The recommended way of installing this TMUX plugin is using TPM.
See https://github.com/tmux-plugins/tpm

After installing TPM you add this line to your ~/.tmux.conf:

    set -g @plugin 'gergap/tmux-imap'

Then press ```<prefix> I``` for installing the plugin.
This will clone the git repository to ~/.tmux/plugins.
Now follow the instructions below to setup the IMAP plugin.

1.) install and setup the IMAP check perl script.

    cd ~/.tmux/plugins/tmux-imap
    cp imap-check.pl ~
    cp imap-config.pl.example ~/imap-config.pl
    # edit your imap settings
    vim ~/imap-config.pl
    # test it
    ~/imap-check.pl

This should output the number of unread mails.

    # now add a cronjob for this task. This way we can higher status bar update frequency than imap poll frequency.
    crontab -e

    * * * * * ~/imap-check.pl > ~/imap-status.txt 2>/dev/null

2.) Update your TMUX config:

Here is an example excerpt from my config:

    ###########################
    # Plugins
    ###########################

    # plugins
    set -g @plugin 'tmux-plugins/tmux-battery'
    set -g @plugin 'gergap/tmux-imap'
    set -g status-right '#{mail_icon} Batt: #{battery_icon} #{battery_percentage} #{battery_remain} #[fg=green]#H#[default] %a %h-%d %H:%M '
    set -g status-right-length 60

    # Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
    run '~/.tmux/plugins/tpm/tpm'

## Requirements

* Perl
* Mail-IMAPClient perl module

Installation depends on your distribution.

Gentoo:

    emerge dev-perl/Mail-IMAPClient

