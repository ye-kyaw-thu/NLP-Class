#!/usr/bin/perl
use strict;
use warnings;
use utf8;

# Written by Hlaing Myat Nwe
# Date: 5 Oct 2019

binmode(STDIN, ":utf8");
binmode(STDOUT, ":utf8");
binmode(STDERR, ":utf8");


open (my $inputFILE,"<:encoding(utf8)", $ARGV[0]) or die "Couldn't open input file $ARGV[0]!, $!\n";
my $line_no=0;
while (!eof($inputFILE)) {
    

    my $line = <$inputFILE>;
    if (($line ne '') & ($line !~ /^ *$/)) {
        chomp($line);
     $line_no=$line_no+1;
     print "$line (hmn_$line_no)\n";
        
    }

}

close ($inputFILE);

