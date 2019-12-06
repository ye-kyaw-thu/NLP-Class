#!usr/bin/perl
# Convert the Myanmar Words to Braille (Mu Haung)
# Change to Mu Haung Style to Original(in other way Mu Thit) Style
# Mu Haung - the very first style of writing burmese braille 
# Mu Thit - the new approach for writing burmese braille 
# Usage: perl burmese2braille-converter-PhyoThuHtet.pl burmese2braille-converter-PhyoThuHtet.input

# Phyo Thu Htet, Information Science Student, UTYCC
# @SoftwareLab, UTYCC
# 7 Sep 2019, Last Modified : 4 Dec 2019 (Wed) 


use strict;
use warnings;
use utf8;

binmode(STDIN, ":utf8");
binmode(STDOUT, ":utf8");
binmode(STDERR, ":utf8");

# Burmese => Braille Dictionary
# The data for this dicitonary is prepared by Phyo Thu Htet, Naing Linn Phyo and Thiha Nyein
my %braille_dict_mm = (
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
                        "?"	=> "⠴",
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

# Read a file
open (my $inputFILE,"<:encoding(utf8)", $ARGV[0]) or die "Couldn't open input file $ARGV[0]!, $!\n";

while (!eof($inputFILE)) {

    my $input_file = <$inputFILE>;
    chomp($input_file);
    print "Input: $input_file\n";

    # Change to Mu Haung Style
    $input_file =~ s/([က-အ])([ါ-ူ]|[က-အ]်)/$1အ$2/g;
    $input_file =~ s/([က-အ]([ျ-ှ]){1,})/$1အ/g;
    print "Mu Haung : $input_file\n";

    # Back to normal
    $input_file =~  s/([က-အ][ျ-ှ]{1,})အ/$1/g;
    $input_file =~  s/([က-အ])အ([ါ-ူ]|[က-အ]်)/$1$2/g;
    print "Back to Normal : $input_file\n";
    
    # Switch to braille (Mu Thit)
    while( my($find, $replace) = each %braille_dict_mm){
        $input_file =~ s/($find)/$replace/g;
    }
    print "Braille:$input_file\n\n";

}
close ($inputFILE);

