#!/usr/bin/perl
# Gets the number of unread mails from an IMAP server
# using SSL.

use strict;
use Mail::IMAPClient;
use IO::Socket::SSL;

# source config file
our ($host, $port, $user, $pass, $CA);
do "$ENV{HOME}/imap-config.pl";

my $socket = IO::Socket::SSL->new(
  PeerAddr => $host,
  PeerPort => $port,
  SSL_ca_file => $CA
 )
 or die "socket(): $@";

my $client = Mail::IMAPClient->new(
  Socket   => $socket,
  User     => $user,
  Password => $pass,
 )
 or die "new(): $@";

if ($client->IsAuthenticated()) {
   my $msgct;

   $client->select("INBOX");
   $msgct = $client->unseen_count||'0';
   print "$msgct\n";
}

$client->logout();

