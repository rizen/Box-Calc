use Test::More;
use Test::Deep;
use Ouch;

use lib '../lib';
use 5.010;

use_ok 'Box::Calc';
use_ok 'Box::Calc::Insert';

my $calc = Box::Calc->new();

my $box_type = $calc->add_box_type({
    x => 5.5,
    y => 3.5,
    z => 1,
    weight => 2,
    name => 'Display Deck Box',
});

isa_ok $box_type, 'Box::Calc::BoxType';
is $calc->count_box_types, 1, 'Added one box type to calc';

my $item = $calc->add_item(50,
    x => 2.75,
    y => 4.75,
    z => 0.01,
    name => 'Card from Deck',
    weight => 0.1,
);
isa_ok $item, 'Box::Calc::Item';
is $calc->count_items, 50, 'Added a bunch of cards';

my $insert = $calc->add_insert(
    name => 'Insert',
    x => 5.5,
    y => 3.5,
    z => 1,
    well_x => 2.75,
    well_y => 4.75,
    well_z => 1.00,
    weight => 0.5,
    used_with_box => 'Display Deck Box',
);
isa_ok $insert, 'Box::Calc::Insert';

my $object = $calc->add_insert(
    name => 'Second Insert',
    x => 5.5,
    y => 3.5,
    z => 1,
    well_x => 2.75,
    well_y => 4.75,
    well_z => 1.00,
    weight => 0.5,
    used_with_box => 'Display Deck Box',
);
isa_ok $object, 'Box::Calc::Item', 'Second insert gets packed';
is $calc->count_items, 51, 'Shows up in list of items';

$calc->reset_items;
$calc->reset_boxes;

my $item = $calc->add_item(50,
    x => 2.75,
    y => 4.75,
    z => 0.01,
    name => 'Card from Deck',
    weight => 0.1,
);
is $calc->count_items, 50, 'Added a bunch of cards, again';
$calc->pack_items();
is $calc->count_boxes, 1, 'only one box was used';
is $calc->used_insert, 1, 'The insert was used';

note explain $calc->packing_list;

done_testing;