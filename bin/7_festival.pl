#!/usr/bin/env perl

my $message = "Hi, Dave" ;
my $speak =<<SPEAK;
echo "$message" | \
    /usr/bin/espeak --stdin --stdout -v en+f3 -s 140 -p 60 | \
    /usr/bin/paplay
SPEAK

qx{ $speak } ;

# -v en+f3 --> voice = english-speaking female #3
# -s 140   --> slightly fast
# -p 60    --> pitch
