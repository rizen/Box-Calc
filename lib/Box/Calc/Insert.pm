package Box::Calc::Insert;

use strict;
use warnings;
use Moose;

with 'Box::Calc::Role::Dimensional';

=head1 NAME

Box::Calc::Insert - Modify the internal size of the current box.

=head1 SYNOPSIS

 my $insert = Box::Calc::Insert->new(name => 'Apple', x => 3, y => 3.3, z => 4, weight => 5, well_x => 0.5, well_y => 0.5, well_z => 0, used_with_box => 'SmallBox', );

=head1 METHODS

=head2 new(params)

Constructor.

=over

=item params

=over

=item x

The width of your insert.

=item y

The length of your insert.

=item z

The thickness of your insert.

=item weight

The weight of your insert.

=item name

The name of your insert. If you're referring it back to an external system you may wish to use this field to store you insert ids instead of insert names.

=item well_x

The width of the internal well.

=item well_y

The length of the internal well.

=item well_z

The thickness of the internal well.

=item used_with_box

The name of the box this insert is designed for.   If used with a different box, then it should
be treated like any other C<Box::Calc::Item>

=back

=back

has [qw/well_x well_y well_z/] => (
    is          => 'rw',
    required    => 1,
    isa         => 'Num',
);


=head2 name

Returns the name of this insert.

=cut

has name => (
    is          => 'ro',
    isa         => 'Str',
    required    => 1,
);


has used_with_box => (
    is          => 'ro',
    isa         => 'Str',
    required    => 1,
);

=head2 describe

Returns all the important details about this insert as a hash reference.

=cut

sub describe {
    my $self = shift;
    return {
        name    => $self->name,
        weight  => $self->weight,
        x       => $self->x,
        y       => $self->y,
        z       => $self->z,
        well_x  => $self->well_x,
        well_y  => $self->well_y,
        well_z  => $self->well_z,
        used_with_box => $self->used_with_box,
    };
}

=head1 ROLES

This class installs L<Box::Calc::Role::Dimensional>.

=cut

no Moose;
__PACKAGE__->meta->make_immutable;

