#!/usr/bin/env perl

# checking how many times found the correct pairs
# Ye Kyaw Thu, Language Understanding Lab., Pyin Oo Lwin, Myanmar
#
# Preparing for string similarity paper
# e.g. $ perl chk-found.pl <confusion-pair-filename> <exp-result-file>

use strict;
use warnings;
use utf8;
use experimental 'smartmatch';


binmode(STDIN, ":utf8");
binmode(STDOUT, ":utf8");
binmode(STDERR, ":utf8");

open (my $confusionFILE,"<:encoding(utf8)", $ARGV[0]) or die "Couldn't open input file $ARGV[0]!, $!\n";

my @cfLines = <$confusionFILE>;
close ($confusionFILE);

chomp @cfLines;

open (my $resultFILE,"<:encoding(utf8)", $ARGV[1]) or die "Couldn't open input file $ARGV[1]!, $!\n";

while (!eof($resultFILE)) {
    #my $count = 0; 
    my $line = <$resultFILE>;
    if (($line ne '') & ($line !~ /^ *$/)) {
        chomp($line);
        my ($w, $c) = split ("\t", $line);
        
        #clean ', [, ] from $c
        $c =~ s/['\[\]]//g;
        #print "$w\t$c\n";         
        my @cArray = split(",", $c);
        
        foreach(@cArray) {
         my $chkPair = $w."\t".$_;
        if ($chkPair ~~ @cfLines) {
         print "Found!", $chkPair,"\n";
            
         }
           
        }
        
    }

}

close ($resultFILE);

