#!/usr/bin/perl

use strict;
use warnings;
use utf8;

binmode(STDIN, ":utf8");
binmode(STDOUT, ":utf8");
binmode(STDERR, ":utf8");

my $cap = "A B C D E F G H I J K L M N O P Q R S T U V W X Y Z";
my $sm = "a b c d e f g h i j k l m n o p q r s t u v w x y z";

my @arr = split (/ /,$cap);
my @ar = split (/ /,$sm);

for my $i (0..$#arr) {
    print "0\t0\t";
    print $ar[$i]."\t";
    print $arr[$i]."\n";
 
    }

for my $i (0..$#arr) {
    print "0\t0\t";
    print $arr[$i]."\t";
    print $ar[$i]."\n";
 
    }
print ("0");





