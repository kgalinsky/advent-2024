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

# set up directions
my @D;
for (my $x = -1; $x < 2; $x++) {
    for (my $y = -1; $y < 2; $y++) {
        if (($x != 0) or ($y != 0)) {
            push @D, [$x, $y];
        }
    }
}

# finding function

my @find = qw/ X M A S /;

sub test ($$$$) {
    my ($i, $x, $y, $d) = @_;;
    
    return 0 if (
        ($x == -1) or ($x == $X) or
        ($y == -1) or ($y == $Y) or
        ($grid[$x][$y] ne $find[$i])
    );

    $i++;

    return 1 if ($i == @find);

    test($i, $x + $d->[0], $y + $d->[1], $d);
}

# look through grid

my $count = 0;

for (my $x = 0; $x < $X; $x++) {
    for (my $y = 0; $y < $Y; $y++) {
        foreach my $d (@D) {
            my $found = test(0, $x, $y, $d);
            $count += $found;
        }
    }
}

print $count;
