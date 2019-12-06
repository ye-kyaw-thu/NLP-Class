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

my %dict = (
                        "က"	=> "⡁",
                        "ခ" 	=> "⢈",
                        "ဂ"	=> "⠛",
                        "ဃ"	=> "⠟",
                        "င"	=> "⡈",
                        "စ"	=> "⡌",
                        "ဆ"    => "⡤",
                        "ဇ"	=> "⠵",
                        "ဈ"	=> "⣌",
                        "ည"    => "⠷",
                        "ဋ"	=> "⠳",
                        "ဌ"     => "⠻",
                        "ဍ"	=> "⠾",
                        "ဎ"     => "⠿",
                        "ဏ"	=> "⡬",
                        "တ"    => "⠞",
                        "ထ"    => "⠚",
                        "ဒ"	=> "⠙",
                        "ဓ"     => "⠋",
                        "န"     => "⠝",
                        "ပ"	=> "⡖",
			"ဖ"	=> "⠰",
			"ဗ"	=> "⢉",
			"ဘ"	=> "⠃",
			"မ"	=> "⡉",
			"ယ"	=> "⠽",
			"ရ"	=> "⠗",
			"လ"	=> "⠇",
			"ဝ"	=> "⠺",
			"သ"	=> "⠹",
			"ဟ"	=> "⠓",
			"ဠ"	=> "⠸",
			"အ"	=> "⠣",
			"ဉ"	=> "⠧",
                        "ဤ"    => "⠰⠪",
			"၍"	=> "⠯",
			"၏"	=> "⠕",
			"၌"	=> "⠦",
			"၎င်း"	=> "⠬",
			"၊"	=> "?",
			"။"	=> "?",
                        "ာ"	=> "⠁", 
                        "ါ"	=> "⠎", 
                        "ိ"	=> "⠊", 
                        "ီ"	=> "⠪", 
                        "ု"	=> "⠑", 
                        "ူ"	=> "⠥", 
                        "ေ"	=> "⠱", 
                        "ဲ"	=> "⠡", 
                        "ံ"     => "⠉", 
                        "င်္" 	=> "⡈⠄⠤", 
                        "ျ"	=> "⠔", 
                        "ဥ"     => "⠰⠑ ",
		        "ဦး"     => "⠰⠑⠪⠆", 
          	        "ဧ"     => "⠰⠱",
		        "ဣ"    => "⠰⠊", 
                        "ြ"	=> "⠢", 
                        "်"	=> "⠄", 
                        "ွ" 	=> "⠜", 
                        "ှ" 	=> "⠭", 
                        "့" 	=> "⠂",
                        "္"     => "⠤",
                        "း"    => "⠆",  
                
                        );



open (my $inputFILE,"<:encoding(utf8)", $ARGV[0]) or die "Couldn't open input file $ARGV[0]!, $!\n";

while (!eof($inputFILE)) {
     
    my $line = <$inputFILE>;
    if (($line ne '') & ($line !~ /^ *$/)) {
        chomp($line);

        $line =~ s/^\s+|\s+$//g; #remove spaces at the start and end of sentences
        $line =~ s/ +/ /g;  #remove multiple spaces between words
	$line =~ s/ //g;

	print "$line\n";

	$line=~s/([က-ဟ]|[က-ဟ][ျ|ြ|ှ])([က-ဟ]|[\s]|[က-ဟ][်]|[ါ-ဲ|ွ|ံ])/$1အ$2/g;
	$line=~s/([က-ဟ])([ါ-ဲ|ွ|ံ])/$1အ$2/g;
	print "$line\n";

	$line =~ s/((?<!$subscript)[$consonant](?![$aThat$subscript])|[$enChar$otherChar])/ $1/g;
	$line =~ s/^\s+//g;
	print "$line\n";

        while(my ($find, $replace) = each %dict) {
            $line =~ s/$find/$replace/g; }

        print "$line\n\n";
	
}

close ($inputFILE);
}





