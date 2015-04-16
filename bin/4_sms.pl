#!/usr/bin/env perl

use WWW::Twilio::API ;
my $twilio = WWW::Twilio::API->new(
    AccountSid => 'abc123' ,
    AuthToken  => 'def456' ,
    ) ;

my $message = "Hi, Dave" ;
my $response = $twilio->POST(
    'SMS/Messages',
    From => '+17655550001' ,
    To   => '+17655550002' ,
    Body => $message ,
    ) ;
