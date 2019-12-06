#!usr/bin/perl
# Spelling Checker for Myanmar 
# With Vowel Mapping and Jaccard Similarity (Ref: Khaing Hsu Wai)
# Usage: perl spelling-checker-vowelmapping-jaccardsimilarity.pl spelling-checker-vowelmapping-levenshtein.input spelling-checker-vowelmapping-levenshtein.dict

# Phyo Thu Htet, Information Science Student, UTYCC
# @SoftwareLab, UTYCC
# 24 Oct 2019, Last Modified : 29 Oct 2019

use List::MoreUtils qw(uniq);
use List::Util qw( min max );
use List::Util qw/shuffle/;


#word in dictionary
sub intersection{
    @input_array = @{$_[0]};
    @dict_array  = @{$_[1]};
    
    @word_in_dict = grep { defined } 
                               @{ { map { lc ,=> $_ } @dict_array} } { map { lc } @input_array}; 

    #print "I am sub intersection\n";
    #print "InputArray: @input_array\n";
    #print "DictArray: @dict_array\n"; 
    #print "word_in_dict : @word_in_dict\n";

    return uniq @word_in_dict;
    }
# calculate the jacard similarity
sub jaccard_similarity{
    # getting the input string and dictionary string
    ($input, $dict) = @_;

    # changing the vowel mapped words into array
    @input_array = split(//, $input);
    @dict_array = split(//, $dict);

    #print "I am Jaccard_Sim Sub \n" ;
    #print "InputArray: @input_array\n";
    #print "DictArray: @dict_array\n";

    $AnB = scalar (intersection(\@input_array,\@dict_array));
    $AuB = (scalar uniq @input_array ) + (scalar uniq @dict_array) - (scalar $AnB);
    $Aub_minus_AnB = $AuB-$AnB;

    if ($Aub_minus_AnB == 0){
        #print "Divided by zero\n";
        return -1;
        }
   
    $jaccard = $AnB / $Aub_minus_AnB ;
    #print "Jaccard Score: $jaccard\n";
    return $jaccard;
        
    }

use warnings;
use strict;
use utf8;
binmode(STDIN, ":utf8");
binmode(STDOUT, ":utf8");
binmode(STDERR, ":utf8");

open (my $inputFILE, "<:encoding(utf8)", $ARGV[0]) or die "Couldn't open input file $ARGV[0]!, $!\n";
open (my $dictFILE,"<:encoding(utf8)", $ARGV[1]) or die "Couldn't open dict file $ARGV[1]!, $1\n";

# reading the whole dictionary file
my @dictionary = <$dictFILE>;
chomp(@dictionary);
my $dictionary_4_vowel_map = join ' ' , @dictionary;
#print "DictionaryString: $dictionary_4_vowel_map\n";

=for comment 
my @a = ("a","b","c");
intersection($a,\@a);

my $j = "ab";
my $j2 = "abc";
jaccard_similarity($j,$j);
# printing the words in dictionary
foreach my $d(@dictionary){
    #print "DictionaryWord: $d \n";
    }
=cut

# vowel mapping
# References: Khaing Hsu Wai, String Similarity Measures for Burmese (Myanmar Language) ICNLSP 2019
my %vowel_map= ("​​ေ" => "l", "[ျ|ြ]" => "y", "[ိ|ီ|ဲ|ံ]"=> "u", 
                "်" => "k", "[ဣဤဥဦဧဩဪဿ၌၍၏]" => "i", "[က-အ]" => "c", 
                "္" => "p", "[ာ|ါ|့|း]" => "r", "[ွ|ှ|ု|ူ]" => "d", "[၊|။]" => "s",);
    
 while ( my($find, $replace) = each %vowel_map)
         {
            $dictionary_4_vowel_map =~ s/($find)/$replace/g;
        }
#print "DforvowelMap$dictionary_4_vowel_map\n";
my @dictionary_vowel_mapped = split(/ /,$dictionary_4_vowel_map);
# reading the input file line by line
while (!eof($inputFILE)){

    my $input = <$inputFILE>;
    my $word = $input;
    chomp ($word);
    #print "$input";
    #print "InputLine: $input";
    chomp ($input);
    my @input = ($input);
    #print "\@input @input\n";
    my @match = intersection(\@input,\@dictionary);
    #print "Match @match\n";
    if (!@match) {
         my @jac = ();
         while ( my($find, $replace) = each %vowel_map){
            $input =~ s/($find)/$replace/g;
             }
         foreach my $d(@dictionary_vowel_mapped){
             push(@jac,jaccard_similarity($input,$d));
             }
          #print "Jac @jac\n";
          my $maxValue = max @jac;
          #print "Max $maxValue\n";
          my @index = grep $jac[$_] eq $maxValue , 0.. $#jac;
          my @value = ();
          foreach my $r(@index){
           push(@value,$dictionary[$r]." ");
           }
          #print "Index @index \n";
          if ((scalar @value) >3){
              @value = shuffle(@value);   
              print "$word => $value[0] $value[1] $value[2]\n";
              }
          else{
   
              print "$word=> @value \n";
              


              }
        }
    else {
        print "$word => Word In Dictionary";
        }
    
    
    
    }
