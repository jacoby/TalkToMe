#!/usr/bin/env perl

use Email::MIME::Kit ;
use Email::Sender::Simple qw(sendmail) ;
use Email::Sender::Transport::SMTP qw() ;
use Email::Sender::Transport::SMTP::TLS ;

my $kit = Email::MIME::Kit->new( 
    { source => '/home/djacoby/var/status/status.mkit' } ) ;
my $date = DateTime->now()->ymd() ;

my $object ;
$object->{ date } = $date ;
$object->{ status } = $statuses->{ status } ;

my $email = $kit->assemble( $object ) ;
my $transport = Email::Sender::Transport::SMTP::TLS->new(
    helo     => 'smtp.purdue.edu' ,
    host     => 'smtp.purdue.edu' ,
    password => 'abc123' ,
    port     => 587 ,
    username => 'djacoby' ,
    ) ;

sendmail( $email, { transport => $transport } ) ;

__DATA__

----- manifest.json --------------------------------------------------------------
{
    "renderer": "TT",
    "header": [
        { "From": "Dave Jacoby <djacoby@purdue.edu>" },
        { "To": "Dave Jacoby <djacoby@purdue.edu>" },
        { "Subject": "Status Report: [% date %]" }
        ],
    "alternatives": [
        { "type": "text/plain", "path": "body.txt" },
        {
            "type": "text/html",
            "path": "body.html"
            }
        ]
    }

----- body.txt -------------------------------------------------------------------

Status Report - [% date %] 

[% FOREACH s = status %]
    * [% s.text %] 
[% END %]


----- body.html ------------------------------------------------------------------

<html>
    <head>
    <style>
        * {
            font-family: "Trebuchet MT" , Helvetica , Arial , sans-serif;
            }
    </style>
    </head>
<h2> Status Report - [% date %] </h2>
<ul>
    [% FOREACH s = status %]
    <li> <span> [% s.text %] </span></li>
    [% END %]
</ul>

