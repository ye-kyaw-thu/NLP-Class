#!/usr/bin/perl

use strict;
use warnings;
use utf8;

binmode(STDIN, ":utf8");
binmode(STDOUT, ":utf8");
binmode(STDERR, ":utf8");

my $consonant= "က-အ";
my $subscript="္";
my $aThat="်";
my $otherChar = "ဣဤဥဦဧဩဪဿ၌၍၏၀-၉၊။!-\/:-\@\[-`{-~\\s";

my $small ="a-z";
my $capital = "A-Z";

open (my $inputFILE,"<:encoding(utf8)", $ARGV[0]) or die "Couldn't open input file $ARGV[0]!, $!\n";

while (!eof($inputFILE)) {
     
    my $line = <$inputFILE>;
    if (($line ne '') & ($line !~ /^ *$/)) {
        #chomp($line);
	
	$line = uc $line;
	$line =~ s/((?<!$subscript)[$consonant](?![$aThat$subscript])|[$otherChar])/ $1/g;
	$line =~ s/( )( )( )/ /g;
	print $line;
	    	  	    
}
}
close ($inputFILE);


