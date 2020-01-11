#!/usr/bin/perl
# cleaning heading spaces, training spaces, double spaces and blank lines
# Ye Kyaw Thu, LST, NECTEC, Thailand
#
# Preparation for ASR Project of NLP Class, 2019, @UTYCC
# e.g. $ perl edit-and-print.pl <input-file> <start-line-no> <no-of-sentences>
# How to run: perl ./edit-and-print.pl ./my.sort 1 5 > out

use strict;
use warnings;
use utf8;

binmode(STDIN, ":utf8");
binmode(STDOUT, ":utf8");
binmode(STDERR, ":utf8");

# use ARGV to verify the number of perl command line arguments
if (@ARGV != 3) { die "Usage: print-specific-line.pl first-line last-line input-file\n";}

my $first_line  = $ARGV[1];
my $last_line = $ARGV[2];

# open the file (or die trying)
open (my $inputFILE,"<:encoding(utf8)", $ARGV[0]) or die "Couldn't open input file $ARGV[0]!, $!\n";

# loop through the file; start printing when you get to the first_line; exit the
# program when you get to last_line.
my $count = 1; my $lineNo = 1; my $endLineNo = 0;
while (!eof($inputFILE))
{
    my $line = <$inputFILE>;
    if (($line ne '') & ($line !~ /^ *$/)) 
    {
        chomp($line);
        # exit the program when you get to the last line
        if ($count > $last_line)
        {
            $count=1;
            print("\\end{itemize}\n");
            print("\\end{frame}\n");
          }

          # print the current line if the line number is greater than our first param
          if ($count == $first_line)
          {
                $endLineNo = $lineNo + 4;
                print("\%------------------------------------------------\n");

                print("\\begin{frame}\n");
                print("\\frametitle{Sentence No. $lineNo-$endLineNo}\n");
                print("\\begin{itemize}\n");

                print ("\\item {\\padauktext {\\Large $line}}\n");
          }elsif ($count > $first_line)
          {
                print ("\\item {\\padauktext {\\Large $line}}\n");
            }

          # increment the line counter
          $count++; $lineNo++;
    }
}

# come here if last-line is greater than the number of lines in the file.
# print an error message here if you prefer.
close $inputFILE;
