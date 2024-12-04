#!/usr/bin/env perl

use strict;
use warnings;

local $, = "\t";
local $\ = "\n";

my $sum = 0;
my $do  = 1;

while (<>) {
    while (m/(do\(\)|don't\(\)|mul\((\d+),(\d+)\))/g) {
        if    ($1 eq "do()")    { $do = 1}
        elsif ($1 eq "don't()") { $do = 0 }
        elsif ($do == 1) {
            print $1;
            $sum += $2*$3;
        }
    }
}

print $sum;
