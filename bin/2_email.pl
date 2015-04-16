#!/usr/bin/env perl

use Email::Sender::Simple qw(sendmail) ;
use Email::Sender::Transport::SMTP::TLS ;
use Email::Simple ;
use Email::Simple::Creator ;

my $message = "Hi, Dave" ;
my $email = Email::Simple->create( body => $message, ) ;
$email->header_set( 'to'        , 'jacoby@purdue.edu' ;
$email->header_set( 'from'      , 'jacoby@purdue.edu' ;
$email->header_set( 'subject'   , $message ) ;

my $transport = Email::Sender::Transport::SMTP::TLS->new(
    helo     => 'smtp.purdue.edu' ,
    host     => 'smtp.purdue.edu' ,
    password => 'abc123' ,
    port     => 587 ,
    username => 'djacoby' ,
    ) ;

sendmail( $email, { transport => $transport } ) ;
