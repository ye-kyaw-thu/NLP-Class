use strict;
use warnings;
use utf8;

# for printing code points (decimal, unicode) of each Myanmar character and counting total no. of characters
# written by Ye Kyaw Thu, Visiting Professor,
# Language Semantic Technology Research Team (LST), NECTEC, Thailand
# how to run: perl ./print-codepoint.pl <filename>
# e.g. perl ./print-codepoint.pl ./pair.txt

binmode STDIN, ":encoding(UTF-8)";
binmode STDOUT, ":encoding(UTF-8)";

open(my $fh, '<:encoding(UTF-8)', "$ARGV[0]");

while( my $line = <$fh>)  {

   print $line;
   chomp($line);

   my $stringLength = length($line);
   for (my $i = 0; $i < $stringLength; $i++){
  
      # one character by one character
      my $oneChar = substr($line, $i, 1);

      my $charNo = ord($oneChar);
      print "$oneChar ($charNo, ";
      printf "U%2.2x) ", unpack('U0U*', $oneChar);
    }
     print ", no. of char = $stringLength\n";
}
