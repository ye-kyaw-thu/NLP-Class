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

use Text::Levenshtein qw(distance);
use List::Util qw[min max];

sub sylbreak {

	my $line = $_[0];
	$line =~ s/ /\n/g;
	$line =~ s/((?<!$subscript)[$consonant](?![$aThat$subscript])|[$enChar$otherChar])/ $1/g;
	return ($line); 
}

my @dict;
open (my $dictFILE,"<:encoding(utf8)", "dictionary.txt") or die "Couldn't open dictioinary.txt !, $!\n";

while (!eof($dictFILE)) {

    my $line = <$dictFILE>;
    push @dict, $line;
}
close($dictFILE);

#print @dict;

sub sylcheck{

    my @ar1;
    my @ar2;

    my $max_length;
    my $min_length;

    my ($str1, $str2) = @_;
    @ar1 = split( / /, $str1);
    @ar2 = split( / /, $str2);

    my $len1 = @ar1;
    my $len2 = @ar2;

    if ($len1 > $len2) {
	$max_length = $len1; 
	$min_length = $len2; }
    else {
	$min_length = $len1;
	$max_length = $len2; }

    my @new_list1;
    my @new_list2;

    foreach my $i (0..$max_length-1){
    	if($i < $min_length){
       	    if ($ar1[$i] eq $ar2[$i]){
		push @new_list1,'1';
		push @new_list2,'1'; }
  
            else {
                push @new_list1,'0';
                push @new_list2,'1'; }
	}
        else{
            push @new_list1,'0';
            push @new_list2,'1';}
	}

    #convertion list into string
    my $arr1 = join '', @new_list1;
    my $arr2 = join '', @new_list2;
    
    return ($arr1, $arr2);
}


open (my $inputFILE,"<:encoding(utf8)", $ARGV[0]) or die "Couldn't open input file $ARGV[0]!, $!\n";
my $linenumber=1;
my $line;
while (!eof($inputFILE)) {

   #chomp($line);
   my $line = <$inputFILE>;

   $line = sylbreak($line);
   $line =~ s/^\s+//g;
   my @words = split("\n", $line);

   #print @words;
   #print "\n";
   
   foreach my $word (@words)
   {
	print "word:";
	print "$word";
	print "\n";

	$word=~ s/^\s+//g;
	my $first = substr ($word,0,1);
	
	if (grep {$_ ne $word} @dict){
	    my %distances;
            my $word_len = length $word;
	    
	    foreach my $dictWords(@dict){
		print "dictword:";
		print "$dictWords";
		print "\n";

		my $firstChar = substr($dictWords,0,1);
		my $this_len = length $dictWords;
	    
		my $diff = $word_len - $this_len;
	
		if ($first eq $firstChar && abs($diff) <= 1){

		    print sylcheck($word,$dictWords);
		    print "\n";

		    my $output=distance(sylcheck($word, $dictWords));
		    print "distance:";
		    print "$output";
		    print "\n\n";
		    $distances{$dictWords} = $output;
   		}}

	my $smallest = min values %distances;
	my (@key) = grep{$distances{$_} eq $smallest} keys %distances;
	print "At Line-number:$linenumber\t$word\t@key\n";
 	}
    }
    $linenumber++;
            
}close($inputFILE);
	


