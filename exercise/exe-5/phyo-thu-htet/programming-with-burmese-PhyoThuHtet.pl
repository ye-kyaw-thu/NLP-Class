#!usr/bin/perl
# Burmese Programming Language
# Ok for cases like string declaration and print statement
# Still Need to consider for other case like and binmode, multiline
# Usage: perl programming-with-burmese-PhyoThuHtet.pl programming-with-burmese-PhyoThuHtet.input 

# Phyo Thu Htet, Information Science Student, UTYCC
# @SoftwareLab, UTYCC
# 7 Sep 2019, Last Modified : 5 Dec 2019 (Thu)

use strict;
use warnings;
use utf8;
use Cwd qw();



binmode(STDIN,":utf8");
binmode(STDOUT,":utf8");
binmode(STDERR,":utf8");

#The dict file is prepared by May Zin Htun, Master Student, UTYCC
my %parser_dict = ("ပြပါ" => 'print' ,"သိမ်းစရာ" => '$',"ကိုယ်ပိုင်" => 'my',"သုံးသည်"=>'use', "တင်းကျပ်"=>'strict',"အမှားပြ"=>'warnings',"ယူနီကုဒ်"=>'utf8', "အဘိဓါန်" => '%',  
"အသုံးပြုသူ"=>'usr',"ဘင်"=>'bin',"ပါး"=>'perl',"ဘိုင်နရီမုတ်"=>'binmode',"စံအဝင်"=>'STDIN',"စံအထွက်"=>'STDOUT',"စံအမှား"=>'STDERR',"ဖြစ်လျှင်"=>'if',
"သို့မဟုတ်"=>'elsif',"အခြား"=>'else',"၀"=>'0',"၁"=>'1',"၂"=>'2',"၃"=>'3',"၄"=>'4',"၅"=>'5',"၆"=>'6',"၇"=>'7',"၈"=>'8',"၉"=>'9');


open (my $inputFILE,"<:encoding(utf8)", $ARGV[0]) or die "Couldn't open input file $ARGV[0]!, $!\n";
open(my $fh, '>:encoding(UTF-8)', 'output.pl');

while (!eof($inputFILE)) {
    my $line = <$inputFILE>;

    if ($line =~ m/(".*")/){
    
    my $string = $1; # graping string in double code

    my @string_array = split('',$string);# use array to get length 

    my $preceeding_string = substr($line,0,length($`));# grep before string in double code

    
    my $l = length($preceeding_string)+ scalar @string_array; #legth
    
    # grep after string in double code
    my $followed_string = substr($line,$l); 
    #print "followed_string1: $followed_string\n";
    
     while ( my($find, $replace) = each %parser_dict){
        $preceeding_string =~ s/($find)/$replace/g;
        $followed_string   =~ s/($find)/$replace/g;
        } 
    
    # combinging the whole line
    my $whole_line_converted = $preceeding_string.$string.$followed_string;
    print $fh $whole_line_converted;


    }
    else{
         while ( my($find, $replace) = each %parser_dict){
        $line =~ s/($find)/$replace/g;
        } 
    
         print $fh $line;
    }

    
    
}


# my $path = Cwd::cwd();
# print "$path\n";

close $fh;
close $inputFILE;

