package Box::Calc::Item;

use strict;
use warnings;
use Moose;

=head1 NAME

Box::Calc::Item - The container class for the items you wish to pack.

=head1 SYNOPSIS

 my $item = Box::Calc::Item->new(name => 'Apple', x => 3, y => 3.3, z => 4, weight => 5);

=head1 METHODS

=head2 new(params)

Constructor.

=over

=item params

=over

=item x

The width of your item.

=item y

The length of your item.

=item z

The thickness of your item.

=item weight

The weight of your item.

=item name

The name of your item. If you're referring it back to an external system you may wish to use this field to store you item ids instead of item names.

=item quantity

Defaults to 1. The number of copies of this item that need to be packed.

=back

=back

=cut

has quantity => (
    is          => 'ro',
    default     => 1,
    isa         => 'Num',
);

has x => (
    is          => 'ro',
    required    => 1,
    isa         => 'Num',
);

has y => (
    is          => 'ro',
    required    => 1,
    isa         => 'Num',
);

has z => (
    is          => 'ro',
    required    => 1,
    isa         => 'Num',
);

has weight => (
    is          => 'ro',
    isa         => 'Num',
    required    => 1,
);

has name => (
    is          => 'ro',
    isa         => 'Str',
    required    => 1,
);


no Moose;
__PACKAGE__->meta->make_immutable;

