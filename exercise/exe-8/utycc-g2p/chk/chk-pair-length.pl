#!/usr/bin/perl
use strict;
#use warnings;
no warnings qw ( uninitialized );
binmode STDIN, ":utf8";
binmode STDOUT, ":utf8";

# last updated: 26 Oct 2016
# written by Ye Kyaw Thu
# change line to column format

open (inputFILE,"<:encoding(utf8)", $ARGV[0]) or die "Couldn't open input file $ARGV[0]!, $!\n";

my $line;
my $count = 1;
while ($line = <inputFILE>)
{
   chomp($line);
   my $gra =""; my $pho = "";
   ($gra, $pho) = split("\t", $line);
    
    my $graLength = 0; 
    ++$graLength while $gra =~ /\S+/g;
 
    my $phoLength = 0; 
    ++$phoLength while $pho =~ /\S+/g;

    if ($graLength != $phoLength) {
        print "Line no: $count, $gra: $graLength, $pho: $phoLength\n";
    }
    $count = $count + 1;
}

close (inputFILE);
