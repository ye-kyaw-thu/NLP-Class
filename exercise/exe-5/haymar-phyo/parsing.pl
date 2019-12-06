#!/usr/bin/perl

use strict;
use warnings;
use utf8;

binmode(STDIN, ":utf8");
binmode(STDOUT, ":utf8");
binmode(STDERR, ":utf8");



my %dict = (
       "သုံး" => "use",
       "ပြ" => "print",
       "ဖိုင်ဖွင့်" => "open",
       "သို့မဟုတ်" => "or",
       "နဲ့" => "&",
       "အကယ်၍"=> "if",
       "ပရိုဂရမ်မှထွက်" => "die",
       "ဖိုင်အဆုံး" => "eof",
       "မညီ" => "ne",
       "ဖိုင်ပိတ်" => "close",

    );

my $inputFILE;
my $line;
my $FH;

my $filename = '1.pl';
open($FH, ">:encoding(utf8)", $filename) or die "Could not open file '$filename' $!";

open ($inputFILE,"<:encoding(utf8)", $ARGV[0]) or die "Couldn't open input file $ARGV[0]!, $!\n";

while (!eof($inputFILE)) {
     
    $line = <$inputFILE>;
    if ($line !~  /^\s*$/) {
        while(my ($find, $replace) = each %dict) {
             $line =~ s/$find /$replace /g;}
	print $FH $line;
}
}
close ($inputFILE);
close ($FH);

open my $PERLFILE, "<1.pl";
undef $/;   # to slurp the file, ignoring newlines
my $program = <$PERLFILE>;
eval $program;
