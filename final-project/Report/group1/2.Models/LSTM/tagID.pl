#!/usr/bin/perl

use strict;
use warnings;
use utf8;

binmode(STDIN, ":utf8");
binmode(STDOUT, ":utf8");
binmode(STDERR, ":utf8");

my $lineNum=0;

open (my $inputFILE,"<:encoding(utf8)", $ARGV[0]) or die "Couldn't open input file $ARGV[0]!, $!\n";

while (!eof($inputFILE)) {
     
    my $line = <$inputFILE>;
    if (($line ne '') & ($line !~ /^ *$/)) {
        chomp($line);
        $line =~ s/^\s+|\s+$//g; #remove spaces at the start and end of sentences
        $line =~ s/ +/ /g;  #remove multiple spaces between words
        $lineNum=$lineNum+1;
        print "$line (tn_$lineNum)\n";
  }
}
close ($inputFILE);

