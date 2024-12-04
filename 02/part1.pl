#!/usr/bin/env perl

use strict;
use warnings;

local $, = "\t";
local $\ = "\n";

my $safe = 0;

sub test_report (\@) {
    my ($levels) = @_;
    
    my $a = $levels->[0];
    my $direction = $a <=> $levels->[1];
    return 0 if ($direction == 0);

    my $s = 1;

    for (my $i = 1; $i < @$levels; $i++) {
        my $b = $levels->[$i];
        unless(test_pair($direction, $a, $b)) {
            $s = 0;
            last;
        }
        $a = $b;
    }

    return $s;
}

sub test_pair ($$$) {
    my ($direction, $a, $b) = @_;
    my $d = $a <=> $b;
    return (($d == $direction) && (abs($a - $b) <= 3));
}

while (<>) {
    my @levels = split;
    my $s = test_report(@levels);
    $safe += $s;
    print $s ? "Safe" : "Unsafe";
}

print $safe;
