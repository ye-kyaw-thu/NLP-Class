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
my $word;
my @all_word;

open (my $wordFILE,"<:encoding(utf8)", "mypos-word.txt") or die "Couldn't open file !, $!\n";

while (!eof($wordFILE))  {

    $word = <$wordFILE>;
    chomp ($word);
    my @segword = split (/ /,$word);
    foreach my $ea (@segword){
        push @all_word, $ea;}
}

close($wordFILE);


print ("-\t0\n");

my @unique_segword = uniq (@all_word);

    for my $i (0..$#unique_segword) {
    my $seg = $unique_segword[$i];
    
    $out = "$seg\t$a\n";
   
    $a++;
    print ($out); }





	

