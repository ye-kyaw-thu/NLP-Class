#!/usr/bin/perl

use strict;
use warnings;
use utf8;

binmode(STDIN, ":utf8");
binmode(STDOUT, ":utf8");
binmode(STDERR, ":utf8");

open (my $inputFILE,"<:encoding(utf8)", $ARGV[0]) or die "Couldn't open input file $ARGV[0]!, $!\n";

while (!eof($inputFILE)) {
     
    my $line = <$inputFILE>;
    if (($line ne '') & ($line !~ /^ *$/)) {
        chomp($line);

	my @arr = split (/\t/, $line);
	my @gra = split(/ /,$arr[0]);
	my @pho = split (/ /,$arr[1]);
	
    	for my $i (0..$#gra) {
    	my $gra = $gra[$i];
    	my $pho =$pho[$i];
	my $out = $gra."\/".$pho." ";
	print $out;}
}
print "\n";
}
close ($inputFILE);


