#!/usr/bin/env perl

use strict;
use warnings;

use List::Util qw/ sum zip /;

local $\ = "\n";
local $, = "\t";

my (%A, %B);

while (<>) {
    my ($a, $b) = split;
    $A{$a}++;
    $B{$b}++;
}

print sum map { $B{$_} ? $_*$A{$_}*$B{$_} : 0 } keys %A;
