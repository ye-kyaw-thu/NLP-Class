#!/usr/bin/perl

use strict;
use warnings;
use utf8;

binmode(STDIN, ":utf8");
binmode(STDOUT, ":utf8");
binmode(STDERR, ":utf8");

open (my $inputFILE,"<:encoding(utf8)", $ARGV[0]) or die "Couldn't open input file $ARGV[0]!, $!\n";

my @gra;
my @pho;

while (!eof($inputFILE)) {
     
    my $line = <$inputFILE>;
    if (($line ne '') & ($line !~ /^ *$/)) {
	chomp($line);

	my @arr = split (/ /, $line);
	foreach my $i (@arr){
	    my @ar = split (/\//, $i);

	    push @gra, $ar[0];
	    push @pho, $ar[1]; }

	foreach my $i (@gra) {
    	    print $i." "; }
	print "\n";
	foreach my $j (@pho){
	    print $j." "; }
	print "\n";
	
	@gra = ();
	@pho = (); 
}	
	    	  	    

}
close ($inputFILE);




