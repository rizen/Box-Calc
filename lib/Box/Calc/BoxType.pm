package Box::Calc::BoxType;

use strict;
use warnings;
use Moose;
use Ouch;

=head1 NAME

Box::Calc::BoxType - The container class for the types (sizes) of boxes that can be used for packing.

=head1 SYNOPSIS

 my $item = Box::Calc::BoxType->new(name => 'Apple', x => 3, y => 3.3, z => 4, weight => 5 );

=head1 METHODS

=head2 new(params)

Constructor.

=over

=item params

=over

=item x

The width of your box.

=item y

The length of your box.

=item z

The thickness of your box.

=item weight

The weight of the empty box.

=item name

The name of your box.

=item compatible_services

An array reference of shipping services this box is compatible with. See the complete list of services at L<http://api.boxcalc.net>. This is only necessary if you'r e using the C<shipping_options> method. 

=back

=back


=cut


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

has compatible_services => (
    is          => 'ro',
    isa         => 'ArrayRef',
    default     => sub {[]},
);


no Moose;
__PACKAGE__->meta->make_immutable;
