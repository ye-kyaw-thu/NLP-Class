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
my $enChar = "a-zA-Z0-9";
my $otherChar = "ဣဤဥဦဧဩဪဿ၌၍၏၀-၉၊။!-\/:-\@\[-`{-~\\s";

open (my $inputFILE,"<:encoding(utf8)", $ARGV[0]) or die "Couldn't open input file $ARGV[0]!, $!\n";

while (!eof($inputFILE)) {
     
    my $line = <$inputFILE>;
    if (($line ne '') & ($line !~ /^ *$/)) {
        chomp($line);

	my @word = split (/ /,$line);
	foreach my $i (@word){

	    $i =~ s/((?<!$subscript)[$consonant](?![$aThat$subscript])|[$enChar$otherChar])/ $1/g;
	    $i =~ s/^\s+//g;
	    my $a=$i."\n";

	    #2-tag
	  
            #$a =~ s/(.)$/$1\t|\tEnd/g;
            #$a =~ s/(.)( )/$1\t-\tOther\n/g;

	    #3-tag
            #$a =~ s/(.)$/$1\t|\tEnd/g;
	    #$a =~ s/^([\w])( )/$1\t<\tStart\n/g;
	    #$a =~ s/(.)( )/$1\t-\tOther\n/g;

	    #4-tag
	    #$a =~ s/(.)$/$1\t|\tEnd/g;
	    #$a =~ s/^([\w])( )/$1\t<\tStart\n/g;
  	    #$a =~ s/(.)( )(.)[\t]/$1\t>\tSecond-Last\n$3\t/g;
	    #$a =~ s/(.)( )/$1\t-\tOther\n/g;
	    #print "$a";
	   
	    #5-tag
	    $a =~ s/^([\w]+)([\s])([\w]+)$/$1\t+\tSepcial\n$3/g; 
	    $a =~ s/(.)$/$1\t|\tEnd/g;
	    $a =~ s/^([\w])( )/$1\t<\tStart\n/g;  
  	    $a =~ s/(.)( )(.)[\t]/$1\t>\tSecond-Last\n$3\t/g;
	    $a =~ s/(.)( )/$1\t-\tOther\n/g;
	    print "$a";	    	   
}	    
print ("\n");	    
}
}
close ($inputFILE);


