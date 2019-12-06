#!/usr/bin/perl

use strict;
use warnings;
use utf8;

binmode(STDIN, ":utf8");
binmode(STDOUT, ":utf8");
binmode(STDERR, ":utf8");

my $con = "က ခ ဂ ဃ င စ ဆ ဇ ဈ ည ဋ ဌ ဍ ဎ ဏ တ ထ ဒ ဓ န ပ ဖ ဗ ဘ မ ယ ရ လ ဝ သ ဟ ဠ အ ဣ ဤ ဥ ဦ ဧ ဩ ဪ ါ ာ ိ ီ ု ူ ေ ဲ ံ ့ း ္ ် ျ ြ ွ ှ ဿ ၀ ၁ ၂ ၃ ၄ ၅ ၆ ၇ ၈ ၉ ၊ ။ ၌ ၍ ၏";
$con =~ s/( )( )/ /g;
my @arr = split (/ /,$con);
for my $i (0..$#arr) {
    print "0\t0\t".$arr[$i]."\t-\t1.0\n";
    print "0\t0\t-\t".$arr[$i]."\t1.0\n";
}

my $i;
my $j;
for $i (0..$#arr) {
    for $j (0..$#arr) {
	print "0\t0\t";
	my $a = $arr[$i];
	print $arr[$i];
	print "\t";	
	my $b= $arr[$j];
	print $arr[$j];
	if ($a eq $b){
	print "\t0.00\n";
	 }
	else {
	print "\t1.00\n"; }
}
}
print ("0");



