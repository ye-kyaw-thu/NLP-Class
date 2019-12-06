#!/usr/bin/perl

use strict;
use warnings;
use utf8;

binmode(STDIN, ":utf8");
binmode(STDOUT, ":utf8");
binmode(STDERR, ":utf8");

my $con = "a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z";
#$con =~ s/( )( )/ /g;


print ("-\t0\n");
my @arr = split (/ /,$con);
for my $i (0..$#arr) {
    print $arr[$i]."\t";
    print $i+1;
    print "\n";
    }



