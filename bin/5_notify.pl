#!/usr/bin/env perl

my $title = "Hi, Dave" ;
my $message = "I'm saying hi from within your computer" ;
my $icon = $ENV{ HOME } . '/Pictures/Icons/icon_black_muffin.alpha.png' ;

`notify-send "$title" "$body" -i $icon  ` ;
