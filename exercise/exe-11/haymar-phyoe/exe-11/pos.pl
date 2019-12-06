#!/usr/bin/perl

use strict;
use warnings;
use utf8;
use List::MoreUtils qw(uniq);

binmode(STDIN, ":utf8");
binmode(STDOUT, ":utf8");
binmode(STDERR, ":utf8");

my $out;
my $a=1;
my $tag;
my @all_tag;

open (my $tagFILE,"<:encoding(utf8)", "mypos-tag.txt") or die "Couldn't open file !, $!\n";

while (!eof($tagFILE))  {

    $tag = <$tagFILE>;
    chomp ($tag);
    my @segtag = split (/ /,$tag);
    foreach my $ea (@segtag){
        push @all_tag, $ea;}
}

close($tagFILE);


print ("-\t0\n");

my @unique_segtag = uniq (@all_tag);

    for my $i (0..$#unique_segtag) {
    my $seg = $unique_segtag[$i];
    
    $out = "$seg\t$a\n";
   
    $a++;
    print ($out); }




	

