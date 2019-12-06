#!/usr/bin/perl

use strict;
use warnings;
use utf8;
use List::MoreUtils qw(uniq);

binmode(STDIN, ":utf8");
binmode(STDOUT, ":utf8");
binmode(STDERR, ":utf8");

my $a=0;
my $b=1;
my $out;
my $tag;
my @all_tag;

open (my $tagFILE,"<:encoding(utf8)", "mypos-tag.txt") or die "Couldn't open file !, $!\n";

while (!eof($tagFILE))  {

    $tag = <$tagFILE>;
    chomp ($tag);
   
    my @segtag = split (/ /,$tag);

    foreach my $ea (@segtag){
    $out = "$a\t$b\t$ea\n";
    print ($out); 
    $a++;
    $b++;
    $a=$b-1;
    }

    print ($a);
    print ("\n");
    $a=0;
    

}close($tagFILE);



	

