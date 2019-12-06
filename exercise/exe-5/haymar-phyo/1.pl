#!/usr/bin/perl
#fortestAssign5;
use strict;
use warnings;
use utf8;
binmode(STDIN, ":utf8");
binmode(STDOUT, ":utf8");
binmode(STDERR, ":utf8");
open (my $inputFILE,"<:encoding(utf8)", "10-lines.txt") or die  "Couldn't open input file 10-lines.txt!, $!\n";
while (!eof ($inputFILE)) {
    my $line = <$inputFILE>;
     if (($line ne '') & ($line !~ /^ *$/)) {
	chomp ($line);
        $line =~ s/^\s+|\s+$//g; #remove spaces at the start and end of sentences
        $line =~ s/ +/ /g;  #remove multiple spaces between words
	$line =~ s/ //g;
	print "$line\n";
	$line=~s/([က-ဟ]|[က-ဟ][ျ|ြ|ှ])([က-ဟ]|[\s]|[က-ဟ][်]|[ါ-ဲ|ွ|ံ])/$1အ$2/g;
	$line=~s/([က-ဟ])([ါ-ဲ|ွ|ံ])/$1အ$2/g;
	print "$line\n";
}
}
close ($inputFILE);
