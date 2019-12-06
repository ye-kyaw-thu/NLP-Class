#!/usr/bin/perl

use strict;
use warnings;
use utf8;

binmode(STDIN, ":utf8");
binmode(STDOUT, ":utf8");
binmode(STDERR, ":utf8");

my $con = "က ခ ဂ ဃ င စ ဆ ဇ ဈ ည ဋ ဌ ဍ ဎ ဏ တ ထ ဒ ဓ န ပ ဖ ဗ ဘ မ ယ ရ လ ဝ သ ဟ ဠ အ ဣ ဤ ဥ ဦ ဧ ဩ ဪ ါ ာ ိ ီ ု ူ ေ ဲ ံ ့ း ္  ် ျ ြ ွ ှ ဿ ၀ ၁ ၂ ၃ ၄ ၅ ၆ ၇ ၈ ၉ ၊ ။ ၌ ၍ ၏";
$con =~ s/( )( )/ /g;


print ("-\t0\n");
my @arr = split (/ /,$con);
for my $i (0..$#arr) {
    print $arr[$i]."\t";
    print $i+1;
    print "\n";
    }



