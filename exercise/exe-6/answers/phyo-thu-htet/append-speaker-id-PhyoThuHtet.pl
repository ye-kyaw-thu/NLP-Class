#!usr/bin/perl
# append id at the end of the line
# Usage: perl append-id-PhyoThuHtet.pl bk.input
# Usage: perl append-id-PhyoThuHtet.pl burmese.input

# Phyo Thu Htet, Information Science Student, UTYCC
# @SoftwareLab, UTYCC
# 7 Sep 2019, Last Modified : 1 Nov 2019
use strict;
use warnings;
use utf8;

binmode(STDIN,":utf8");
binmode(STDOUT,":utf8");
binmode(STDERR,":utf8");


open(my $inputFILE,"<:encoding(utf8)",$ARGV[0]) or die "Couldn't open the file $ARGV[0]";
my $line_no = 0;

while(!eof($inputFILE)){


    my $line = <$inputFILE>;
    if (($line ne '') & ($line !~ /^ *$/)){
        chomp($line);
        $line =~ s/\s+$//g; # this section is important ( I found there are white space characters at the end of the line)
        # Python Code to check this case
        # with open(input_file) as file:
        #   for i in file:
        #      for ii in i:
        #          print (ii)
        $line_no = $line_no+1;
        print "$line (phyo_$line_no)\n";
    }
}
close ($inputFILE);
