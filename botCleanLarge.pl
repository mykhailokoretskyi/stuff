#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use Data::Dumper qw(Dumper);

use constant LEFT => "LEFT\n";
use constant RIGHT => "RIGHT\n";
use constant UP => "UP\n";
use constant DOWN => "DOWN\n";

sub debug {
    print shift . "\n";
}

sub getDirtyCells($$){
    my ($row, $rowIndex) = @_;
    my @cells;

    my @array = split '', $row;
    for (my $i = 0; $i < scalar @array; ++$i) {
        push @cells, Point->new($i, $rowIndex)
            if $array[$i] eq 'd';
    }

    return wantarray ? @cells : \@cells;
}

sub next_move($$$$$) {
    #add logic here
    my ($posY, $posX, $sizeY, $sizeX, $board) = @_;

    my $bot = Point->new($posX, $posY);
    my @dirtyCells;

    for (my $i = 0; $i < scalar @$board; ++$i){
        push(
            @dirtyCells,
            getDirtyCells($board->[$i], $i)
        );
    }

    debug Dumper \@dirtyCells;
}
#player id input
my $pos = <>;
chomp($pos);
my $dim = <>;
chomp($dim);
my @dim = split(' ',$dim);
my @board;
for (my $i=0;$i<$dim[0];$i++) {
    $board[$i] = <>;
    chomp $board[$i];
}
my @pos = split(' ',$pos);
next_move($pos[0], $pos[1], $dim[0], $dim[1], \@board);

package Point;

sub new {
    my ($class, $x, $y) = @_;

    my $self = {
        x => $x || 0,
        y => $y || 0
    };

    bless $self, $class;
}

1;
