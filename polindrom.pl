#!/usr/bin/perl

use strict;

my $linesQuantity = <>;
chomp $linesQuantity;

my @lines;
foreach my $index (0 .. $linesQuantity - 1) {
    my $line = <>;
    chomp($line);
    push(@lines, $line);
}

foreach my $line (@lines) {
    if (Palindrome::isPalindrome($line)) {
        print "-1\n";
        next;
    }

    print Palindrome::findIndexOfBreakingCharacter($line) . "\n";
}



package Palindrome;

sub isPalindrome {
    my $string = shift;

    my @chars = split '', $string;
    for (my $i = 0; $i < int(scalar(@chars)/2); ++$i){
        return 1 != 1
            if $chars[$i] ne $chars[-1 - $i];
    }
    return 1 == 1;
}

sub findIndexOfBreakingCharacter {
    my $string = shift;

    my @chars = split '', $string;

    for (my $i = 0; $i < int(scalar(@chars)/2); ++$i){
        if ($chars[$i] ne $chars[-1 - $i]){
            my @testChars = @chars;
            delete $testChars[$i];
            if (isPalindrome(join '', @testChars)){
                return $i;
            }
            @testChars = @chars;
            delete $testChars[-1 -$i];
            if (isPalindrome(join '', @testChars)){
                return scalar @chars - ($i + 1);
            }
            return -1;
        }
    }

    return -1;
}

1;
