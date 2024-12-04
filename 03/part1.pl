#!/usr/bin/env perl

use strict;
use warnings;

local $, = "\t";
local $\ = "\n";

my $sum = 0;

while (<>) {
    while (m/mul\((\d+),(\d+)\)/g) {
        print $&;
        $sum += $1*$2;
    }
}

print $sum;
