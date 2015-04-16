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


__DATA__

<?php
        // Dave Jacoby 2012-02-14 
        // Make a phone call
    header("content-type: text/xml");
    echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";
    ?>
<Response>
    <Pause length="4" />
    <Say voice="woman" language="en" >
        <?php echo $_GET['message'] ; ?>
    </Say>
</Response>
