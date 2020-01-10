#!/usr/bin/env perl

# 
# Ye Kyaw Thu, LST Lab., NECTEC, Thailand
#
# How to use:
# e.g. $ perl .pl <input-file>

use strict;
use warnings;
use utf8;

binmode(STDIN, ":utf8");
binmode(STDOUT, ":utf8");
binmode(STDERR, ":utf8");

open (my $inputFILE,"<:encoding(utf8)", $ARGV[0]) or die "Couldn't open input file $ARGV[0]!, $!\n";

my $count=0;
while (!eof($inputFILE)) {
     
    my $line = <$inputFILE>;
    chomp($line);
   if ($line !~ /^ $/) {
          print "$count\t",$count+1,"\t$line\n";
   }else {
         print "$count\t",$count+1,"\t\\s\n";
   }
$count++;
}
# if you don't print this line, you have to face infinity problem!
print "$count\n";

close ($inputFILE);
