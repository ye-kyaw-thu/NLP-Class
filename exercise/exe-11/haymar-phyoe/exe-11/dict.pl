#!/usr/bin/perl

use strict;
use warnings;
use utf8;

binmode(STDIN, ":utf8");
binmode(STDOUT, ":utf8");
binmode(STDERR, ":utf8");

use List::MoreUtils qw(uniq);

my $a=0;
my $b=1;
my $out;
my @all;
my $line;
my $tag;


open (my $wordFILE,"<:encoding(utf8)", "mypos-word.txt") or die "Couldn't open file !, $!\n";
open (my $tagFILE,"<:encoding(utf8)", "mypos-tag.txt") or die "Couldn't open file !, $!\n";

while (!eof($wordFILE) && ($tagFILE))  {

    $line = <$wordFILE>;
    $tag = <$tagFILE>;
    chomp ($line);
    chomp ($tag);

    my @segword = split ( / /,$line);
    my @segtag = split ( / /,$tag);

    for my $i (0..$#segword) {
    my $segtag = $segtag[$i];
    my $segword =$segword[$i];

    $out = "$segtag\t$segword";
    push @all, $out; }
}
close($wordFILE);
close($tagFILE);


my @unique = uniq (@all);

    for my $i (0..$#unique) {
    my $seg = $unique[$i];
    
    $out = "0\t0\t$seg\n";
       
    $a++;
    $b++;
    #if ($out !~ /^ *$/){
    print ($out); 
}
print ("0");


