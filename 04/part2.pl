#!/usr/bin/env perl

use strict;
use warnings;

use Data::Dumper;

local $, = "\t";
local $\ = "\n";

# read the grid
my @grid;
while (<>) {
    chomp;
    push @grid, [ split // ];
}

my $X = scalar @grid;
my $Y = scalar @{$grid[0]};

print $X, $Y;

$X--;
$Y--;

# test for m and s

sub test_ms ($$) {
    (($_[0] eq "M") && ($_[1] eq "S")) ||
    (($_[1] eq "M") && ($_[0] eq "S"));
}

my $count = 0;

for (my $x = 1; $x < $X; $x++) {
    for (my $y = 1; $y < $Y; $y++) {
        if ($grid[$x][$y] eq "A") {
            $count += test_ms($grid[$x-1][$y-1], $grid[$x+1][$y+1]) &&
                        test_ms($grid[$x-1][$y+1], $grid[$x+1][$y-1]);
        }
    }
}

print $count;