#!/usr/bin/env perl

use strict;
use warnings;

use List::Util qw/ sum zip /;

local $\ = "\n";
local $, = "\t";

my (@A, @B);

while (<>) {
    my ($a, $b) = split;
    push @A, $a;
    push @B, $b;
}

@A = sort @A;
@B = sort @B;

print sum map { abs($_->[0] - $_->[1]) } zip \@A, \@B;
