use strict;
use warnings;
use utf8;

binmode STDIN, ":encoding(UTF-8)";
binmode STDOUT, ":encoding(UTF-8)";
binmode STDERR, ":encoding(UTF-8)";

# Written by Ye Kyaw Thu, LST, NECTEC, Thailand
# for NLP Class, UTYCC, Last Updated: 5 Dec 2019
#
#How to run: perl ./mk-ed-operation.pl ./myanmar.syms 
# cat ./myamar.syms | perl ./mk-ed-operation.pl

#my $myChar = "က-အဣဤဥဦဧဩဪဿ၌၍၏၀-၉၊။";

my $delWeight = "1.00";
my $insertWeight = "1.00";
my $substituteWeight = "1.00";
my $noEditWeight = "0.00";
my $epsilon = "ε";
my @myChar;

# this line required for reading UTF8 Myanmar characters from STDIN
eof() ? exit : binmode ARGV, ':utf8';

while (my $line = <>) {
   chomp($line); # remove \n
   push (@myChar, $line);
}

my $oneChar;

foreach $oneChar (@myChar)
{

   # No edit operation
   print ("0\t0\t$oneChar\t$oneChar\t$noEditWeight\n");

   # Delete operation
   print ("0\t0\t$oneChar\t$epsilon\t$delWeight\n");

   # Insert operation
   print ("0\t0\t$epsilon\t$oneChar\t$insertWeight\n");

   # Substitute operation
   my $subChar;
   foreach $subChar (@myChar)
   {
      # Substitute operation
      if ($subChar ne $oneChar) 
      {
          print ("0\t0\t$oneChar\t$subChar\t$substituteWeight\n");
      }
   }
}
print ("0\n");
