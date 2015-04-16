#!/usr/bin/env perl

my $message = "Hi, Dave" ;

my $message_obj ;
$message_obj->{ message } = $message ;
$message_obj->{ title }   = $message ;
$message_obj->{ user }    = 'abc123' ;
$message_obj->{ token }   = 'def456' ;

# $message_obj->{ device }  = $name_of_device ;
my $r = LWP::UserAgent->new()
    ->post( "https://api.pushover.net/1/messages.json", $message_obj ) ;
if ( $r->code eq '200' ) {
    print qq{Success\n} ;
    }
